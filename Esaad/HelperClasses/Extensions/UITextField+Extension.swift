//
//  UITextField+Extension.swift
//  Template
//
//  Created by Axact on 24/02/2017.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
}
