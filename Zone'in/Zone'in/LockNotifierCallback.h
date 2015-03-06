//
//  LockNotifierCallback.h
//  Zone'in
//
//  Created by Rean on 3/5/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LockNotifierCallback : NSObject
{
    int lockState;
}

+ (void(*)(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo))notifierProc;


@end
