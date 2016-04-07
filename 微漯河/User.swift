//
//  User.swift
//  fitfit
//
//  Created by Phoebe Xie on 29/10/15.
//  Copyright © 2015 iAPPS Pte Ltd. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    static var id : Int!
    static var name : String!
    static var mobile_no : Int!
    static var email : String!
    static var gender : String!
    static var dob : String!
    static var address : String!
    static var unit_no: String!
    static var postal_code: String!
    static var profile_img_url : String?
    static var full_name : String?
    static var receive_newsletter : String!
    
    static var user_type: String!
    static var status : String!
    
    static var accessToken : String?
    static var encryptPassword : String!
    
    static func getImg(profile_img_url: String?) -> UIImage? {
        
        if profile_img_url != nil {
            let url = NSURL(string: profile_img_url!)
            let data = NSData(contentsOfURL: url!)
            if(data != nil){
                return UIImage(data: data!)!
            }
            else {
                return nil
            }
        }
        return nil
    }
}