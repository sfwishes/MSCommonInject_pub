//
//  MSHookClass.h
//  MSCommonInject
//
//  Created by starfall on 15/5/19.
//
//

#ifndef __MSCommonInject__MSHookClass__
#define __MSCommonInject__MSHookClass__

#include <stdio.h>
#import "CaptainHook.h"
#include "HookMicros.h"
#include "../MSInjectCommon/MSInjectHelper.h"

class MSHook;

class MSHookClass
{
public:
    MSHookClass();
    virtual ~MSHookClass();
    
protected:
    MSHook* pHook;
    
public:
    virtual NSString* className();
    virtual bool hook() = 0;
    
    void setHook(MSHook* hook);
    MSHook* getHook();
};

#endif /* defined(__MSCommonInject__MSHookClass__) */
