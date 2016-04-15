//
//  CommunityControl.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 08/04/16.
//
//

import Foundation
import UIKit

class CommunityControl: CommunityControlModel,UIScrollViewDelegate,YSSegmentedControlDelegate{

    var segmented  : YSSegmentedControl?
    var popMenuBtn  : UIButton?
    var collectionView : CommunityCollectionView!
    let collectionIdentifierCell = "Cell"
    var popMenu  = XHPopMenu?()

    var pageIndex = PageIndex.HOTSPOT

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
    
    lazy var arrMenu = Array<SourceModel>()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let popMenuHelper = PopMenuHelper()
        popMenuHelper.delegate = self
        self.popMenu = popMenuHelper.initPopMenus()
        
        self.arrMenu = SourceModel.loadHotModels()
        segmented = YSSegmentedControl(
            frame: CGRect(
                x: 0,
                y: 0,
                width: self.view.width,
                height: 34),
            titles: [
                "热门板块",
                "我收藏的"
            ],
            action: {
                control, index in
                
                self.arrMenu.removeAll()
                if PageIndex.HOTSPOT.rawValue == index {
                    self.arrMenu = SourceModel.loadHotModels()
                }else{
                    self.arrMenu = SourceModel.loadFavoriteModels()
                }

                self.collectionView.reloadData()
        })
        
        segmented!.delegate = self
        
        dataDic =  NSDictionary(objects: ["<<女子为帮朋友丢了工作>> 后续: 当事人系辅警 泄露个人信息 <<女子为帮朋友丢了工作>> 后续: 当事人系辅警 泄露个人信息","微漯河","99阅读",imageDic,"04-08"], forKeys: ["title","from","amt_read","image","time"])
        dataDic1 =  NSDictionary(objects: ["论坛热议, 在漯河26岁的女孩已经算老窝头了吗? 论坛热议, 在漯河26岁的女孩已经算老窝头了吗?","27379271823","693阅读",imageDic1,"04-08"], forKeys: ["title","from","amt_read","image","time"])
        dataDic2 =  NSDictionary(objects: ["史无前例! 沪宁高速近百辆车相撞 截止目前2死5伤!","这是一个用户","1201阅读",imageDic2,"04-08"], forKeys: ["title","from","amt_read","image","time"])
        dataDic3 =  NSDictionary(objects: ["清明节了, 政府又出生态葬新政策了!清明节了, 政府又出生态葬新政策了!清明节了, 政府又出生态葬新政策了!","微漯河发布","38阅读",imageDic3,"04-08"], forKeys: ["title","from","amt_read","image","time"])

        let controlDic =  NSDictionary(object: "control", forKey: "cell_control")
        let scrollDic =  NSDictionary(object: "scorllview", forKey: "cell_scroll")
        let titleDic =  NSDictionary(object: "title", forKey: "cell_title")

        data.addObject(controlDic)
        data.addObject(scrollDic)
        data.addObject(titleDic)

        data.addObject(dataDic)
        data.addObject(dataDic1)
        data.addObject(dataDic2)
        data.addObject(dataDic3)
        
        collectionView = CommunityCollectionView.init(frame: CGRectMake(0, 0, self.view.width, 220), collectionViewLayout: UICollectionViewLayout.init())
        collectionView.dataSource = self
        collectionView.delegate   = self
    }
    
    func loadData () {
        
        communityTable!.reloadData()
        communityTable!.mj_header.endRefreshing()
        print("successful load data")
    }
    
    func segmentedControlWillPressItemAtIndex(segmentedControl: YSSegmentedControl, index: Int) {
        
    }
    
    func segmentedControlDidPressedItemAtIndex(segmentedControl: YSSegmentedControl, index: Int) {
        
    }

}
extension CommunityControl: UICollectionViewDataSource, UICollectionViewDelegate {
        
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrMenu.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let cell:CommunityCollectionCell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionIdentifierCell, forIndexPath: indexPath) as! CommunityCollectionCell
        
        for view:UIView in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        cell.mainBtn = UIButton.init(frame: CGRectMake(10, 10, 50, 50))
        cell.menuTitle = UILabel.init(frame: CGRectMake(5, 70, 60, 20))
        
        cell.mainBtn?.setImage(UIImage(named: arrMenu[indexPath.row].imgName), forState: .Normal)
        cell.mainBtn?.tag = arrMenu[indexPath.row].id
        cell.mainBtn?.addTarget(self, action: "buttonTapped:", forControlEvents: .TouchUpInside)
        cell.menuTitle?.text = arrMenu[indexPath.row].name
        cell.menuTitle?.font = UIFont.systemFontOfSize(13)
        cell.menuTitle?.textColor = UIColor.darkGrayColor()
        cell.menuTitle?.textAlignment = .Center
        
        cell.contentView.addSubview(cell.mainBtn!)
        cell.contentView.addSubview(cell.menuTitle!)
        return cell
    }
    
    func buttonTapped (sender:UIButton) {
        
    }
}

extension CommunityControl: UITableViewDataSource,UITableViewDelegate {

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "community_cell"
        
        let XOFFSET : CGFloat = 10
        let YOFFSET : CGFloat = 5
        
        let cell = cellStyle.initWithCommunityStyle(communityTable!, indexPath: indexPath, style: .Default, reuseIdentifier: identifier, dataDict: data[indexPath.row] as! NSDictionary)
        if indexPath.row == 0 {
            cell.contentView.addSubview(segmented!)
        }else if indexPath.row == 1 {
            cell.contentView.addSubview(collectionView)
        }else if indexPath.row == 2 {
            
            let lastUpdate_Lbl = UILabel.init(frame: CGRectMake(XOFFSET, YOFFSET, 60, 20))
            lastUpdate_Lbl.textAlignment = .Left
            lastUpdate_Lbl.font  = UIFont.systemFontOfSize(13)
            lastUpdate_Lbl.textColor = UIColor.darkGrayColor()
            lastUpdate_Lbl.text = "最后刷新:"
            
            let time_Lbl = UILabel.init(frame: CGRectMake(lastUpdate_Lbl.width + lastUpdate_Lbl.x + XOFFSET, YOFFSET, 100, 20))
            time_Lbl.textAlignment = .Left
            time_Lbl.font  = UIFont.systemFontOfSize(13)
            time_Lbl.textColor = UIColor.darkGrayColor()
            time_Lbl.text = "04-09 09:00"
            
            popMenuBtn = UIButton.init(frame: CGRectMake(communityTable!.width - 110, YOFFSET, 80, 20))
            popMenuBtn?.setTitle("24小时热点", forState: .Normal)
            popMenuBtn?.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
            popMenuBtn?.titleLabel?.font = UIFont.systemFontOfSize(13)
            popMenuBtn?.addTarget(self, action: "popMenuBtnClicked:", forControlEvents: .TouchUpInside)
            
            cell.contentView.backgroundColor = UIColor.groupTableViewBackgroundColor()
            cell.contentView.addSubview(lastUpdate_Lbl)
            cell.contentView.addSubview(time_Lbl)
            cell.contentView.addSubview(popMenuBtn!)
            
        }
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return segmented!.height
        }else if indexPath.row == 1 {
            return collectionView.height
        }else if indexPath.row == 2 {
            return 30
        }else{
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
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView{
            return data.count
        }
        return 0
    }
    
}

extension CommunityControl : popMenuHelperDelegate{
    
    func popMenuBtnClicked (sender:UIButton) {
        self.popMenu!.showMenuOnView(communityTable, atPoint: CGPointZero)
    }
    
    func popMenuSelectd() {
        
    }
}
