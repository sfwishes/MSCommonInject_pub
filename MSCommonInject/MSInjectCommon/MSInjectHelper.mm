//
//  MSInjectHelper.cpp
//  MSCommonInject
//
//  Created by starfall on 15/5/19.
//
//

#include "MSInjectHelper.h"

int MSInjectHelper::m_logLevel = LOG_LEVEL_DEBUG;

MSInjectHelper::MSInjectHelper()
{
    
}

MSInjectHelper::~MSInjectHelper()
{
    
}

NSString* MSInjectHelper::appProcessName()
{
    NSString* processName = @"";
    NSProcessInfo* currentProcessInfo = [NSProcessInfo processInfo];
    if (nil == currentProcessInfo) {
        return processName;
    }
    
    processName = [currentProcessInfo processName];
    
    MSInjectHelper::logDebugMsg(@"current process name: %@", processName);
    
    return processName;
}

NSString* MSInjectHelper::appHomeDirectory()
{
    return NSHomeDirectory();
}

NSString* MSInjectHelper::appDocumentsDirectory()
{
    return [appHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

void MSInjectHelper::logMsgV(NSString* msg, va_list args)
{
    NSLogv(msg, args);
}

void MSInjectHelper::logMsg(NSString* msg, ...)
{
    va_list argp;
    va_start(argp, msg);
    logMsgV(msg, argp);
    va_end(argp);
}

void MSInjectHelper::logDebugMsg(NSString* msg, ...)
{
    if (m_logLevel >= LOG_LEVEL_DEBUG) {
        va_list argp;
        va_start(argp, msg);
        logMsgV(msg, argp);
        va_end(argp);
    }
}

void MSInjectHelper::logErrorMsg(NSString* msg, ...)
{
    if (m_logLevel >= LOG_LEVEL_ERROR) {
        va_list argp;
        va_start(argp, msg);
        logMsgV(msg, argp);
        va_end(argp);
    }
}