//
//  PopMenuHelper.swift
//  iChat
//
//  Created by iAPPS Pte Ltd on 07/01/16.
//  Copyright © 2016年 iAPPS Pte Ltd. All rights reserved.
//

import Foundation
import UIKit


protocol popMenuHelperDelegate:NSObjectProtocol{
    //call back
    func popMenuSelectd()
}

class PopMenuHelper: NSObject{

    var popMenu  = XHPopMenu?()
    var delegate : popMenuHelperDelegate?

    func initPopMenus () ->XHPopMenu {
        if (popMenu == nil) {
            let popMenuItems = NSMutableArray.init(capacity: 4)
            for var i = 0; i<3; i++ {
                var imageName = NSString()
                var title     = NSString()
                
                switch (i) {
                case 0:
                    imageName = ""
                    title = "24小时热点"
                    break
                    
                case 1:
                    imageName = ""
                    title = "最新发布"
                    break
                    
                case 2:
                    imageName = ""
                    title = "最后回复"
                    break
                    
                default:
                    break
                }
                
                let popMenuItem = XHPopMenuItem.init(image: UIImage(named: imageName as String), title: title as String)
                popMenuItems.addObject(popMenuItem)
            }
            
            
            weak var weakSelf = self
            popMenu = XHPopMenu.init(menus: popMenuItems as [AnyObject])
            
            popMenu?.popMenuDidSlectedCompled = {
                ind,men in
  
//                if (weakSelf!.delegate != nil) {
//                    weakSelf!.delegate?.popMenuSelectd()
//                }
            }
        }
        return popMenu!
    }
    

}