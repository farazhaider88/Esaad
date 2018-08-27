
import UIKit

typealias DefaultAPIFailureClosure = (NSError) -> Void
typealias DefaultAPISuccessClosure = (Dictionary<String,AnyObject>) -> Void
typealias DefaultBoolResultAPISuccesClosure = (Bool) -> Void
typealias DefaultArrayResultAPISuccessClosure = (Array<AnyObject>) -> Void
typealias DefaultImageResultClosure = (UIImage) -> Void


protocol APIErrorHandler {
    func handleErrorFromResponse(response: Dictionary<String,AnyObject>)
    func handleErrorFromERror(error:NSError)
}


class APIManager: NSObject {
    

    static let sharedInstance = APIManager()
    
    var serverToken: String?  = ""
    
//    let usersAPIManager = UsersAPIManager()
//    let notificationApiManager = NotificationApiManager()
//    let cMSApiManager = CMSApiManager()
//    let rideApiManager = RideApiManager()
    
}
