//
//  AppDelegate.swift
//  zone-in
//
//  Created by Rean on 1/31/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit
import CoreData

let BLUE_COLOR = UIColor(red: 199/255, green: 238/255, blue: 238/255, alpha: 1)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var isLocked = false
    var delegate: SyncTimerDelegate?
    var count = 0
    var lockTime = Date()
    
    
    func setLock() {
        self.isLocked = true
        if let c = delegate?.getCurrentCount(){
            count = c
        }
        lockTime = Date()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "com.zonein.lockcomplete"), object: self)
    }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        // add an observer to detect screen lock
//        let observer = UnsafeRawPointer(Unmanaged.passUnretained(self).toOpaque())
//        
//        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), observer, {(center, observer, name, object, userInfo) -> Void in
//            let lockState: String = String(describing: name)
////            NSLog(name as String)
////            NSLog(name.name)
//            if lockState.isEqual("com.apple.springboard.lockcomplete") {
////                NSLog("Screen locked")
//                let mySelf = Unmanaged<AppDelegate>.fromOpaque(OpaquePointer(observer)!).takeUnretainedValue()
////                mySelf.setLock()
////                self.setLock()
//            }
//            }, "com.apple.springboard.lockcomplete" as CFString!, nil, CFNotificationSuspensionBehavior.deliverImmediately)
        
        
        initUserDefault()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//        - (void)applicationDidEnterBackground:(UIApplication *)application {
//            CGFloat screenBrightness = [[UIScreen mainScreen] brightness];
//            NSLog(@"Screen brightness: %f", screenBrightness);
//            self.backgroundedToLockScreen = screenBrightness <= 0.0;
//        }
        let screenBrightness = UIScreen.main.brightness
        NSLog("Screen brightness: "+String(describing: screenBrightness))

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        
        // This part is to check whether screen is locked or home button pressed
        let state: UIApplicationState = UIApplication.shared.applicationState
        if self.isLocked == true && state == UIApplicationState.background{
            // Screen locked
            NSLog("Screen is locked")
            self.isLocked = false
            delegate?.setNewCount(self.count - Int(Date().timeIntervalSince(self.lockTime)))
            
        }else if self.isLocked == false && state == UIApplicationState.background{
            
            // Home button pressed
            NSLog("Home button is pressed")
            // Send notification about failed
            NotificationCenter.default.post(name: Notification.Name(rawValue: "com.zonein.homeButtonPressed"), object: self)
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: URL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.zonein.zone_in" in the application's documents Application Support directory.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = Bundle.main.url(forResource: "zone_in", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject?
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject?

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    func initUserDefault() {
        if UserDefaults.standard.bool(forKey: "com.zonein.inited") == false {
            let pref = UserDefaults.standard
            pref.set(true, forKey: "com.zonein.inited")
            pref.set(0, forKey: "com.zonein.continusDays")
            pref.set("", forKey: "com.zonein.lastUseDay")
            pref.set(0, forKey: "com.zonein.totalLength")
            pref.set(0, forKey: "com.zonein.totalTimes")
        }
        print("inited:", UserDefaults.standard.bool(forKey: "com.zonein.inited"))
    }

}

