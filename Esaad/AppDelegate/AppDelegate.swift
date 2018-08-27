//
//  AppDelegate.swift
//  Esaad
//
//  Created by Faraz Haider on 27/08/2018.
//  Copyright © 2018 Faraz Haider. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import GoogleMaps
import GooglePlaces
import RMMapper
import FBSDKCoreKit
import UserNotifications
import MOLH

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,MOLHResetable, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    let center = UNUserNotificationCenter.current()

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        //self.shiftToLogin()
        UIApplication.shared.applicationIconBadgeNumber = 0
        //Google
        GMSServices.provideAPIKey(Global.API_KEY_GOOGLE)
        GMSPlacesClient.provideAPIKey(Global.API_KEY_GOOGLE)
        //Google
        
        MOLH.shared.activate(true)
         center.delegate = self
        
        //facebook
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        
        //if open from notification
        if let notification = launchOptions?[.remoteNotification] as? [String: AnyObject] {
            let aps = notification["aps"] as! [String: AnyObject]
            //(window?.rootViewController as? UITabBarController)?.selectedIndex = 1
            //self.shiftToNotification()
        }
        //--- end Notification handling --
        self.registerForPushNotifications()
        //-- update token ----
        if let flag = UserDefaults.standard.object(forKey: "tokenUpdated") as? Bool {
            if !flag {
                if let token = UserDefaults.standard.object(forKey: "token") as? String {
                    self.processUpdateDeviceToken(token: token)
                }
            }
        }else {
            if let token = UserDefaults.standard.object(forKey: "token") as? String {
                self.processUpdateDeviceToken(token: token)
            }
        }
        //-- update token ----
        
        if AppStateManager.sharedInstance.isUserLoggedIn {
            self.shiftToHome()
        }else {
            self.shiftToLogin()
        }
        
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(
            app,
            open: url,
            sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String,
            annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //MARK: - Push Notification
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
            
            guard granted else { return }
            self.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        
        let token = tokenParts.joined()
        //print("Device Token: \(token)")
        //Utility.showAlert(title: "Device Token", message: "\(token)")
        UserDefaults.standard.set("\(token)", forKey: "token")
        self.processUpdateDeviceToken(token: token)
    }
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        print("Failed to register: \(error)")
        //Utility.showAlert(title: "Device Token Error", message: "\(error)")
    }
    func processUpdateDeviceToken(token: String) {
        /*if let user = AppStateManager.sharedInstance.loggedInUser {
            let params: [String:Any] = ["user_id": user.id ?? 0,
                                        "device_token": token,
                                        "device_type": "ios"]
            print(params)
            APIManager.sharedInstance.usersAPIManager.updateDeviceTokenWith(params: params, success: {
                response in
                UserDefaults.standard.set(true, forKey: "tokenUpdated")
                print("===========================================")
                print("Device Token Successfully updated on server.")
                print("===========================================")
            }, failure: {
                error in
                print(error.localizedDescription)
                UserDefaults.standard.set(false, forKey: "tokenUpdated")
            })
        }*/
    }
    
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable : Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        /*let aps = userInfo["aps"] as! [String: AnyObject]
        guard let type = aps["type"] as? String else { return }
        if type == "approve" {
            guard let rideId = aps["ride_id"] as? Int else { return }
            self.processGetRideInfo(rideId: rideId)
        }else if type == "tripstart" {
            UserDefaults.standard.set(true, forKey: "tripStarted")
            let notificationName = Notification.Name(rawValue: "TripStart")
            NotificationCenter.default.post(name: notificationName, object: nil)
        }else if type == "tripend" {
            UserDefaults.standard.removeObject(forKey: "CurrentRide")
            UserDefaults.standard.set(false, forKey: "tripStarted")
            let notificationName = Notification.Name(rawValue: "TripEnd")
            NotificationCenter.default.post(name: notificationName, object: nil)
        }*/
    }
    
    func shiftToLogin()  {
        /*let storyboard = AppStoryboard.LoginModule.instance
         let navigationController = LoginModuleNC(rootViewController: storyboard.instantiateViewController(withIdentifier: "LoginVC"))
         self.window?.rootViewController = navigationController*/
    }
    
    func shiftToHome()  {
       /* let storyboard = AppStoryboard.HomeModule.instance
        if let vc = storyboard.instantiateViewController(withIdentifier: "SideMenuRootVC") as? SideMenuRootVC {
            vc.backgroundImage = #imageLiteral(resourceName: "Bg")
            vc.rootState = RootState.Home
            self.window?.rootViewController = vc
        }*/
    }

    
    func reset() {
//        let rootviewcontroller: UIWindow = ((UIApplication.shared.delegate?.window)!)!
//        let nav = UINavigationController.init(rootViewController: HomeViewController.loadVC())
//        rootviewcontroller.rootViewController = nav
        
        /* let storyboard = AppStoryboard.HomeModule.instance
         if let vc = storyboard.instantiateViewController(withIdentifier: "SideMenuRootVC") as? SideMenuRootVC {
         vc.backgroundImage = #imageLiteral(resourceName: "Bg")
         vc.rootState = RootState.Home
         self.window?.rootViewController = vc
         }*/
    }
    
}
