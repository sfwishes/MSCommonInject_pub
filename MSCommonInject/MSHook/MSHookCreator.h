//
//  MSHookCreator.h
//  MSCommonInject
//
//  Created by starfall on 15/5/19.
//
//

#ifndef __MSCommonInject__MSHookCreator__
#define __MSCommonInject__MSHookCreator__

#include <stdio.h>
#import <Foundation/Foundation.h>
#include <string>

class MSHook;

typedef MSHook* (*CreateObj)();

typedef struct process_info
{
    NSString* name;
    CreateObj constructor;
    BOOL hasLogFile;
} PROCESS_INFO;

class MSHook;

class MSHookCreator
{
public:
    MSHookCreator();
    ~MSHookCreator();
    
public:
    static MSHook* createHookByProcessName(NSString* processName);
    
protected:
    static PROCESS_INFO* getProcessInfoByProcessName(NSString* processName);
};

#endif /* defined(__MSCommonInject__MSHookCreator__) */
