import UIKit
import RealmSwift
import RMMapper
class AppStateManager: NSObject {

    
    static let sharedInstance = AppStateManager()
    var loggedInUser: UserModel!
    var isUserLoggedIn = false
   

    override init() {
        super.init()
        let defaults = Constants.USER_DEFAULTS
        if let user = defaults.rm_customObject(forKey: "User") as? UserModel {
            self.loggedInUser = user
            self.isUserLoggedIn = true
        }else {
            self.isUserLoggedIn = false
        }
    }
    
    func logOutUser()   {
        self.isUserLoggedIn = false
        self.loggedInUser = nil
        let defauls = Constants.USER_DEFAULTS
        defauls.removeObject(forKey: "User")
        UserDefaults.standard.set(false, forKey: "tokenUpdated")
     }
    
    func loginUser(user: UserModel) {
        let defauls = Constants.USER_DEFAULTS
        defauls.rm_setCustomObject(user, forKey: "User")
        self.loggedInUser = user
        self.isUserLoggedIn = true
    }
}
