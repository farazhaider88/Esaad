//
//  BaseNavigationController.swift
//  Versole
//
//  Created by Soomro Shahid on 2/20/16.
//  Copyright © 2016 Muzamil Hassan. All rights reserved.
//

import UIKit

class LoginModuleNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Change navigationbar color
        //self.navigationBar.barTintColor = UIColor.yellow
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.tintColor = UIColor.white

        
        //Change navigation bar title color
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
}
