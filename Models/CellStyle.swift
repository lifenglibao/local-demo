//
//  CellStyle.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 03/04/16.
//
//

import Foundation
import UIKit

class CellStyle:  UITableViewCell {
    
    internal func initWithSlideStyle (style: UITableViewCellStyle,reuseIdentifier: String,dataDict: NSDictionary)->UITableViewCell {
        let cell = UITableViewCell.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cell.accessoryType = .None
        cell.textLabel!.font = UIFont.systemFontOfSize(20)
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel!.textColor = UIColor.lightGrayColor()
        
        var cellImg_ = UIImageView()
        var cellLbl  = UILabel()
        let yoffset:CGFloat = 10.0
        
        cellImg_     = UIImageView.init(image: UIImage(named: dataDict.objectForKey("image") as! String))
        cellImg_.backgroundColor = UIColor.clearColor()
        cellImg_.contentMode     = .ScaleToFill
        cellImg_.frame           = CGRectMake(10, yoffset, 20, 20)
        cell.contentView.addSubview(cellImg_)
        cell.contentView.bringSubviewToFront(cellImg_)
        
        cellLbl      = UILabel.init(frame: CGRectMake(cellImg_.frame.size.width + cellImg_.frame.origin.x + 10 , yoffset, 50, 20))
        cellLbl.backgroundColor  = UIColor.clearColor()
        cellLbl.textColor        = UIColor.lightGrayColor()
        cellLbl.font             = UIFont.systemFontOfSize(16)
        cellLbl.textAlignment    = .Left
        cellLbl.text             = dataDict.objectForKey("name") as? String

        cell.contentView.addSubview(cellLbl)
        cell.contentView.bringSubviewToFront(cellLbl)
        
        return cell
    }
}