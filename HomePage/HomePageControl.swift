//
//  HomePageControl.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 03/04/16.
//
//

import Foundation
import UIKit

class HomePageControl: HomePageControlModel,UIScrollViewDelegate,YSSegmentedControlDelegate{
    
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

    override func updateViewConstraints() {
        super.updateViewConstraints()
        viewWidth?.constant = CGRectGetWidth(self.view.frame) * 3
        secondViewLeading?.constant = CGRectGetWidth(self.view.frame)
        thrViewLeading?.constant = CGRectGetWidth(self.view.frame) * 2
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        segmented!.delegate     = self
        view.addSubview(segmented!)
        
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
        
        concernsTable!.reloadData()
        concernsTable!.mj_header.endRefreshing()
        hotspotTable!.mj_header.endRefreshing()
        activityTable!.mj_header.endRefreshing()
        print("successful load data")
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

extension HomePageControl: UITableViewDataSource,UITableViewDelegate {

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        
        if tableView == concernsTable {
            if cell == nil {
                cell = cellStyle.initWithHomeConcernsStyle(concernsTable!, style: .Default, reuseIdentifier: identifier, dataDict: data[indexPath.row] as! NSDictionary)
            }
            return cell!
        }
        
        if tableView == hotspotTable {
            if cell == nil {
                cell = cellStyle.initWithHomeHotspotStyle(hotspotTable!, style: .Default, reuseIdentifier: identifier, dataDict: data[indexPath.row] as! NSDictionary)
                cell!.selectionStyle = .None;
            }
            return cell!
        }
        if tableView == activityTable {
            if cell == nil {
                cell = UITableViewCell.init(style: .Default, reuseIdentifier: identifier)
            }
            cell?.textLabel?.text = "123"
            return cell!
        }
        
        return cell!
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if tableView == concernsTable{
            if data[indexPath.row].objectForKey("image")!.count == 0 {
                
                return commonFunctions.heightForText(data[indexPath.row].objectForKey("title") as! String, font: UIFont.boldSystemFontOfSize(15), width: tableView.width) + 50
            }else if data[indexPath.row].objectForKey("image")!.count == 1 || data[indexPath.row].objectForKey("image")!.count == 2 {
                
                return 120
            }else if data[indexPath.row].objectForKey("image")!.count >= 3 {
                
                return commonFunctions.heightForText(data[indexPath.row].objectForKey("title") as! String, font: UIFont.boldSystemFontOfSize(15), width: tableView.width) + 150
            }else {
                return 0
            }
            
        }else if tableView == hotspotTable{
            return 360 + 20
        }else if tableView == activityTable{
            return 30
        }
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == concernsTable{
            return 4
        }else if tableView == hotspotTable{
            return 2
        }else if tableView == activityTable{
            return 1
        }
        return 0
    }
}