//
//  AppDelegate.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 02/04/16.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var sideMenuViewController = RESideMenu()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        initSideMenu()
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.rootViewController = sideMenuViewController
        self.window!.makeKeyAndVisible()
        return true
    }

    
    private func initSideMenu () {
        
        let rootController = GET_VIEW_CONTROLLER(StoryBoard_Home.SB_HOME_SPLASH_ANIMATION)
        let navigationController = UINavigationController(rootViewController: rootController)
        let slideInfoVC = GET_VIEW_CONTROLLER(StoryBoard_Home.SB_SLIDE_VIEW_CONTROLLER)
        sideMenuViewController = RESideMenu.init(contentViewController: navigationController, leftMenuViewController: slideInfoVC, rightMenuViewController: nil)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

