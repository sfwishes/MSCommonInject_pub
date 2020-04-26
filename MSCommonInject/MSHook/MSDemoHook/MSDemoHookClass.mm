//
//  MSDemoHookClass.cpp
//  MSCommonInject
//
//  Created by starfall on 15/5/22.
//
//

#include "MSDemoHookClass.h"

@class ClassToHook;

CHDeclareClass(ClassToHook); // declare class

CHOptimizedMethod(0, self, void, ClassToHook, messageName) // hook method (with no arguments and no return value)
{
    HOOK_START
    // write code here ...
    HOOK_END
    
    CHSuper(0, ClassToHook, messageName); // call old (original) method
}

CHOptimizedMethod(2, self, BOOL, ClassToHook, arg1, NSString*, value1, arg2, BOOL, value2) // hook method (with 2 arguments and a return value)
{
    HOOK_START
    // write code here ...
    HOOK_END
    
    return CHSuper(2, ClassToHook, arg1, value1, arg2, value2); // call old (original) method and return its return value
}


MSDemoHookClass::MSDemoHookClass()
{
    MSInjectHelper::logDebugMsg(@"MSDemoHookClass::MSDemoHookClass called!");
}

MSDemoHookClass::~MSDemoHookClass()
{
    MSInjectHelper::logDebugMsg(@"MSDemoHookClass::~MSDemoHookClass called!");
}

bool MSDemoHookClass::hook()
{
    MSInjectHelper::logDebugMsg(@"MSDemoHookClass::hook called!");
    
    // CHLoadClass(ClassToHook); // load class (that is "available now")
    // CHLoadLateClass(ClassToHook);  // load class (that will be "available later")
    
    CHHook(0, ClassToHook, messageName); // register hook
    CHHook(2, ClassToHook, arg1, arg2); // register hook
    
    return true;
}