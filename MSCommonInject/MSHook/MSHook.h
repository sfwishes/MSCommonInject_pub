//
//  MSHook.h
//  MSCommonInject
//
//  Created by starfall on 15/5/19.
//
//
#ifndef MSCommonInject_MSHook_h
#define MSCommonInject_MSHook_h

#include <list>
#include "../MSInjectCommon/MSInjectHelper.h"
#include <pthread.h>

class MSHookClass;

class MSHook
{
public:
    MSHook();
    virtual ~MSHook();
    
protected:
    static MSHook* ms_pSharedMSHook;
    bool m_bFilter;
    
    std::list<MSHookClass*>* m_pHookClassList;
    
    bool AddHookClass(MSHookClass* hookClass);
    bool DeleteAllHookClass();
    
    NSString* logFile;
    
    pthread_mutex_t mutex;
    
public:
    static MSHook* sharedMSHook();
    void setFilter(bool open);
    bool filter();
    virtual bool hook();
    virtual NSString* className();
    
    void setLogFile(NSString* logFile);
    NSString* getLogFile();
    
    bool threadLock();
    bool threadUnlock();
};

#endif
