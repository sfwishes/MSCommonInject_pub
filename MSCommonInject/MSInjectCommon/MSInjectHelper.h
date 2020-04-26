//
//  MSInjectHelper.h
//  MSCommonInject
//
//  Created by starfall on 15/5/19.
//
//

#ifndef __MSCommonInject__MSInjectHelper__
#define __MSCommonInject__MSInjectHelper__

#include <stdio.h>
#import <Foundation/Foundation.h>
//#import <objc/message.h>

#define LOG_LEVEL_ERROR 3
#define LOG_LEVEL_DEBUG 5

class MSInjectHelper
{
public:
    MSInjectHelper();
    ~MSInjectHelper();
    
private:
    static int m_logLevel;
    
    static void logMsgV(NSString* msg, va_list args);
    
public:
    static NSString* appProcessName();
    static NSString* appHomeDirectory();
    static NSString* appDocumentsDirectory();
    static void logMsg(NSString* msg, ...);
    static void logDebugMsg(NSString* msg, ...);
    static void logErrorMsg(NSString* msg, ...);
    
};

#endif /* defined(__MSCommonInject__MSInjectHelper__) */
