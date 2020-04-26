//
//  MSCommonInject.mm
//  MSCommonInject
//
//  Created by starfall on 15/5/22.
//  Copyright (c) 2015年 __MyCompanyName__. All rights reserved.
//

// CaptainHook by Ryan Petrich
// see https://github.com/rpetrich/CaptainHook/

#import <Foundation/Foundation.h>
#import "CaptainHook/CaptainHook.h"
#include <notify.h> // not required; for examples only
#include "MSInjectCommon/MSInjectHelper.h"
#include "MSInjectDispatcher.h"

// Objective-C runtime hooking using CaptainHook:
//   1. declare class using CHDeclareClass()
//   2. load class using CHLoadClass() or CHLoadLateClass() in CHConstructor
//   3. hook method using CHOptimizedMethod()
//   4. register hook using CHHook() in CHConstructor
//   5. (optionally) call old method using CHSuper()


/*******************************************************************
使用方法：
 前言：此模板为注入后的hook模板，如果不实现hook功能，请在MSInjectDispatcher.mm中+ (bool) DispatchByProcess:(NSString*)processName函数中自己针对进程名进行处理。
 1. 添加要挂钩的app的hook类（appHook），继承自MSHook
 2. 添加要挂钩的app中的类的名称，继承自MSHookClass(appHookClass)，实现virtual bool hook() = 0;函数，参考MSDemoHookClass类
 3. 在appHook类的构造函数中添加appHookClass，参考MSDemoHook类
 4. 在MSCommonInject.mm中static PROCESS_INFO processInfos[]添加对应的app的信息
 5. 在MSCommonInject.plist中的Bundles下面添加对应app的BundleId
 6. 将工程设置的targets中的IOSOpenDevDevice中得ip换成你自己的
 7. 菜单栏-》product->build for->profiling
*******************************************************************/

@interface MSCommonInject : NSObject

@end

@implementation MSCommonInject

-(id)init
{
	if ((self = [super init]))
	{
	}

    return self;
}

@end

static void WillEnterForeground(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
	// not required; for example only
}

static void ExternallyPostedNotification(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
	// not required; for example only
}

CHConstructor // code block that runs immediately upon load
{
	@autoreleasepool
	{
        MSInjectHelper::logDebugMsg(@"CHConstructor start!");
		// listen for local notification (not required; for example only)
		CFNotificationCenterRef center = CFNotificationCenterGetLocalCenter();
		CFNotificationCenterAddObserver(center, NULL, WillEnterForeground, CFSTR("UIApplicationWillEnterForegroundNotification"), NULL, CFNotificationSuspensionBehaviorCoalesce);
		
		// listen for system-side notification (not required; for example only)
		// this would be posted using: notify_post("com.sfSoft.MSCommonInject.eventname");
		CFNotificationCenterRef darwin = CFNotificationCenterGetDarwinNotifyCenter();
		CFNotificationCenterAddObserver(darwin, NULL, ExternallyPostedNotification, CFSTR("com.sfSoft.MSCommonInject.eventname"), NULL, CFNotificationSuspensionBehaviorCoalesce);
        
        [MSInjectDispatcher DispatchByProcess];
		
		MSInjectHelper::logDebugMsg(@"CHConstructor end!");
	}
}
