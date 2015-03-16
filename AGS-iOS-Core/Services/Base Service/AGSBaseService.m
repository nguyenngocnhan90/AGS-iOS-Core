//
//  AGSBaseService.m
//  AGSCore
//
//  Created by Trần Tử Dương on 9/17/14.
//  Copyright (c) 2014 Agilsun Co., Ltd. All rights reserved.
//

#import "AGSBaseService.h"

@interface AGSBaseService()

@property (strong, nonatomic) NSString *baseUrlApi;

@end

@implementation AGSBaseService

- (id)initWithControllerName:(NSString *)controllerName
{
    self = [super init];
    if (self) {
        self.baseUrlApi = [NSString stringWithFormat:@"%@%@", self.baseUrlApi, controllerName];
    }
    
    return self;
}

- (NSString *)baseUrlApi
{
    if (!_baseUrlApi) {
        _baseUrlApi = @"http://192.168.10.110:8080/immanavi.api/";
    }
    
    return _baseUrlApi;
}

- (RequestInvoker *)createRequestInvokerWithMethodName:(NSString *)methodName requestMethod:(RequestMethod)requestMethod
{
    NSString *url = [NSString stringWithFormat:@"%@/%@", self.baseUrlApi, methodName];
    RequestInvoker *requestInvoker = [RequestInvoker requestInvokerWithUrl:url requestMethod:requestMethod];
    [requestInvoker setContentType:@"application/json; charset=UTF-8"];
    [requestInvoker setAuthorization:@"IeYxlenJV2WH+ip8mo5ab4nEcTpSsj0Dh1mXnp7cr2iPKuxMZDMzacwCmEnZOO32qMZ17PY0uD9ESGDPIxC0ZOoFcY/Fy91xRY+zY2rsl50AmE1VVH9ex1TVJpbPxNi/NTSHA+zCQNe+0gIKFk7ECWp1O/ajDK8gt2EN2/FkIQw="];
    
    return requestInvoker;
}


@end
