//
//  SettingViewController.swift
//  Esaad
//
//  Created by Faraz Haider on 28/08/2018.
//  Copyright © 2018 Faraz Haider. All rights reserved.
//

import UIKit
import MOLH

class SettingViewController: UIViewController {

    @IBOutlet weak var buttonChangeLanguage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        buttonChangeLanguage.setTitle(Utility.getLocalizedString("TextToLocalize"), for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionChangeLanguage(_ sender: Any) {
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        MOLH.reset()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
