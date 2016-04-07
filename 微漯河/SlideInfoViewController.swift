//
//  SlideInfoViewController.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 02/04/16.
//
//

import Foundation
import UIKit

class SlideInfoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tableview : UITableView?
    @IBOutlet var settingBtn: UIButton?
    @IBOutlet var userAvatar: UIImageView?
    @IBOutlet var userNick  : UILabel?
    @IBOutlet var userRemark: UILabel?
    @IBOutlet var userSex   : UIImageView?
    @IBOutlet var userIntegral : UILabel?
    @IBOutlet var userPrestige : UILabel?
    
    
    let dataDic = [
        ["name":"粉丝","image":"icon_fans"],
        ["name":"关注","image":"icon_followed"],
        ["name":"漯河圈","image":"icon_community"],
        ["name":"帖子","image":"icon_posts"],
        ["name":"收藏","image":"icon_favorites"]
        ]
//    @IBOutlet var backImg : UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageview = UIImageView.init(frame:self.view.bounds)
        imageview.image = UIImage(named: "leftbackiamge")
        self.view.addSubview(imageview)
        self.view.sendSubviewToBack(imageview)
        tableview!.dataSource = self;
        tableview!.delegate  = self;
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil {
            cell = cellStyle.initWithSlideStyle(.Default, reuseIdentifier: identifier, dataDict: dataDic[indexPath.row])
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath:NSIndexPath) -> CGFloat
    {
        return 40
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRectMake(0, 0, self.tableview!.frame.size.width, 60))
        view.backgroundColor = UIColor.clearColor()
        return view;
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
