//
//  LoginViewController.swift
//  Esaad
//
//  Created by Faraz Haider on 28/08/2018.
//  Copyright © 2018 Faraz Haider. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textFieldEmail.delegate = self
        textFieldPassword.delegate = self
    }

    @IBAction func actionLogin(_ sender: Any) {
        let email = self.textFieldEmail.text!
        let password = self.textFieldPassword.text!
        var msg = ""
        var title = ""
        
        if Validation.validateStringLength(email) {
            if Validation.isValidEmail(email) {
                if Validation.validateStringLength(password) {
                    self.processUserLogin()
                    return
                }else {
                    title = "Password"
                    msg = "Invalid password"
                }
            }else {
                title = "Email"
                msg = "Invalid email"
            }
        }else {
            title = "Email"
            msg = "Invalid email"
        }
        Utility.showAlert(title: title, message: msg)
    }
    
    @IBAction func actionForgotPassword(_ sender: UIButton) {
//        if let dvc =  self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordVC") as? ResetPasswordVC {
//            self.navigationController?.pushViewController(dvc, animated: true)
//        }
    }
    
    @IBAction func actionSignUp(_ sender: UIButton) {
//        if let dvc =  self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as? SignupVC {
//            self.navigationController?.pushViewController(dvc, animated: true)
//        }
    }
    
    //MARK: - Request
    func processUserLogin() {
//        Utility.showLoader()
//        let params: [String: Any] = ["email": self.textFieldEmail.text!,
//                                     "password": self.textFieldPassword.text!]
//        APIManager.sharedInstance.usersAPIManager.loginWith(params: params, success: {
//            (responseObject) in
//            Utility.hideLoader()
//            let response = responseObject as NSDictionary
//            let user = UserModel(object: response)
//            if user.isVerified == 0 {
//                if let dvc = self.storyboard?.instantiateViewController(withIdentifier: "VerifyPhoneVC") as? VerifyPhoneVC {
//                    dvc.phoneNumber = user.phoneNo ?? ""
//                    dvc.user = user
//                    self.navigationController?.pushViewController(dvc, animated: true)
//                }
//            }else {
                let appDelegate = Constants.APP_DELEGATE
//                AppStateManager.sharedInstance.loginUser(user: user)
                appDelegate.shiftToHome()
//            }
//        }, failure: {
//            (error) in
//            Utility.hideLoader()
//            Utility.showAlert(title: "Alert", message: error.localizedFailureReason!)
//        })
        
    }
    
    //MARK: - UITextField Delegate
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= AppConstants.textLimit
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
