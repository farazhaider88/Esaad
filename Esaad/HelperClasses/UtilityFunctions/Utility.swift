//
//  Utility.swift
//  Template
//
//  Created by Muzamil Hassan on 02/01/2017.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import NVActivityIndicatorView
import MapKit
class Utility {
    
    func roundAndFormatFloat(floatToReturn : Float, numDecimalPlaces: Int) -> String{
        
        let formattedNumber = String(format: "%.\(numDecimalPlaces)f", floatToReturn)
        return formattedNumber
        
    }
    static func printFonts() {
        for familyName in UIFont.familyNames {
            print("\n-- \(familyName) \n")
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print(fontName)
            }
        }
    }

    func topViewController(base: UIViewController? = (Constants.APP_DELEGATE).window?.rootViewController) -> UIViewController? {
    
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
    
    static func showAlert(title:String?, message:String?) {
        let storyboard = AppStoryboard.PopupModule.instance
        let alert = storyboard.instantiateViewController(withIdentifier: "SimpleAlertVC") as! SimpleAlertVC
        alert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        alert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        alert.titleString = title ?? ""
        alert.descriptionString = message ?? ""
        Utility().topViewController()!.present(alert, animated: true){}
    }
    
    static func openMapForPlace(lat: Double, long: Double, name: String) {
        
        let latitude: CLLocationDegrees = lat
        let longitude: CLLocationDegrees = long
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name
        mapItem.openInMaps(launchOptions: options)
    }

    static func resizeImage(image: UIImage,  targetSize: CGFloat) -> UIImage {
        
        guard (image.size.width > 1024 || image.size.height > 1024) else {
            return image;
        }
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newRect: CGRect = CGRect.zero;
        
        if(image.size.width > image.size.height) {
            newRect.size = CGSize(width: targetSize, height: targetSize * (image.size.height / image.size.width))
        } else {
            newRect.size = CGSize(width: targetSize * (image.size.width / image.size.height), height: targetSize)
        }
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newRect.size, false, 1.0)
        image.draw(in: newRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    static func thumbnailForVideoAtURL(url: URL) -> UIImage? {
    
        let asset = AVAsset(url: url)
        let assetImageGenerator = AVAssetImageGenerator(asset: asset)
        assetImageGenerator.appliesPreferredTrackTransform=true
        
        var time = asset.duration
        time.value = min(time.value, 2)
        
        do {
            let imageRef = try assetImageGenerator.copyCGImage(at: time, actualTime: nil)
            return UIImage(cgImage: imageRef)
        } catch {
            print("error")
            return nil
        }
    }
    
    static func delay(delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    static func applyBlurEffectToView(toView: UIView) -> UIView? {
        //only apply the blur if the user hasn't disabled transparency effects
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            toView.backgroundColor = UIColor.clear
            
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = toView.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            toView.addSubview(blurEffectView)
            
            return blurEffectView
        } else {
            toView.backgroundColor = UIColor.black
            return nil
        }
    }
    
    static func showWillBeImplementedAlert() {
        showAlert(title: "Message", message: "This feature will be implemented in next build")
    }
    
    static func showLoader() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let size = CGSize(width: 50, height: 50)
        let bgColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        let activityData = ActivityData(size: size, message: "", messageFont: UIFont.systemFont(ofSize: 12), type: .ballClipRotate, color: Global.APP_COLOR, padding: 0, displayTimeThreshold: 0, minimumDisplayTime: 1, backgroundColor: bgColor, textColor: UIColor.black)
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData, nil)
    }
    
    static func hideLoader() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
    }
    static func openPhone(number:String) {
        if let url = URL(string: "tel://\(number)") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
