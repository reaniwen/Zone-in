//  Hello World123
//  AppDelegate.swift
//  Zone'in
//
//  Created by Rean on 3/5/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let sharedData:Singleton = Singleton.sharedInstance


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), nil, LockNotifierCallback.notifierProc(), "com.apple.springboard.lockcomplete", nil, CFNotificationSuspensionBehavior.DeliverImmediately)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        let state: UIApplicationState = UIApplication.sharedApplication().applicationState
        if sharedData.isLocked == true && state == UIApplicationState.Background{
            println("screen is locked")
            
        }else if sharedData.isLocked == false && state == UIApplicationState.Background{
            println("home button is pressed")
            sharedData.isFailed = true
        }
        println("DidEnterBackground",state.rawValue)
        //useful here
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        
        sharedData.isLocked = false
        //also maybe useful here
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        let state: UIApplicationState = UIApplication.sharedApplication().applicationState
        if sharedData.isLocked == true && state == UIApplicationState.Background{
            println("screen is locked")
            
        }else if sharedData.isLocked == false && state == UIApplicationState.Background{
            println("home button is pressed")
            sharedData.isFailed = true
        }
        println("DidEnterBackground",state.rawValue)
    }

}



