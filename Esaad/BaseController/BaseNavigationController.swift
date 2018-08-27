//
//  BaseNavigationController.swift
//  FastCab User
//
//  Created by Hassan Khan on 7/15/17.
//  Copyright © 2017 Hassan Khan. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Change navigationbar color
        self.navigationBar.barTintColor = UIColor(red: 5/255.0, green: 54/255.0, blue: 67/255.0, alpha: 1.0)//Global.APP_COLOR
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = UIColor.white
        

        //Change navigation bar title color
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

}
