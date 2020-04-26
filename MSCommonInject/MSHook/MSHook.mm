//
//  MSHook.m
//  MSCommonInject
//
//  Created by starfall on 15/5/19.
//
//

#include "MSHook.h"
#include "MSHookClass.h"

MSHook* MSHook::ms_pSharedMSHook = NULL;

MSHook::MSHook()
{
    MSInjectHelper::logDebugMsg(@"MSHook::MSHook called!");
    pthread_mutex_init(&mutex, NULL);
    ms_pSharedMSHook = this;
    m_bFilter = false;
    m_pHookClassList = new std::list<MSHookClass*>();
    logFile = nullptr;
}

MSHook::~MSHook()
{
    MSInjectHelper::logDebugMsg(@"MSHook::~MSHook called!");
    if (nil != m_pHookClassList) {
        DeleteAllHookClass();
        delete m_pHookClassList;
        m_pHookClassList = nil;
    }
    
//    if (nullptr != this->logFile) {
//        [this->logFile release];
//        this->logFile = nullptr;
//    }
    
    pthread_mutex_destroy(&mutex);
}

MSHook* MSHook::sharedMSHook()
{
    return ms_pSharedMSHook;
}

bool MSHook::AddHookClass(MSHookClass* hookClass)
{
    if (nil == hookClass) {
        return false;
    }
    
    MSInjectHelper::logDebugMsg(@"MSHook::AddHookClass - > %@", hookClass->className());
    
    m_pHookClassList->push_back(hookClass);
    hookClass->setHook(this);
    return true;
}

bool MSHook::DeleteAllHookClass()
{
    MSInjectHelper::logDebugMsg(@"MSHook::DeleteAllHookClass");
    
    std::list<MSHookClass*>::iterator i;
    for (i = m_pHookClassList->begin(); i != m_pHookClassList->end(); i++) {
        MSHookClass* hookClass = dynamic_cast<MSHookClass*>(*i);
        if (nil != hookClass) {
            
            MSInjectHelper::logDebugMsg(@"MSHook::DeleteHookClass - > %@", hookClass->className());
            
            delete hookClass;
        }
    }
    
    m_pHookClassList->clear();
    return true;
}

void MSHook::setFilter(bool open)
{
    m_bFilter = open;
}

bool MSHook::filter()
{
    return m_bFilter;
}

bool MSHook::hook()
{
    MSInjectHelper::logDebugMsg(@"MSHook::hook called!");
    std::list<MSHookClass*>::iterator i;
    for (i = m_pHookClassList->begin(); i != m_pHookClassList->end(); i++) {
        MSHookClass* hookClass = dynamic_cast<MSHookClass*>(*i);
        if (nil != hookClass) {
            hookClass->hook();
        }
    }
    
    return true;
}

NSString* MSHook::className()
{
    NSString* className = [[NSString alloc] initWithFormat:@"%s", typeid(this).name()];
    [className autorelease];
    return className;
}

void MSHook::setLogFile(NSString* logFile)
{
//    if (nullptr != this->logFile) {
//        [this->logFile release];
//        this->logFile = nullptr;
//    }
    this->logFile = [[NSString alloc] initWithString:logFile];
}

NSString* MSHook::getLogFile()
{
    return this->logFile;
}

bool MSHook::threadLock()
{
    pthread_mutex_lock(&mutex);
}

bool MSHook::threadUnlock()
{
    pthread_mutex_unlock(&mutex);
}
