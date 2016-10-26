//
//  LockNotificationCallBack.m
//  zone-in
//
//  Created by Rean on 9/27/16.
//  Copyright © 2016 Rean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LockNotifierCallback.h"
#import "zone-in-Bridging-Header.h"
#import "zone_in-Swift.h"

static void displayStatusChanged(CFNotificationCenterRef center,
                                 void *observer,
                                 CFNotificationName name,
                                 const void *object,
                                 CFDictionaryRef userInfo) {
    if ([(__bridge NSString *)name  isEqual: @"com.apple.springboard.lockcomplete"]) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate setLock];
    }
}


@implementation LockNotifierCallback : NSObject 

+ (void(*)(CFNotificationCenterRef center, void *observer, CFNotificationName name, const void *object, CFDictionaryRef userInfo))notifierProc {
    return displayStatusChanged;
}

@end
