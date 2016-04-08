//
//  CommonFunctions.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 08/04/16.
//
//

import Foundation
import UIKit

class CommonFunctions: NSObject{

    func heightForText(text:String,font:UIFont,width:CGFloat)->CGFloat {
        
        let constraint:CGSize  = CGSizeMake(width, 20000.0)
        let size      :CGSize
        
        let boundingBox: CGSize = text.boundingRectWithSize(constraint, options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context: nil).size
        
        size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height))
        
        return size.height+30
    }
    
    func widthForText(text:String,font:UIFont)->CGFloat {
        
        let constraint:CGSize  = CGSizeMake(1000, 1000)
        let size      :CGSize
        
        let boundingBox: CGSize = text.boundingRectWithSize(constraint, options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context: nil).size
        
        size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height))
        
        return size.width+30
    }
    
    func sepatorImageViewWithWidth(width:CGFloat)->UIImageView {
        
        let sepatorImageView = UIImageView.init(frame: CGRectMake(0, 0, width, 0.5))
        sepatorImageView.backgroundColor = UIColor.lightGrayColor()
        return sepatorImageView
    }

}


