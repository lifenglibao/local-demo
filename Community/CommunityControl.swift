//
//  CommunityControl.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 08/04/16.
//
//

import Foundation
import UIKit

class CommunityControl: CommunityControlModel,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,YSSegmentedControlDelegate {

    var segmented  : YSSegmentedControl?

    let imageDic = [
        
    ]
    
    let imageDic1 = [
        ["image":"IMG_1722"]
    ]
    
    let imageDic2 = [
        ["image":"IMG_1725"],
        ["image":"IMG_1723"]
    ]
    
    let imageDic3 = [
        ["image":"IMG_1723"],
        ["image":"IMG_1722"],
        ["image":"IMG_1725"]
    ]
    var dataDic =  NSDictionary()
    var dataDic1 =  NSDictionary()
    var dataDic2 =  NSDictionary()
    var dataDic3 =  NSDictionary()
    
    var data =  NSMutableArray()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmented = YSSegmentedControl(
            frame: CGRect(
                x: 0,
                y: 0,
                width: self.view.frame.size.width,
                height: 34),
            titles: [
                "热门板块",
                "我收藏的"
            ],
            action: {
                control, index in
        })
        
        segmented!.delegate = self
        
        dataDic =  NSDictionary(objects: ["<<女子为帮朋友丢了工作>> 后续: 当事人系辅警 泄露个人信息 <<女子为帮朋友丢了工作>> 后续: 当事人系辅警 泄露个人信息","微漯河","99阅读",imageDic,"04-08"], forKeys: ["title","from","amt_read","image","time"])
        dataDic1 =  NSDictionary(objects: ["论坛热议, 在漯河26岁的女孩已经算老窝头了吗? 论坛热议, 在漯河26岁的女孩已经算老窝头了吗?","27379271823","693阅读",imageDic1,"04-08"], forKeys: ["title","from","amt_read","image","time"])
        dataDic2 =  NSDictionary(objects: ["史无前例! 沪宁高速近百辆车相撞 截止目前2死5伤!","这是一个用户","1201阅读",imageDic2,"04-08"], forKeys: ["title","from","amt_read","image","time"])
        dataDic3 =  NSDictionary(objects: ["清明节了, 政府又出生态葬新政策了!清明节了, 政府又出生态葬新政策了!清明节了, 政府又出生态葬新政策了!","微漯河发布","38阅读",imageDic3,"04-08"], forKeys: ["title","from","amt_read","image","time"])
        
        data.addObject(dataDic)
        data.addObject(dataDic1)
        data.addObject(dataDic2)
        data.addObject(dataDic3)
        
    }
    
    func loadData () {
        
        communityTable!.reloadData()
        communityTable!.mj_header.endRefreshing()
        print("successful load data")
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "community_cell"
        
        let cell = cellStyle.initWithCommunityStyle(communityTable!, indexPath: indexPath, style: .Default, reuseIdentifier: identifier, dataDict: data[indexPath.row] as! NSDictionary)
        if indexPath.row == 0 {
            cell.contentView.addSubview(segmented!)
        }
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if tableView == tableView{
            if data[indexPath.row].objectForKey("image")!.count == 0 {
                
                return commonFunctions.heightForText(data[indexPath.row].objectForKey("title") as! String, font: UIFont.boldSystemFontOfSize(15), width: tableView.width) + 50
            }else if data[indexPath.row].objectForKey("image")!.count == 1 || data[indexPath.row].objectForKey("image")!.count == 2 {
                
                return 120
            }else if data[indexPath.row].objectForKey("image")!.count >= 3 {
                
                return commonFunctions.heightForText(data[indexPath.row].objectForKey("title") as! String, font: UIFont.boldSystemFontOfSize(15), width: tableView.width) + 150
            }else {
                return 0
            }
        }
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView{
            return 3
        }
        return 0
    }
    
    
    func segmentedControlWillPressItemAtIndex(segmentedControl: YSSegmentedControl, index: Int) {
        
    }
    
    func segmentedControlDidPressedItemAtIndex(segmentedControl: YSSegmentedControl, index: Int) {
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth = Int(Float(scrollView.frame.size.width))
        
        let page = Int(Float(scrollView.contentOffset.x) / Float(pageWidth))
        segmented?.selectItemAtIndex(page, withAnimation: true)
    }

}