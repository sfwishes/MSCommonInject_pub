//
//  MSHookCreator.cpp
//  MSCommonInject
//
//  Created by starfall on 15/5/19.
//
//

#include "MSHookCreator.h"
#include "HookApps.h"
#import <Foundation/Foundation.h>

using namespace std;

MSHookCreator::MSHookCreator()
{
    
}

MSHookCreator::~MSHookCreator()
{
    
}

static PROCESS_INFO processInfos[] = {
    {@"Demooooo", MSDemoHook::createObject, false}
};

PROCESS_INFO* MSHookCreator::getProcessInfoByProcessName(NSString* processName)
{
    int supportCount = sizeof(processInfos) / sizeof(PROCESS_INFO);
    PROCESS_INFO* find = nullptr;
    for (int i = 0; i < supportCount; i++) {
        if ([processName isEqualToString:processInfos[i].name]) {
            find = &processInfos[i];
            break;
        }
    }
    
    return find;
}

MSHook* MSHookCreator::createHookByProcessName(NSString* processName)
{
    if (nil == processName) {
        return nullptr;
    }
    
    PROCESS_INFO* info = getProcessInfoByProcessName(processName);
    if (nullptr == info) {
        return nullptr;
    }
    
    MSHook* hook = (*info->constructor)();
    if (nullptr == hook) {
        return nullptr;
    }
    
    if (info->hasLogFile) {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyyMMddHHmmss"];
        NSString* time = [df stringFromDate:[NSDate date]];
        NSString* file = [[NSString alloc] initWithFormat:@"%s/%@", "decode", time];
        NSString* docPath = [NSHomeDirectory() stringByAppendingPathComponent: @"Documents"];
        NSString* path = [NSString stringWithFormat: @"%@/%@", docPath, file];
        
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString* p = [NSString stringWithFormat: @"%@/%s", docPath, "decode"];
        BOOL isDir = FALSE;
        BOOL isDirExist = [fileManager fileExistsAtPath:p isDirectory:&isDir];
        if(!(isDirExist && isDir))
        {
            BOOL bCreateDir = [fileManager createDirectoryAtPath:p withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        MSInjectHelper::logDebugMsg(@"MSHookCreator::createHookByProcessName log file name: %@!", path);
        hook->setLogFile(path);
    }
    
    NSString* hookClassName = hook->className();
    
    MSInjectHelper::logDebugMsg(@"MSHookCreator::createHookByProcessName hookClassName: %@!", hookClassName);
    
    return hook;
}

