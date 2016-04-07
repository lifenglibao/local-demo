//
//  HomePageControl.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 03/04/16.
//
//

import Foundation
import UIKit

class HomePageControl: UIViewController,YSSegmentedControlDelegate,UIScrollViewDelegate {
    
    @IBOutlet var scrollView : UIScrollView!
    @IBOutlet var segmented  : YSSegmentedControl?
    @IBOutlet var concernsTable : ConcernsTableView?
    @IBOutlet var hotspotTable  : HotspotTableView?
    @IBOutlet var activityTable : ActivityTableView?

    @IBOutlet var viewWidth : NSLayoutConstraint?
    @IBOutlet var secondViewLeading: NSLayoutConstraint?
    @IBOutlet var thrViewLeading: NSLayoutConstraint?

    override func updateViewConstraints() {
        super.updateViewConstraints()
        self.viewWidth?.constant = CGRectGetWidth(self.view.frame) * 3
        self.secondViewLeading?.constant = CGRectGetWidth(self.view.frame)
        self.thrViewLeading?.constant = CGRectGetWidth(self.view.frame) * 2
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidAppear(animated: Bool) {
        self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame) * 3, 0)
    }
    func initConcernsTable () {
        
        concernsTable!.backgroundColor = UIColor.clearColor()
        let diyRefreshGifHeader        = DIYRefreshGifHeader.init()
        concernsTable!.mj_header       = diyRefreshGifHeader.headerWithRefreshingTarget(self, refreshingAction: "loadData")
        concernsTable!.mj_header.beginRefreshing()
    }
    
    func initHotspotTable () {
        hotspotTable!.backgroundColor = UIColor.redColor()
        let diyRefreshGifHeader       = DIYRefreshGifHeader.init()
        hotspotTable!.mj_header       = diyRefreshGifHeader.headerWithRefreshingTarget(self, refreshingAction: "loadData")
        hotspotTable!.mj_header.beginRefreshing()
    }
    
    func initActivityTable () {
        
        activityTable!.backgroundColor = UIColor.blueColor()
        let diyRefreshGifHeader        = DIYRefreshGifHeader.init()
        activityTable!.mj_header       = diyRefreshGifHeader.headerWithRefreshingTarget(self, refreshingAction: "loadData")
        activityTable!.mj_header.beginRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selfViewWidth:CGFloat  = CGRectGetWidth(self.view.frame)
        let xoffset = Int(selfViewWidth)

        self.scrollView.delegate    = self
        
        initConcernsTable()
        initHotspotTable()
        initActivityTable()
        
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
        segmented!.delegate = self
        view.addSubview(segmented!)
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