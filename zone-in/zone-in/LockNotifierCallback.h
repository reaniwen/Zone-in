//
//  LockNotificationCallBack.h
//  zone-in
//
//  Created by Rean on 9/27/16.
//  Copyright © 2016 Rean. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef LockNotificationCallBack_h
#define LockNotificationCallBack_h

@interface LockNotifierCallback : NSObject


+ (void(*)(CFNotificationCenterRef center, void *observer, CFNotificationName name, const void *object, CFDictionaryRef userInfo))notifierProc;


@end

#endif /* LockNotificationCallBack_h */
