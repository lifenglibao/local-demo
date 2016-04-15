//
//  HomeSplashAnimViewController.swift
//  Slide
//
//  Created by Phoebe Xie on 26/1/16.
//  Copyright © 2016 iAPPS Pte Ltd. All rights reserved.
//

import UIKit
import Foundation

class HomeSplashAnimViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        logo.alpha = 0
        initSideMenu()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        UIView.animateWithDuration(0.3, delay: 0, options: [], animations: {
            // appear
            self.logo.alpha = 1
            }, completion: {(complete) -> Void in
            UIView.animateWithDuration(0.5, delay: 0.8, options: [], animations: {
            //leave screen to the right
            self.logo.center.x += self.view.bounds.width
                },completion: {(complete) -> Void in
                    self.dismissViewControllerAnimated(true, completion: nil)
            })
        })

    }

    private func initSideMenu () {
        
        var sideMenuViewController = RESideMenu()

        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let slideInfoVC = GET_VIEW_CONTROLLER(StoryBoard_Home.SB_SLIDE_VIEW_CONTROLLER)
        let rootController = GET_VIEW_CONTROLLER(StoryBoard_Home.SB_HOME_TABBAR_VIEW_CONTROLLER)

        sideMenuViewController = RESideMenu.init(contentViewController: rootController, leftMenuViewController: slideInfoVC, rightMenuViewController: nil)
        
        sideMenuViewController.backgroundImage = UIImage(named: "Stars")
        sideMenuViewController.menuPreferredStatusBarStyle = .LightContent // UIStatusBarStyleLightContent
        sideMenuViewController.contentViewShadowColor = UIColor.blackColor()
        sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
        sideMenuViewController.contentViewShadowOpacity = 0.6
        sideMenuViewController.contentViewShadowRadius = 12
        sideMenuViewController.contentViewShadowEnabled = true
        
        appDelegate.window?.rootViewController = sideMenuViewController
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
