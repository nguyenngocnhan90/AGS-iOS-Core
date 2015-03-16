//
//  AGSBaseService.h
//  AGSCore
//
//  Created by Trần Tử Dương on 9/17/14.
//  Copyright (c) 2014 Agilsun Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGSBaseService : NSObject

- (id)initWithControllerName:(NSString *)controllerName;
- (RequestInvoker *)createRequestInvokerWithMethodName:(NSString *)methodName requestMethod:(RequestMethod)requestMethod;

@end
