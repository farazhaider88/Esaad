//
//  BaseClass.swift
//
//  Created by Hassan Khan on 7/31/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class UserModel: NSObject, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let state = "state"
    static let licenseNo = "license_no"
    static let promoCode = "promo_code"
    static let briefIntroduction = "brief_introduction"
    static let workHistory = "work_history"
    static let profileImage = "profile_image"
    static let latitude = "latitude"
    static let id = "id"
    static let code = "code"
    static let deviceToken = "device_token"
    static let password = "password"
    static let zipCode = "zip_code"
    static let longitude = "longitude"
    static let profilePicture = "profile_picture"
    static let avaibilityStatus = "avaibility_status"
    static let isVerified = "is_verified"
    static let city = "city"
    static let socialMediaPlatform = "social_media_platform"
    static let email = "email"
    static let socialMediaId = "social_media_id"
    static let fullName = "full_name"
    static let address = "address"
    static let gender = "gender"
    static let pushStatus = "push_status"
    static let totalRide = "total_ride"
    static let deviceType = "device_type"
    static let status = "status"
    static let roleId = "role_id"
    static let phoneNo = "phone_no"
    static let createdAt = "created_at"
    static let totalDistance = "total_distance"
    static let dob = "dob"
    static let rating = "average_rate"
  }

  // MARK: Properties
  public var state: String?
  public var licenseNo: String?
  public var promoCode: String?
  public var briefIntroduction: String?
  public var workHistory: String?
  public var profileImage: String?
  public var latitude: String?
  public var id: Int?
  public var code: String?
  public var deviceToken: String?
  public var password: String?
  public var zipCode: String?
  public var longitude: String?
  public var profilePicture: String?
  public var avaibilityStatus: Int?
  public var isVerified: Int?
  public var city: String?
  public var socialMediaPlatform: String?
  public var email: String?
  public var socialMediaId: String?
  public var fullName: String?
  public var address: String?
  public var gender: String?
  public var pushStatus: Int?
  public var totalRide: Int?
  public var deviceType: String?
  public var status: Int?
  public var roleId: Int?
  public var phoneNo: String?
  public var createdAt: String?
  public var totalDistance: Int?
  public var dob: String?
  public var rating : Int?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    state = json[SerializationKeys.state].string
    licenseNo = json[SerializationKeys.licenseNo].string
    promoCode = json[SerializationKeys.promoCode].string
    briefIntroduction = json[SerializationKeys.briefIntroduction].string
    workHistory = json[SerializationKeys.workHistory].string
    profileImage = json[SerializationKeys.profileImage].string
    latitude = json[SerializationKeys.latitude].string
    id = json[SerializationKeys.id].int
    code = json[SerializationKeys.code].string
    deviceToken = json[SerializationKeys.deviceToken].string
    password = json[SerializationKeys.password].string
    zipCode = json[SerializationKeys.zipCode].string
    longitude = json[SerializationKeys.longitude].string
    profilePicture = json[SerializationKeys.profilePicture].string
    avaibilityStatus = json[SerializationKeys.avaibilityStatus].int
    isVerified = json[SerializationKeys.isVerified].int
    city = json[SerializationKeys.city].string
    socialMediaPlatform = json[SerializationKeys.socialMediaPlatform].string
    email = json[SerializationKeys.email].string
    socialMediaId = json[SerializationKeys.socialMediaId].string
    fullName = json[SerializationKeys.fullName].string
    address = json[SerializationKeys.address].string
    gender = json[SerializationKeys.gender].string
    pushStatus = json[SerializationKeys.pushStatus].int
    rating = json[SerializationKeys.rating].int
    totalRide = json[SerializationKeys.totalRide].int
    deviceType = json[SerializationKeys.deviceType].string
    status = json[SerializationKeys.status].int
    roleId = json[SerializationKeys.roleId].int
    phoneNo = json[SerializationKeys.phoneNo].string
    createdAt = json[SerializationKeys.createdAt].string
    totalDistance = json[SerializationKeys.totalDistance].int
    dob = json[SerializationKeys.dob].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = state { dictionary[SerializationKeys.state] = value }
    if let value = licenseNo { dictionary[SerializationKeys.licenseNo] = value }
    if let value = promoCode { dictionary[SerializationKeys.promoCode] = value }
    if let value = briefIntroduction { dictionary[SerializationKeys.briefIntroduction] = value }
    if let value = workHistory { dictionary[SerializationKeys.workHistory] = value }
    if let value = profileImage { dictionary[SerializationKeys.profileImage] = value }
    if let value = latitude { dictionary[SerializationKeys.latitude] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = code { dictionary[SerializationKeys.code] = value }
    if let value = deviceToken { dictionary[SerializationKeys.deviceToken] = value }
    if let value = password { dictionary[SerializationKeys.password] = value }
    if let value = zipCode { dictionary[SerializationKeys.zipCode] = value }
    if let value = longitude { dictionary[SerializationKeys.longitude] = value }
    if let value = profilePicture { dictionary[SerializationKeys.profilePicture] = value }
    if let value = avaibilityStatus { dictionary[SerializationKeys.avaibilityStatus] = value }
    if let value = isVerified { dictionary[SerializationKeys.isVerified] = value }
    if let value = city { dictionary[SerializationKeys.city] = value }
    if let value = socialMediaPlatform { dictionary[SerializationKeys.socialMediaPlatform] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = socialMediaId { dictionary[SerializationKeys.socialMediaId] = value }
    if let value = fullName { dictionary[SerializationKeys.fullName] = value }
    if let value = address { dictionary[SerializationKeys.address] = value }
    if let value = gender { dictionary[SerializationKeys.gender] = value }
    if let value = pushStatus { dictionary[SerializationKeys.pushStatus] = value }
    if let value = totalRide { dictionary[SerializationKeys.totalRide] = value }
    if let value = rating {dictionary[SerializationKeys.rating] = value }
    if let value = deviceType { dictionary[SerializationKeys.deviceType] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = roleId { dictionary[SerializationKeys.roleId] = value }
    if let value = phoneNo { dictionary[SerializationKeys.phoneNo] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = totalDistance { dictionary[SerializationKeys.totalDistance] = value }
    if let value = dob { dictionary[SerializationKeys.dob] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.state = aDecoder.decodeObject(forKey: SerializationKeys.state) as? String
    self.licenseNo = aDecoder.decodeObject(forKey: SerializationKeys.licenseNo) as? String
    self.promoCode = aDecoder.decodeObject(forKey: SerializationKeys.promoCode) as? String
    self.briefIntroduction = aDecoder.decodeObject(forKey: SerializationKeys.briefIntroduction) as? String
    self.workHistory = aDecoder.decodeObject(forKey: SerializationKeys.workHistory) as? String
    self.profileImage = aDecoder.decodeObject(forKey: SerializationKeys.profileImage) as? String
    self.latitude = aDecoder.decodeObject(forKey: SerializationKeys.latitude) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.code = aDecoder.decodeObject(forKey: SerializationKeys.code) as? String
    self.deviceToken = aDecoder.decodeObject(forKey: SerializationKeys.deviceToken) as? String
    self.password = aDecoder.decodeObject(forKey: SerializationKeys.password) as? String
    self.zipCode = aDecoder.decodeObject(forKey: SerializationKeys.zipCode) as? String
    self.longitude = aDecoder.decodeObject(forKey: SerializationKeys.longitude) as? String
    self.profilePicture = aDecoder.decodeObject(forKey: SerializationKeys.profilePicture) as? String
    self.avaibilityStatus = aDecoder.decodeObject(forKey: SerializationKeys.avaibilityStatus) as? Int
    self.isVerified = aDecoder.decodeObject(forKey: SerializationKeys.isVerified) as? Int
    self.city = aDecoder.decodeObject(forKey: SerializationKeys.city) as? String
    self.socialMediaPlatform = aDecoder.decodeObject(forKey: SerializationKeys.socialMediaPlatform) as? String
    self.email = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
    self.socialMediaId = aDecoder.decodeObject(forKey: SerializationKeys.socialMediaId) as? String
    self.fullName = aDecoder.decodeObject(forKey: SerializationKeys.fullName) as? String
    self.address = aDecoder.decodeObject(forKey: SerializationKeys.address) as? String
    self.gender = aDecoder.decodeObject(forKey: SerializationKeys.gender) as? String
    self.pushStatus = aDecoder.decodeObject(forKey: SerializationKeys.pushStatus) as? Int
    self.totalRide = aDecoder.decodeObject(forKey: SerializationKeys.totalRide) as? Int
    self.deviceType = aDecoder.decodeObject(forKey: SerializationKeys.deviceType) as? String
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.roleId = aDecoder.decodeObject(forKey: SerializationKeys.roleId) as? Int
    self.phoneNo = aDecoder.decodeObject(forKey: SerializationKeys.phoneNo) as? String
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
    self.totalDistance = aDecoder.decodeObject(forKey: SerializationKeys.totalDistance) as? Int
    self.dob = aDecoder.decodeObject(forKey: SerializationKeys.dob) as? String
  self.rating = aDecoder.decodeObject(forKey: SerializationKeys.rating) as? Int
    }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(state, forKey: SerializationKeys.state)
    aCoder.encode(licenseNo, forKey: SerializationKeys.licenseNo)
    aCoder.encode(promoCode, forKey: SerializationKeys.promoCode)
    aCoder.encode(briefIntroduction, forKey: SerializationKeys.briefIntroduction)
    aCoder.encode(workHistory, forKey: SerializationKeys.workHistory)
    aCoder.encode(profileImage, forKey: SerializationKeys.profileImage)
    aCoder.encode(latitude, forKey: SerializationKeys.latitude)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(code, forKey: SerializationKeys.code)
    aCoder.encode(deviceToken, forKey: SerializationKeys.deviceToken)
    aCoder.encode(password, forKey: SerializationKeys.password)
    aCoder.encode(zipCode, forKey: SerializationKeys.zipCode)
    aCoder.encode(longitude, forKey: SerializationKeys.longitude)
    aCoder.encode(profilePicture, forKey: SerializationKeys.profilePicture)
    aCoder.encode(avaibilityStatus, forKey: SerializationKeys.avaibilityStatus)
    aCoder.encode(isVerified, forKey: SerializationKeys.isVerified)
    aCoder.encode(city, forKey: SerializationKeys.city)
    aCoder.encode(socialMediaPlatform, forKey: SerializationKeys.socialMediaPlatform)
    aCoder.encode(email, forKey: SerializationKeys.email)
    aCoder.encode(socialMediaId, forKey: SerializationKeys.socialMediaId)
    aCoder.encode(fullName, forKey: SerializationKeys.fullName)
    aCoder.encode(address, forKey: SerializationKeys.address)
    aCoder.encode(gender, forKey: SerializationKeys.gender)
    aCoder.encode(pushStatus, forKey: SerializationKeys.pushStatus)
    aCoder.encode(totalRide, forKey: SerializationKeys.totalRide)
    aCoder.encode(deviceType, forKey: SerializationKeys.deviceType)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(roleId, forKey: SerializationKeys.roleId)
    aCoder.encode(phoneNo, forKey: SerializationKeys.phoneNo)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
    aCoder.encode(totalDistance, forKey: SerializationKeys.totalDistance)
    aCoder.encode(dob, forKey: SerializationKeys.dob)
    aCoder.encode(rating, forKey: SerializationKeys.rating)
  }

}
