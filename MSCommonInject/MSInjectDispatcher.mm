//
//  MSInjectDispatcher.m
//  MSCommonInject
//
//  Created by starfall on 15/5/18.
//
//

#import "MSInjectDispatcher.h"
#include "MSHook/MSHookHeader.h"
#include "MSInjectCommon/MSInjectHelper.h"

@implementation MSInjectDispatcher

+(bool) DispatchByProcess
{
    NSString* processName = MSInjectHelper::appProcessName();
    if (nil == processName || [processName isEqualToString:@""]) {
        return false;
    }
    
    MSInjectHelper::logDebugMsg(@"MSInjectDispatcher::DispatchByProcess processName: %@!", processName);
    
    return [MSInjectDispatcher DispatchByProcess:processName];
}

+ (bool) DispatchByProcess:(NSString*)processName
{
    //针对不同的进程做不同的事，这里只处理演示钩子
    MSHook* hook = MSHookCreator::createHookByProcessName(processName);
    
    if(nil == hook)
    {
        return false;
    }
    
    hook->setFilter(true);
    return hook->hook();
}

@end
