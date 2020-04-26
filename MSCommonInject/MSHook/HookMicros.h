//
//  HookMicros.h
//  MSCommonInject
//
//  Created by starfall on 15/5/19.
//
//

#ifndef MSCommonInject_HookMicros_h
#define MSCommonInject_HookMicros_h

#include "MSHook.h"

#define HOOK_START  if(MSHook::sharedMSHook()->filter()){

#define HOOK_END    }

#endif
