

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
enum Route: String {
    case Register = "/portfolio/albacars/api/register"
    case Login = "/portfolio/albacars/api/login"
    
    func url() -> String{
        return Constants.BaseURL + self.rawValue
    }
}

class APIManagerBase: NSObject {
    
    let baseURL = Constants.BaseURL
    let defaultRequestHeader = ["Content-Type": "application/json"]
    let defaultError = NSError(domain: "Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Request Failed."])
    
    
    func getAuthorizationHeader () -> Dictionary<String,String>{
        
        if let token = APIManager.sharedInstance.serverToken {
            return ["token":token,"Content-Type":"application/json"]
        }
        
        return ["Content-Type":"application/json"]
    }
    
    func getErrorFromResponseData(data: Data) -> NSError? {
        do{
            let result = try JSONSerialization.jsonObject(with: data,options: JSONSerialization.ReadingOptions.mutableContainers) as? Array<Dictionary<String,AnyObject>>
            if let message = result?[0]["message"] as? String{
                let error = NSError(domain: "Error", code: 0, userInfo: [NSLocalizedDescriptionKey: message])
                return error;
            }
        }catch{
            NSLog("Error: \(error)")
        }
        return nil
    }
    
    func URLforRoute(route: String,params:[String: String]) -> NSURL? {
        
        if let components: NSURLComponents  = NSURLComponents(string: (Constants.BaseURL+route)){
            var queryItems = [NSURLQueryItem]()
            for(key,value) in params{
                queryItems.append(NSURLQueryItem(name:key,value: value))
            }
            components.queryItems = queryItems as [URLQueryItem]?
            
            return components.url as NSURL?
        }
        return nil;
    }
    
    func POSTURLforRoute(route:String) -> URL?{
        
        if let components: NSURLComponents = NSURLComponents(string: (Constants.BaseURL+route)){
            return components.url! as URL
        }
        return nil
    }
    
    func GETURLfor(route:String) -> URL?{
        
        if let components: NSURLComponents = NSURLComponents(string: (Constants.BaseURL+route)){
            return components.url! as URL
        }
        return nil
    }
    func postRequestWithMultipartForCreateRequest(route: URL,parameters: Parameters, images: [UIImage],
                                                  success:@escaping DefaultAPISuccessClosure,
                                                  failure:@escaping DefaultAPIFailureClosure){
        Alamofire.upload (
            multipartFormData: { multipartFormData in
                for (key , value) in parameters {
                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName: key)
                }
                for item in images {
                    let image = UIImageJPEGRepresentation(item, 0.2)
                    if let data:Data = image {
                        multipartFormData.append(data, withName: "images[]", fileName: "fileName.jpg", mimeType: data.mimeType)
                    }
                }
                
        },
            to: route,
            encodingCompletion: { result in
                switch result {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        self.responseResult(response, success: {result in
                            
                            success(result as! Dictionary<String, AnyObject>)
                        }, failure: {error in
                            
                            failure(error)
                        })
                    }
                case .failure(let encodingError):
                    failure(encodingError as NSError)
                }
        }
        )
    }
    
    func postRequestWithMultipart(route: URL,parameters: Parameters,
                                  success:@escaping DefaultAPISuccessClosure,
                                  failure:@escaping DefaultAPIFailureClosure){
        Alamofire.upload (
            multipartFormData: { multipartFormData in
                for (key , value) in parameters {
                    if let data:Data = value as? Data {
                        multipartFormData.append(data, withName: key, fileName: "fileName.jpeg", mimeType: "image/jpeg")
                    } else {
                        multipartFormData.append("\(value)".data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName: key)
                    }
                }
                
        },
            to: route,
            encodingCompletion: { result in
                switch result {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        self.responseResult(response, success: {result in
                            
                            success(result as! Dictionary<String, AnyObject>)
                        }, failure: {error in
                            
                            failure(error)
                        })
                    }
                case .failure(let encodingError):
                    failure(encodingError as NSError)
                }
        }
        )
    }
    
    func postRequestWith(route: URL,parameters: Parameters,
                         success:@escaping DefaultAPISuccessClosure,
                         failure:@escaping DefaultAPIFailureClosure, withHeaders:Bool){
        
        if withHeaders {
            Alamofire.request(route, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: getAuthorizationHeader()).responseJSON{
                response in
                
                self.responseResult(response, success: {response in
                    
                    success(response as! Dictionary<String, AnyObject>)
                }, failure: {error in
                    
                    failure(error as NSError)
                })
            }
        }else {
            Alamofire.request(route, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{
                response in
                
                self.responseResult(response, success: {response in
                    
                    success(response as! Dictionary<String, AnyObject>)
                }, failure: {error in
                    
                    failure(error as NSError)
                })
            }
        }
    }
    
    func getRequestWith(route: URL,parameters: Parameters,
                        success:@escaping DefaultAPISuccessClosure,
                        failure:@escaping DefaultAPIFailureClosure){
        
        Alamofire.request(route, method: .get, parameters: parameters).responseJSON{
            response in
            self.responseResult(response, success: {response in
                
                success(response as! Dictionary<String, AnyObject>)
            }, failure: {error in
                
                failure(error as NSError)
            })
            
            
        }
    }
    func getRequestArrayWith(route: URL,parameters: Parameters,
                             success:@escaping DefaultArrayResultAPISuccessClosure,
                             failure:@escaping DefaultAPIFailureClosure) {
        Alamofire.request(route, method: .get, parameters: parameters).responseJSON{
            response in
            self.responseResult(response, success: { response in
                success(response as! (Array<AnyObject>))
            }, failure: {error in
                failure(error as NSError)
            })
        }
    }
    func getRequestArrayWithTemp(route: URL,parameters: Parameters,
                                 success:@escaping DefaultArrayResultAPISuccessClosure,
                                 failure:@escaping DefaultAPIFailureClosure) {
        Alamofire.request(route, method: .get, parameters: parameters).responseJSON{
            response in
            self.responseResult(response, success: { response in
                success(response as! (Array<AnyObject>))
            }, failure: {error in
                failure(error as NSError)
            })
        }
    }
    func putRequestWith(route: URL,parameters: Parameters,
                        success:@escaping DefaultAPISuccessClosure,
                        failure:@escaping DefaultAPIFailureClosure){
        
        Alamofire.request(route, method: .put, parameters: parameters, encoding: JSONEncoding.default).responseJSON{
            response in
            
            self.responseResult(response, success: {response in
                
                success(response as! Dictionary<String, AnyObject>)
            }, failure: {error in
                
                failure(error as NSError)
            })
        }
    }
    
    func deleteRequestWith(route: URL,parameters: Parameters,
                           success:@escaping DefaultAPISuccessClosure,
                           failure:@escaping DefaultAPIFailureClosure){
        
        Alamofire.request(route, method: .delete, parameters: parameters, encoding: JSONEncoding.default).responseJSON{
            response in
            
            self.responseResult(response, success: {response in
                
                success(response as! Dictionary<String, AnyObject>)
            }, failure: {error in
                
                failure(error as NSError)
            })
        }
    }
    func deleteRequestWithT(endPoint: String, success:@escaping DefaultAPISuccessClosure, failure:@escaping DefaultAPIFailureClosure) {
        Alamofire.request(endPoint, method: .delete, headers:getAuthorizationHeader())
            .responseJSON { response in
                self.responseResult(response, success: {response in
                    
                    success(response as! Dictionary<String, AnyObject>)
                }, failure: {error in
                    
                    failure(error as NSError)
                })
        }
    }
    
    func downloadImageT(route: String, success:@escaping DefaultImageResultClosure) {
        Alamofire.request(route).responseImage { response in
            self.responseImage(response, success: success)
        }
    }
    fileprivate func responseImage(_ response: DataResponse<UIImage>, success: @escaping (_ response: UIImage) -> Void) {
        if let image = response.result.value {
            print(image)
            success(image)
        }
    }
    
    //MARK: - Response Handling
    fileprivate func responseResult(_ response:DataResponse<Any>,
                                    success: @escaping (_ response: AnyObject) -> Void,
                                    failure: @escaping (_ error: NSError) -> Void
        ) {
        switch response.result
        {
        case .success:
            if let dictData = response.result.value as? NSDictionary {
                
                let errorCode:Int = (dictData["Error"] as? Int) ?? 0;
                
                if (dictData["Response"] as! String == "2000") {
                    //Success
                    success(dictData["Result"] as AnyObject)
                } else {
                    //Failure
                    let errorMessage: String = (dictData["Message"] as? String) ?? "Unknown error";
                    let userInfo = [NSLocalizedFailureReasonErrorKey: errorMessage]
                    
                    let error = NSError(domain: "Domain", code: errorCode, userInfo: userInfo)
                    failure(error)
                    //Utility.showAlert(title: "Alert", message: error.localizedFailureReason!)
                }
            } else {
                //Failure
                let errorMessage: String = "Unknown error";
                let userInfo = [NSLocalizedFailureReasonErrorKey: errorMessage]
                let error = NSError(domain: "Domain", code: 0, userInfo: userInfo);
                
                failure(error)
            }
            
        case .failure(let error):
            failure(error as NSError)
        }
    }
    
    fileprivate func multipartFormData(parameters: Parameters) {
        let formData: MultipartFormData = MultipartFormData()
        if let params:[String:AnyObject] = parameters as [String : AnyObject]? {
            for (key , value) in params {
                
                if let data:Data = value as? Data {
                    formData.append(data, withName: key, fileName: "fileName", mimeType: data.mimeType)
                } else {
                    formData.append("\(value)".data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName: key)
                }
            }
        }
    }
}


public extension Data {
    public var mimeType:String {
        get {
            var c = [UInt32](repeating: 0, count: 1)
            (self as NSData).getBytes(&c, length: 1)
            switch (c[0]) {
            case 0xFF:
                return "image/jpeg";
            case 0x89:
                return "image/png";
            case 0x47:
                return "image/gif";
            case 0x49, 0x4D:
                return "image/tiff";
            case 0x25:
                return "application/pdf";
            case 0xD0:
                return "application/vnd";
            case 0x46:
                return "text/plain";
            default:
                print("mimeType for \(c[0]) in available");
                return "application/octet-stream";
            }
        }
    }
}
