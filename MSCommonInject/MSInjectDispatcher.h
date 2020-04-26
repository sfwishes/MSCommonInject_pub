//
//  MSInjectDispatcher.h
//  MSCommonInject
//
//  Created by starfall on 15/5/18.
//
//

#import <Foundation/Foundation.h>

@interface MSInjectDispatcher : NSObject

+ (bool) DispatchByProcess;
+ (bool) DispatchByProcess:(NSString*)processName;

@end
