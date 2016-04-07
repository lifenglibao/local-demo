//
//  HomePageControl.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 03/04/16.
//
//

import Foundation
import UIKit

class HomePageControl: HomePageControlModel,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,YSSegmentedControlDelegate{
    
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
    }
    
    func loadData () {
        
        concernsTable!.reloadData()
        concernsTable!.mj_header.endRefreshing()
        hotspotTable!.mj_header.endRefreshing()
        activityTable!.mj_header.endRefreshing()
        print("successful load data")
    }
    

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = "123"
        return cell!
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == concernsTable{
            return 3
        }else if tableView == hotspotTable{
            return 2
        }else if tableView == activityTable{
            return 1
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