//
//  MSDemoHook.cpp
//  MSCommonInject
//
//  Created by starfall on 15/5/22.
//
//

#include "MSDemoHook.h"
#include "MSDemoHookClass.h"

MSDemoHook::MSDemoHook()
{
    MSInjectHelper::logDebugMsg(@"MSDemoHook::MSDemoHook called!");
    AddHookClass(new MSDemoHookClass());
}

MSDemoHook::~MSDemoHook()
{
    MSInjectHelper::logDebugMsg(@"MSDemoHook::~MSDemoHook called!");
}

MSHook* MSDemoHook::createObject()
{
    return new MSDemoHook();
}
