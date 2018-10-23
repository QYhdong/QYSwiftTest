//
//  AppDelegate.swift
//  QYSwiftTest
//
//  Created by ddd on 17/8/8.
//  Copyright © 2017年 HuangDong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let numberVc = UIStoryboard.init(name: "RXStoryboard", bundle: nil).instantiateViewController(withIdentifier: "HDRXNumberViewController")
//        self.window?.rootViewController = numberVc
        
        self.window?.rootViewController = HDRXGitHubSignupViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        
        let identifier = userActivity.userInfo?["kCSSearchableItemActivityIdentifier"]
        print("打印continueUserActivity\(String(describing: identifier))")
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

/*
     •iOS事件传递及响应者链条： 1.当iOS程序中发生触摸事件后，系统会将事件加入到UIApplication管理的一个任务队列中 2.UIApplication将处于任务队列最前端的事件向下分发。即UIWindow。 3.UIWindow将事件向下分发，即UIView。 4.UIView首先看自己是否能处理事件，触摸点是否在自己身上。如果能，那么继续寻找子视图。 5.遍历子控件，重复以上两步。 6.如果没有找到，那么自己就是事件处理者。如果 7.如果自己不能处理，那么不做任何处理。
 */
