//
//  AppDelegate.swift
//  mosdkDemo
//
//  Created by dengliang.wang on 2018/6/27.
//  Copyright © 2018年 morlia. All rights reserved.
//

import UIKit
import MOSDK
import Bugly
import Bolts
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit
import Partytrack


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,MOInitDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //魔亚SDK初始化
        MO.init(self)
        MO.instance().appDidFinishLaunching(application, options: launchOptions)
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
        
        //应用进去后台，同步状态
        MO.instance().appEnterBackground()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        //应用激活 同步状态
        MO.instance().appBecomeActive()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        //MO.instance().appOpenURL(app, url: url, sourceApp: <#T##String!#>, annotation: <#T##Any!#>)
        
        MO.instance().application(app, open: url, options: options)
        
        return true
    }
    
    
    func initSuccess(_ mo: MO!) {
        print("Demo init success")
    }
    
    func initFailure(_ error: MOError!) {
        
        print("initFailure code = %ld,description = %@" ,error.mCode, error.description)
    }
    
    
    
    


}

