//
//  HomeSplashAnimViewController.swift
//  Slide
//
//  Created by Phoebe Xie on 26/1/16.
//  Copyright © 2016 iAPPS Pte Ltd. All rights reserved.
//

import UIKit

class HomeSplashAnimViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logo.alpha = 0

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
                    // go to tab home page
                    let storyboard = UIStoryboard(name: ConstantHome.SB_HOME, bundle: nil)
                    let vc = storyboard.instantiateViewControllerWithIdentifier(ConstantHome.SB_HOME_TAB_MAIN) as? TabBarViewController
                    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    self.dismissViewControllerAnimated(true, completion: nil)
                    appDelegate.window?.rootViewController = vc
            })
        })

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
