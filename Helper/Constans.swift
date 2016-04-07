//
//  GlobalVar.swift
//  iChat
//
//  Created by iAPPS Pte Ltd on 05/01/16.
//  Copyright © 2016年 iAPPS Pte Ltd. All rights reserved.
//

import Foundation
import UIKit


//*****************-- GET VIEW CONTROLLER FROM STORY BOARD --**************//


func GET_VIEW_CONTROLLER(identifier:String)->UIViewController {
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    return mainStoryboard.instantiateViewControllerWithIdentifier(identifier)
}

//*****************-- OVERRIDE UICOLOR --**************//

func RGBA_ALPHA (R:CGFloat, G:CGFloat, B:CGFloat, A:CGFloat)->UIColor {
    return UIColor.init(red: R/255.0, green: G/255.0, blue:  B/255.0, alpha: A)
}


struct Colors {
    static let Yellow = UIColor(red: 253/255, green: 173/255, blue: 30/255, alpha: 1.0)
    static let PrimaryColor = UIColor(red: 226/255.0, green: 0/255.0, blue: 103/255.0, alpha: 1.0)
    static let SecondaryColor = UIColor(red: 102/255.0, green: 255/255.0, blue: 204/255.0, alpha: 1.0)
    static let ButtonColor = UIColor(red: 102/255.0, green: 255/255.0, blue: 204/255.0, alpha: 1.0)
    static let GreenColor = UIColor(red: 0/255.0, green: 173/255.0, blue: 1/255.0, alpha: 1.0)
    
    static let InitColor = UIColor(red: 226/255.0, green: 0/255.0, blue: 103/255.0, alpha: 1.0)
    static let InitColorWord = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    static let PendingColor = UIColor(red: 253/255, green: 173/255, blue: 30/255, alpha: 1.0)
    static let PendingColorWord = UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1.0)
    static let CompleteColor = UIColor(red: 102/255.0, green: 255/255.0, blue: 204/255.0, alpha: 1.0)
    static let CompleteColorWord = UIColor(red: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1.0)
    
    static func getGradient(level: Int, color: UIColor) -> UIColor {
        let ratio = Double(level + 1)
        return color.colorWithAlphaComponent(CGFloat(Float(1.0/ratio)))
    }
}

