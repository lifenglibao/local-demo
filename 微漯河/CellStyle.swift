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
    
    internal func initWithHomeConcernsStyle (tableView:UITableView, style: UITableViewCellStyle,reuseIdentifier: String,dataDict: NSDictionary)->UITableViewCell {
        let cell = UITableViewCell.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        let IMG_WIDTH : CGFloat = tableView.width/3.3
        let IMG_HEIGHT : CGFloat = 90
        let CELL_CONTENT_SPACE : CGFloat = 30
        let CELL_IMG_SPACE : CGFloat = 5
        let XOFFSET : CGFloat = 10
        let YOFFSET : CGFloat = 10

        let cell_IMG_ONE = UIImageView()
        let cell_IMG_TWO = UIImageView()
        let cell_IMG_THR = UIImageView()

        let title_Lbl = UILabel()
        let from_Lbl  = UILabel()
        let amtRead_Lbl = UILabel()
        let date_Lbl    = UILabel()
        var newFrame:CGRect
        
        title_Lbl.text   = dataDict.objectForKey("title") as? String
        from_Lbl.text    = dataDict.objectForKey("from") as? String
        date_Lbl.text    = dataDict.objectForKey("time") as? String
        amtRead_Lbl.text = dataDict.objectForKey("amt_read") as? String

        title_Lbl.lineBreakMode = .ByWordWrapping
        title_Lbl.numberOfLines = 0
        title_Lbl.textAlignment = .Left
        title_Lbl.font  = UIFont.boldSystemFontOfSize(15)

        from_Lbl.textAlignment  = .Left
        from_Lbl.textColor      = UIColor.lightGrayColor()
        from_Lbl.font           = UIFont.systemFontOfSize(13)
        
        amtRead_Lbl.textAlignment  = .Left
        amtRead_Lbl.textColor      = UIColor.lightGrayColor()
        amtRead_Lbl.font           = UIFont.systemFontOfSize(13)
        
        date_Lbl.textAlignment  = .Left
        date_Lbl.textColor      = UIColor.lightGrayColor()
        date_Lbl.font           = UIFont.systemFontOfSize(13)
        
        
        if dataDict.objectForKey("image")!.count == 0 {
            
            title_Lbl.frame      = CGRectMake(XOFFSET, YOFFSET, tableView.width - CELL_CONTENT_SPACE, 30)
            newFrame             = title_Lbl.frame
            newFrame.size.height = commonFunctions.heightForText(title_Lbl.text!, font: title_Lbl.font, width: tableView.width)
            title_Lbl.frame      = newFrame
            
            newFrame.size.width  = commonFunctions.widthForText(from_Lbl.text!, font: from_Lbl.font)
            from_Lbl.frame       = CGRectMake(XOFFSET, title_Lbl.height + YOFFSET, newFrame.width, 30)
            
            newFrame.size.width  = commonFunctions.widthForText(amtRead_Lbl.text!, font: amtRead_Lbl.font)
            amtRead_Lbl.frame    = CGRectMake(XOFFSET + from_Lbl.width, title_Lbl.height + YOFFSET, newFrame.width, 30)
            
            newFrame.size.width  = commonFunctions.widthForText(date_Lbl.text!, font: date_Lbl.font)
            date_Lbl.frame       = CGRectMake(tableView.width - newFrame.width, title_Lbl.height + YOFFSET, newFrame.width, 30)
            
        }else if dataDict.objectForKey("image")!.count == 1 || dataDict.objectForKey("image")!.count == 2{
            
            title_Lbl.frame      = CGRectMake(XOFFSET, YOFFSET, tableView.width - IMG_WIDTH - CELL_CONTENT_SPACE, 30)
            newFrame             = title_Lbl.frame;
            newFrame.size.height = commonFunctions.heightForText(title_Lbl.text!, font: title_Lbl.font, width: tableView.width)
            title_Lbl.frame      = newFrame
            
            cell_IMG_ONE.frame   = CGRectMake(tableView.width - IMG_WIDTH - XOFFSET, YOFFSET, IMG_WIDTH , IMG_HEIGHT)
            cell_IMG_ONE.image   = UIImage(named: dataDict.objectForKey("image")!.objectAtIndex(0).objectForKey("image") as! String)
            
            newFrame.size.width  = commonFunctions.widthForText(from_Lbl.text!, font: from_Lbl.font)
            from_Lbl.frame       = CGRectMake(XOFFSET, cell_IMG_ONE.height - YOFFSET, newFrame.width, 30)
            
            newFrame.size.width  = commonFunctions.widthForText(amtRead_Lbl.text!, font: amtRead_Lbl.font)
            amtRead_Lbl.frame    = CGRectMake(XOFFSET + from_Lbl.width, cell_IMG_ONE.height - YOFFSET, newFrame.width, 30)
            
            cell.contentView.addSubview(cell_IMG_ONE)
            
        }else if dataDict.objectForKey("image")!.count >= 3{
            
            title_Lbl.frame      = CGRectMake(XOFFSET, YOFFSET, tableView.width - CELL_CONTENT_SPACE, 30)
            newFrame             = title_Lbl.frame;
            newFrame.size.height = commonFunctions.heightForText(title_Lbl.text!, font: title_Lbl.font, width: tableView.width)
            title_Lbl.frame      = newFrame
            
            cell_IMG_ONE.frame   = CGRectMake(XOFFSET, title_Lbl.height + CELL_IMG_SPACE + YOFFSET, IMG_WIDTH , IMG_HEIGHT)
            cell_IMG_ONE.image   = UIImage(named: dataDict.objectForKey("image")!.objectAtIndex(0).objectForKey("image") as! String)
            
            cell_IMG_TWO.frame   = CGRectMake(IMG_WIDTH + XOFFSET + CELL_IMG_SPACE, title_Lbl.height + CELL_IMG_SPACE + YOFFSET, IMG_WIDTH , IMG_HEIGHT)
            cell_IMG_TWO.image   = UIImage(named: dataDict.objectForKey("image")!.objectAtIndex(1).objectForKey("image") as! String)

            cell_IMG_THR.frame   = CGRectMake(IMG_WIDTH * 2 + XOFFSET + CELL_IMG_SPACE * 2 , title_Lbl.height + CELL_IMG_SPACE + YOFFSET, IMG_WIDTH , IMG_HEIGHT)
            cell_IMG_THR.image   = UIImage(named: dataDict.objectForKey("image")!.objectAtIndex(2).objectForKey("image") as! String)

            cell.contentView.addSubview(cell_IMG_ONE)
            cell.contentView.addSubview(cell_IMG_TWO)
            cell.contentView.addSubview(cell_IMG_THR)
            
            newFrame.size.width = commonFunctions.widthForText(from_Lbl.text!, font: from_Lbl.font)
            from_Lbl.frame      = CGRectMake(XOFFSET, cell_IMG_ONE.height + title_Lbl.height + YOFFSET * 2, newFrame.width, 30)
            
            newFrame.size.width = commonFunctions.widthForText(amtRead_Lbl.text!, font: amtRead_Lbl.font)
            amtRead_Lbl.frame   = CGRectMake(XOFFSET + from_Lbl.width, cell_IMG_ONE.height + title_Lbl.height + YOFFSET * 2, newFrame.width, 30)
            
            newFrame.size.width = commonFunctions.widthForText(date_Lbl.text!, font: date_Lbl.font)
            date_Lbl.frame      = CGRectMake(tableView.width - newFrame.width, cell_IMG_ONE.height + title_Lbl.height + YOFFSET * 2, newFrame.width, 30)
        }
        
        
        cell.contentView.addSubview(title_Lbl)
        cell.contentView.addSubview(from_Lbl)
        cell.contentView.addSubview(amtRead_Lbl)
        cell.contentView.addSubview(date_Lbl)

        cell.accessoryType   = .None
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    internal func initWithHomeHotspotStyle (tableView:UITableView, style: UITableViewCellStyle,reuseIdentifier: String,dataDict: NSDictionary)->UITableViewCell {
        let cell = UITableViewCell.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let TEMPPLATE_CONTAINER_VIEW_HEIGHT : CGFloat = 360
        let XOFFSET : CGFloat = 10
        let YOFFSET : CGFloat = 10
        
        let THUMBAIL_IMG_WIDTH : CGFloat  = 50
        let THUMBAIL_IMG_HEIGHT: CGFloat  = 50
        
        let CONTAINER_VIEW_WIDTH: CGFloat  = 60

        var sepatorImageViewFrame:CGRect

        let templateContainerView = UIView.init(frame: CGRectMake(XOFFSET, YOFFSET, tableView.width - XOFFSET * 2, TEMPPLATE_CONTAINER_VIEW_HEIGHT))
        
        let backgroundImageView   = UIImageView.init(frame: templateContainerView.bounds)
        backgroundImageView.image = STRETCH_IMAGE((UIImage(named: "HomeHotspotBackgroundImage"))!, edgeInsets: UIEdgeInsetsMake(7, 7, 7, 7))
        
        let topImageView          = UIImageView.init(frame: CGRectMake(XOFFSET, YOFFSET, templateContainerView.bounds.width-20, templateContainerView.bounds.height-200))
//        topImageView.contentMode  = .ScaleAspectFill;
        topImageView.layer.masksToBounds = true
        topImageView.image        = UIImage(named: "IMG_1725")
        
        let topTitleLabel         = UILabel.init(frame: CGRectMake(0, topImageView.bounds.height - 30, topImageView.bounds.width, 30))
        topTitleLabel.backgroundColor = UIColor(white: 0, alpha: 0.5)
        topTitleLabel.textColor       = UIColor.whiteColor()
        topTitleLabel.font            = UIFont.boldSystemFontOfSize(15)
        topTitleLabel.text            = "测试测试测试测试测试测试测试测试测试";
        
        let sepatorImageView = commonFunctions.sepatorImageViewWithWidth(templateContainerView.bounds.width)
        sepatorImageViewFrame = sepatorImageView.frame
        sepatorImageViewFrame.origin.y = CGRectGetMaxY(topImageView.frame) + 10;
        sepatorImageView.frame = sepatorImageViewFrame
        

        let containerView = UIView.init(frame: CGRectMake(0, CGRectGetMaxY(sepatorImageViewFrame), templateContainerView.bounds.width - 20, CONTAINER_VIEW_WIDTH * 3))
        
        for var i = 0; i<3; i++ {
            let currentView = UIButton.init(frame: CGRectMake(0, CGFloat(i) * CONTAINER_VIEW_WIDTH, templateContainerView.bounds.width, CONTAINER_VIEW_WIDTH))
            let summeryLabel = UILabel.init(frame: CGRectMake(XOFFSET, YOFFSET, currentView.bounds.width - THUMBAIL_IMG_WIDTH - XOFFSET * 3, THUMBAIL_IMG_HEIGHT))
            summeryLabel.numberOfLines = 2
            summeryLabel.textColor     = UIColor(white: 0.151, alpha: 1)
            summeryLabel.font          = UIFont.boldSystemFontOfSize(14)
            summeryLabel.text          = "测试测试测试测试测试测试测试测试测试测试测试"
            summeryLabel.backgroundColor = UIColor.clearColor()
            
            let thumbailImageView = UIImageView.init(frame: CGRectMake(currentView.bounds.width - THUMBAIL_IMG_WIDTH - XOFFSET, YOFFSET-5, THUMBAIL_IMG_WIDTH, THUMBAIL_IMG_HEIGHT))
            thumbailImageView.image = UIImage(named: "icon_fans")
            
            currentView.addSubview(summeryLabel)
            currentView.addSubview(thumbailImageView)

            if i < 2 {
                let _sepatorImageView = commonFunctions.sepatorImageViewWithWidth(templateContainerView.bounds.width)
                sepatorImageViewFrame = _sepatorImageView.frame
                sepatorImageViewFrame.origin.y = CGRectGetMaxY(currentView.frame)
                _sepatorImageView.frame = sepatorImageViewFrame
                containerView.addSubview(_sepatorImageView)
            }
            containerView.addSubview(currentView)
        }
        
        topImageView.addSubview(topTitleLabel)
        templateContainerView.addSubview(backgroundImageView)
        templateContainerView.addSubview(topImageView)
        templateContainerView.addSubview(sepatorImageView)
        templateContainerView.addSubview(containerView)

        cell.contentView.addSubview(templateContainerView)
        cell.accessoryType = .None
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    internal func initWithCommunityStyle (tableView:UITableView, indexPath:NSIndexPath, style: UITableViewCellStyle,reuseIdentifier: String,dataDict: NSDictionary)->UITableViewCell {
        let cell = UITableViewCell.init(style: style, reuseIdentifier: reuseIdentifier)
        
        if indexPath.row >= 3 {
            let IMG_WIDTH : CGFloat = tableView.width/3.3
            let IMG_HEIGHT : CGFloat = 90
            let CELL_CONTENT_SPACE : CGFloat = 30
            let CELL_IMG_SPACE : CGFloat = 5
            let XOFFSET : CGFloat = 10
            let YOFFSET : CGFloat = 10
            
            let cell_IMG_ONE = UIImageView()
            let cell_IMG_TWO = UIImageView()
            let cell_IMG_THR = UIImageView()
            
            let title_Lbl = UILabel()
            let from_Lbl  = UILabel()
            let amtRead_Lbl = UILabel()
            let date_Lbl    = UILabel()
            var newFrame:CGRect
            
            title_Lbl.text   = dataDict.objectForKey("title") as? String
            from_Lbl.text    = dataDict.objectForKey("from") as? String
            date_Lbl.text    = dataDict.objectForKey("time") as? String
            amtRead_Lbl.text = dataDict.objectForKey("amt_read") as? String
            
            title_Lbl.lineBreakMode = .ByWordWrapping
            title_Lbl.numberOfLines = 0
            title_Lbl.textAlignment = .Left
            title_Lbl.font  = UIFont.boldSystemFontOfSize(15)
            
            from_Lbl.textAlignment  = .Left
            from_Lbl.textColor      = UIColor.lightGrayColor()
            from_Lbl.font           = UIFont.systemFontOfSize(13)
            
            amtRead_Lbl.textAlignment  = .Left
            amtRead_Lbl.textColor      = UIColor.lightGrayColor()
            amtRead_Lbl.font           = UIFont.systemFontOfSize(13)
            
            date_Lbl.textAlignment  = .Left
            date_Lbl.textColor      = UIColor.lightGrayColor()
            date_Lbl.font           = UIFont.systemFontOfSize(13)
            
            
            if dataDict.objectForKey("image")!.count == 0 {
                
                title_Lbl.frame      = CGRectMake(XOFFSET, YOFFSET, tableView.width - CELL_CONTENT_SPACE, 30)
                newFrame             = title_Lbl.frame
                newFrame.size.height = commonFunctions.heightForText(title_Lbl.text!, font: title_Lbl.font, width: tableView.width)
                title_Lbl.frame      = newFrame
                
                newFrame.size.width  = commonFunctions.widthForText(from_Lbl.text!, font: from_Lbl.font)
                from_Lbl.frame       = CGRectMake(XOFFSET, title_Lbl.height + YOFFSET, newFrame.width, 30)
                
                newFrame.size.width  = commonFunctions.widthForText(amtRead_Lbl.text!, font: amtRead_Lbl.font)
                amtRead_Lbl.frame    = CGRectMake(XOFFSET + from_Lbl.width, title_Lbl.height + YOFFSET, newFrame.width, 30)
                
                newFrame.size.width  = commonFunctions.widthForText(date_Lbl.text!, font: date_Lbl.font)
                date_Lbl.frame       = CGRectMake(tableView.width - newFrame.width, title_Lbl.height + YOFFSET, newFrame.width, 30)
                
            }else if dataDict.objectForKey("image")!.count == 1 || dataDict.objectForKey("image")!.count == 2{
                
                title_Lbl.frame      = CGRectMake(XOFFSET, YOFFSET, tableView.width - IMG_WIDTH - CELL_CONTENT_SPACE, 30)
                newFrame             = title_Lbl.frame;
                newFrame.size.height = commonFunctions.heightForText(title_Lbl.text!, font: title_Lbl.font, width: tableView.width)
                title_Lbl.frame      = newFrame
                
                cell_IMG_ONE.frame   = CGRectMake(tableView.width - IMG_WIDTH - XOFFSET, YOFFSET, IMG_WIDTH , IMG_HEIGHT)
                cell_IMG_ONE.image   = UIImage(named: dataDict.objectForKey("image")!.objectAtIndex(0).objectForKey("image") as! String)
                
                newFrame.size.width  = commonFunctions.widthForText(from_Lbl.text!, font: from_Lbl.font)
                from_Lbl.frame       = CGRectMake(XOFFSET, cell_IMG_ONE.height - YOFFSET, newFrame.width, 30)
                
                newFrame.size.width  = commonFunctions.widthForText(amtRead_Lbl.text!, font: amtRead_Lbl.font)
                amtRead_Lbl.frame    = CGRectMake(XOFFSET + from_Lbl.width, cell_IMG_ONE.height - YOFFSET, newFrame.width, 30)
                
                cell.contentView.addSubview(cell_IMG_ONE)
                
            }else if dataDict.objectForKey("image")!.count >= 3{
                
                title_Lbl.frame      = CGRectMake(XOFFSET, YOFFSET, tableView.width - CELL_CONTENT_SPACE, 30)
                newFrame             = title_Lbl.frame;
                newFrame.size.height = commonFunctions.heightForText(title_Lbl.text!, font: title_Lbl.font, width: tableView.width)
                title_Lbl.frame      = newFrame
                
                cell_IMG_ONE.frame   = CGRectMake(XOFFSET, title_Lbl.height + CELL_IMG_SPACE + YOFFSET, IMG_WIDTH , IMG_HEIGHT)
                cell_IMG_ONE.image   = UIImage(named: dataDict.objectForKey("image")!.objectAtIndex(0).objectForKey("image") as! String)
                
                cell_IMG_TWO.frame   = CGRectMake(IMG_WIDTH + XOFFSET + CELL_IMG_SPACE, title_Lbl.height + CELL_IMG_SPACE + YOFFSET, IMG_WIDTH , IMG_HEIGHT)
                cell_IMG_TWO.image   = UIImage(named: dataDict.objectForKey("image")!.objectAtIndex(1).objectForKey("image") as! String)
                
                cell_IMG_THR.frame   = CGRectMake(IMG_WIDTH * 2 + XOFFSET + CELL_IMG_SPACE * 2 , title_Lbl.height + CELL_IMG_SPACE + YOFFSET, IMG_WIDTH , IMG_HEIGHT)
                cell_IMG_THR.image   = UIImage(named: dataDict.objectForKey("image")!.objectAtIndex(2).objectForKey("image") as! String)
                
                cell.contentView.addSubview(cell_IMG_ONE)
                cell.contentView.addSubview(cell_IMG_TWO)
                cell.contentView.addSubview(cell_IMG_THR)
                
                newFrame.size.width = commonFunctions.widthForText(from_Lbl.text!, font: from_Lbl.font)
                from_Lbl.frame      = CGRectMake(XOFFSET, cell_IMG_ONE.height + title_Lbl.height + YOFFSET * 2, newFrame.width, 30)
                
                newFrame.size.width = commonFunctions.widthForText(amtRead_Lbl.text!, font: amtRead_Lbl.font)
                amtRead_Lbl.frame   = CGRectMake(XOFFSET + from_Lbl.width, cell_IMG_ONE.height + title_Lbl.height + YOFFSET * 2, newFrame.width, 30)
                
                newFrame.size.width = commonFunctions.widthForText(date_Lbl.text!, font: date_Lbl.font)
                date_Lbl.frame      = CGRectMake(tableView.width - newFrame.width, cell_IMG_ONE.height + title_Lbl.height + YOFFSET * 2, newFrame.width, 30)
            }
            
            
            cell.contentView.addSubview(title_Lbl)
            cell.contentView.addSubview(from_Lbl)
            cell.contentView.addSubview(amtRead_Lbl)
            cell.contentView.addSubview(date_Lbl)
            
            cell.accessoryType   = .None
            cell.backgroundColor = UIColor.clearColor()
        }
        
        return cell
    }

}