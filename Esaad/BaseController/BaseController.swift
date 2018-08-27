//
//  BaseController.swift
//  Template
//
//  Created by Muzamil Hassan on 02/01/2017.
//  Copyright © 2017 Muzamil Hassan. All rights reserved.
//

import UIKit
import RESideMenu

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if self.navigationController?.viewControllers.count == 1 {
            
            self.addSideMenuBarButtonItem()
            
        } else {
            
            self.addBackBarButtonItem()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addSideMenuBarButtonItem() {
        let image = UIImage(named: "dropdown")
        let side = UIBarButtonItem(image: image,
                                       style: .plain,
                                       target: self,
                                       action: #selector(onBtnSideMenu))
        
        self.navigationItem.leftBarButtonItem = side
    }
    func addEditMenuBarButtonItem() {
        let image = #imageLiteral(resourceName: "edit")
        let side = UIBarButtonItem(image: image,
                                   style: .plain,
                                   target: self,
                                   action: #selector(onBtnEdit))
        
        self.navigationItem.rightBarButtonItem = side
    }
    
    func addBackBarButtonItem() {
        let image = UIImage(named: "back")
        let backItem = UIBarButtonItem(image: image,
                                       style: .plain,
                                       target: self,
                                       action: #selector(onBtnBack))
        
        self.navigationItem.leftBarButtonItem = backItem
    }
    
    func addNotificationBarButtonItem() {
        let image = UIImage(named: "bell")
        let searchItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(onBtnNotification))
        
        self.navigationItem.rightBarButtonItem = searchItem
    }
    func addTickBarButtonItem() {
        let image = UIImage(named: "tick")
        let searchItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(onBtnTick))
        
        self.navigationItem.rightBarButtonItem = searchItem
    }
    
    func addTitle(title: String) {
        self.navigationController?.navigationBar.topItem?.title = title
    }
    
    @objc func onBtnNotification() {
    }
    
    @objc func onBtnSideMenu()  {
        self.sideMenuViewController.presentLeftMenuViewController()
    }
    
    @objc func onBtnTick() {
    
    }
    
    @objc func onBtnEdit() {
        
    }
    
    @IBAction func onBtnBack() {
        _ = self.navigationController?.popViewController(animated: true)
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
