//
//  Constants.swift
//  Template
//
//  Created by Muzamil Hassan on 02/01/2017.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//
import UIKit
import Foundation


struct Global{

    static var APP_MANAGER                   = AppStateManager.sharedInstance
    static let APP_NAME                      = "mahalati"
    static let APP_COLOR                     = UIColor(red: 34/255, green: 119/255, blue: 124/255, alpha: 1.0)
    static let API_KEY_GOOGLE                = "AIzaSyCd4UUPJT0ian4rMyotNL-QHPJyby3z0Ls"
    //    static var USER                          = APP_MANAGER.loggedInUser
}

struct Constants{
    
    
    static let kFONT_WIDTH_FACTOR           = UIScreen.main.bounds.width / 414 //resize font according to screen size
    
    static let kWINDOW_FRAME                = UIScreen.main.bounds
    static let kSCREEN_SIZE                 = UIScreen.main.bounds.size
    static let kWINDOW_WIDTH                = UIScreen.main.bounds.size.width
    static let kWINDOW_HIEGHT               = UIScreen.main.bounds.size.height
    
    static let APP_DELEGATE                = UIApplication.shared.delegate as! AppDelegate
    static let UIWINDOW                    = UIApplication.shared.delegate!.window!
    
    static let USER_DEFAULTS               = UserDefaults.standard
    
    static let SINGLETON                   = Singleton.sharedInstance
    
    static let VALIDATION_FIELD_LENGTH                 = 300
    static let VALIDATION_PASSWORD_LENGTH              = 6
    static let VALIDATION_FIELD_LENGTH_QUANTITY        = 6
    static let VALIDATION_FIELD_LENGTH_PRICE           = 9
    
    static let VALIDATION_USERNAME_MIN                 = "Username must not be more than 15 characters and must not contain any space character."
    static let VALIDATION_VALID_NAME                   = "Please provide a valid name."
    static let VALIDATION_VALID_EMAIL                  = "Please provide a valid Email Address."
    static let VALIDATION_VALID_AGE                    = "Kindly provide a valid age."
    static let VALIDATION_NUMERIC_PHONE                = "Phone number must be numeric with at least 11 digits."
    static let VALIDATION_NUMERIC_CELL                 = "Cell number must be numeric with at least 11 digits."
    
    static let VALIDATION_PASSWORD_MIN                 = "Password should contain atlest 4 characters."
    static let VALIDATION_PASSWORD_MATCH               = "New password and confirm password does not match."
    static let FORGET_PASSWORD                         = "A password has been sent to your email Address!"
    static let PASSWORD_UPDATED                        = "Your Password has been updated"
    
    static let VALIDATION_MAX_FIELD_LENGTH             = "Field must not be more than 15 characters."
    static let VALIDATION_MAX_DESCRIPTION_LENGTH       = "Description must not be more than 300 characters."
    static let VALIDATION_ALL_FIELDS                   = "Kindly fill all the fields."
    static let VALIDATION_VALID_URL                    = "Please provide a valid URL."
    static let VALIDATION_VALID_FILE_NAME              = "Please provide a file name."
    
    static let VALIDATION_IMAGE                        = "Please provide an image."
    static let VALIDATION_TERMS                        = "Kindly select the terms and Conditions."
    
    static let PROFILE_UPDATED                         = "Your Profile has been updated."
    
    static let MESSAGE_LOGOUT                          = "Are you sure you want to logout?"
    
        
    //MARK: - Base URLs
    static let BaseURL = "http://35.160.175.165/portfolio/fast_cab/api"
    
//    static let BaseURLForSellers = "http://35.160.175.165/portfolio/mahalati/public/images/sellers/"
//    static let BaseURLForAdminPromotions = "http://35.160.175.165/portfolio/mahalati/public/images/promotions/"
//    static let BaseURLForGalleryImages = "http://35.160.175.165/portfolio/mahalati/public/images/menus/"
//    static let BaseURLForDealsImages = "http://35.160.175.165/portfolio/mahalati/public/images/deals/"
//    static let BaseURLForCategories = "http://35.160.175.165/portfolio/mahalati/public/images/categories/"
//    static let BaseURLForSubCategories = "http://35.160.175.165/portfolio/mahalati/public/images/categories/"
//    static let BaseURLForProduct = "http://35.160.175.165/portfolio/mahalati/public/images/products/"
//    static let BaseURLForHomeSeller = "http://35.160.175.165/portfolio/mahalati/public/images/account-types/"
    
    //MARK: - Users Routes
    static let login = "/user/login"
    static let register = "/user/register"
    static let forgotPassword = "/user/IosforgotPassword"//"/user/forgotpassword"
    static let facebookLogin = "/user/facebooklogin"
    static let changePassword = "/user/changepassword"
    static let getProfile = "/user/getprofile"
    static let logout = "/user/userlogout"
    static let verifyCode = "/user/verifycode"
    static let resetCode = "/user/resetcode"
    static let sendCode = "/user/sendcode"
    static let updateProfile = "/user/update"
    static let updateDeviceToken = "/user/updateDeviceToken"

    //MARK: - NotificationRoutes
    static let changeStatus = "/changepushnotificationstatus"
    static let getNotifications = "/getnotifications"
    
    //MARK: - CMS Routes
    static let getVehicleCat = "/cms/getvehicle"
    static let contactUs = "/cms/contactus"
    static let getCms = "/cms/getCms"
    static let driverMessages = "/cms/usermessage"
    static let cancelReasons = "/cms/cancel"
    static let userFeedback = "/driver/feedback"
    static let improveType = "/cms/getimpovetype"
    static let appFeedback = "/cms/appfeedback"
    
    //MARK: - Ride Routes
    static let submitPromoCode = "/ride/promocode"
    static let estimatedFare = "/ride/estimatedfare"
    static let approveRideDetail = "/ride/approveridedetail"
    static let createRide = "/ride/create"
    static let getNearbyDrivers = "/ride/driverSearch"
    static let rideStatus = "/ride/ridestatus"
    static let locationHistory = "/ride/ridehistoryios"
    static let upcomingRide = "/ride/userinprogressride"
    static let pastRide = "/ride/usercompleteride"
}
