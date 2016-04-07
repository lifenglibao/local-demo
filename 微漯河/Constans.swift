//
//  GlobalVar.swift
//  iChat
//
//  Created by iAPPS Pte Ltd on 05/01/16.
//  Copyright © 2016年 iAPPS Pte Ltd. All rights reserved.
//

import Foundation
import UIKit

let cellStyle = CellStyle()


//*****************-- GET VIEW CONTROLLER FROM STORY BOARD --**************//


func GET_VIEW_CONTROLLER(identifier:String)->UIViewController {
    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    return mainStoryboard.instantiateViewControllerWithIdentifier(identifier)
}

//*****************-- OVERRIDE UICOLOR --**************//

func RGBA_ALPHA (R:CGFloat, G:CGFloat, B:CGFloat, A:CGFloat)->UIColor {
    return UIColor.init(red: R/255.0, green: G/255.0, blue:  B/255.0, alpha: A)
}


//MARK: HOME TABBAR VIEW CONTROLLER
struct StoryBoard_Home {
    
    //MARK: Storyboard
    static let SB_HOME_SPLASH_ANIMATION         = "SplashAnimation"
    static let SB_HOME_TABBAR_VIEW_CONTROLLER   = "HomeTabBarViewController"
    static let SB_SLIDE_VIEW_CONTROLLER         = "SlideInfoViewController"
    static let SB_HOME_PAGE_CONTROLLER          = "HomePageControl"
}



