//
//  HomePageControlModel.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 07/04/16.
//
//

import Foundation
import UIKit

class HomePageControlModel: UIViewController {
    
    @IBOutlet var concernsTable : UITableView?
    @IBOutlet var hotspotTable  : UITableView?
    @IBOutlet var activityTable : UITableView?
    
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var segmented  : YSSegmentedControl?
    
    @IBOutlet var viewWidth : NSLayoutConstraint?
    @IBOutlet var secondViewLeading: NSLayoutConstraint?
    @IBOutlet var thrViewLeading: NSLayoutConstraint?
    
    override func viewDidAppear(animated: Bool) {
        self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame) * 3, 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initConcernsTable()
        initHotspotTable()
        initActivityTable()
        
        let selfViewWidth:CGFloat  = CGRectGetWidth(self.view.frame)
        let xoffset = Int(selfViewWidth)
        
        segmented = YSSegmentedControl(
            frame: CGRect(
                x: 0,
                y: 0,
                width: self.view.frame.size.width,
                height: 34),
            titles: [
                "关注",
                "热点",
                "活动"
            ],
            action: {
                control, index in
                self.scrollView.scrollRectToVisible(CGRectMake(CGFloat(xoffset * index), 0, CGFloat(xoffset), 200), animated: true)
        })
    }
    
    func initConcernsTable () {
        
        let diyRefreshGifHeader        = DIYRefreshGifHeader.init()
        concernsTable!.mj_header       = diyRefreshGifHeader.headerWithRefreshingTarget(self, refreshingAction: "loadData")
        concernsTable!.mj_header.beginRefreshing()
    }
    
    func initHotspotTable () {
        
        let diyRefreshGifHeader       = DIYRefreshGifHeader.init()
        hotspotTable!.mj_header       = diyRefreshGifHeader.headerWithRefreshingTarget(self, refreshingAction: "loadData")
        hotspotTable!.mj_header.beginRefreshing()
    }
    
    func initActivityTable () {
        
        let diyRefreshGifHeader        = DIYRefreshGifHeader.init()
        activityTable!.mj_header       = diyRefreshGifHeader.headerWithRefreshingTarget(self, refreshingAction: "loadData")
        activityTable!.mj_header.beginRefreshing()
    }
    
}
