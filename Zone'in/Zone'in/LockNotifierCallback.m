//
//  LockNotifierCallback.m
//  Zone'in
//
//  Created by Rean on 3/5/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

#import "LockNotifierCallback.h"

static void displayStatusChanged(CFNotificationCenterRef center,
                                 void *observer,
                                 CFStringRef name,
                                 const void *object,
                                 CFDictionaryRef userInfo) {
    if ([(__bridge NSString *)name  isEqual: @"com.apple.springboard.lockcomplete"]) {
        NSLog(@"Screen Locked");
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kDisplayStatusLocked"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}


@implementation LockNotifierCallback

+ (void(*)(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo))notifierProc {
    return displayStatusChanged;
}

@end
