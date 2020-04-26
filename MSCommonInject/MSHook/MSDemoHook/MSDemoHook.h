//
//  MSDemoHook.h
//  MSCommonInject
//
//  Created by starfall on 15/5/22.
//
//

#ifndef __MSCommonInject__MSDemoHook__
#define __MSCommonInject__MSDemoHook__

#include <stdio.h>
#include "../MSHook.h"

class MSDemoHook : public MSHook
{
public:
    MSDemoHook();
    virtual ~MSDemoHook();
    
    static MSHook* createObject();
};

#endif /* defined(__MSCommonInject__MSDemoHook__) */
