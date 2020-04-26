//
//  MSDemoHookClass.h
//  MSCommonInject
//
//  Created by starfall on 15/5/22.
//
//

#ifndef __MSCommonInject__MSDemoHookClass__
#define __MSCommonInject__MSDemoHookClass__

#include <stdio.h>
#include "../MSHookClass.h"

class MSDemoHookClass : public MSHookClass
{
public:
    MSDemoHookClass();
    virtual ~MSDemoHookClass();
    
public:
    virtual bool hook();
};

#endif /* defined(__MSCommonInject__MSDemoHookClass__) */
