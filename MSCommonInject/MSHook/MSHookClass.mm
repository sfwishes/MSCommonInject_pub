//
//  MSHookClass.cpp
//  MSCommonInject
//
//  Created by starfall on 15/5/19.
//
//

#include "MSHookClass.h"
#include "MSHook.h"

MSHookClass::MSHookClass()
{
   MSInjectHelper::logDebugMsg(@"MSHookClass::MSHookClass called!");
    pHook = nullptr;
}

MSHookClass::~MSHookClass()
{
    MSInjectHelper::logDebugMsg(@"MSHookClass::~MSHookClass called!");
}

NSString* MSHookClass::className()
{
    NSString* className = [[NSString alloc] initWithFormat:@"%s", typeid(this).name()];
    [className autorelease];
    return className;
}

void MSHookClass::setHook(MSHook* hook)
{
    this->pHook = hook;
}

MSHook* MSHookClass::getHook()
{
    return pHook;
}
