//
//  MultiPart.m
//  RESTFULClient
//
//  Created by Minh Khanh on 8/12/14.
//  Copyright (c) 2014 Minh Khanh. All rights reserved.
//

#import "MultiPart.h"

@implementation MultiPart

- (id)initWithName:(NSString *)name contentType:(NSString *)contentType andData:(NSData *)data
{
    self = [super init];
    if (self) {
        self.name = name;
        self.contentType = contentType;
        self.data = data;
    }
    
    return self;
}

- (NSMutableDictionary *)getHeaders
{
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    [headers setValue:[NSString stringWithFormat:@"form-data; name=\"%@\"", self.name] forKey:@"Content-Disposition"];
    [headers setValue:self.contentType forKey:@"Content-Type"];
    
    return headers;
}

@end

///////////////////////////////////////////

@implementation JsonPart

- (id)initWithName:(NSString *)name andJsonModel:(JsonSerializable *)model
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:[model toDictionary] options:0 error:nil];
    self = [super initWithName:name contentType:@"application/json; charset=UTF-8" andData:data];
    
    return self;
}

@end

///////////////////////////////////////////

@implementation FilePart

- (id)initWithName:(NSString *)name fileName:(NSString *)fileName andData:(NSData *)data
{
    self = [super initWithName:name contentType:@"application/octet-stream" andData:data];
    if (self) {
        self.fileName = fileName;
    }
    
    return self;
}

- (NSMutableDictionary *)getHeaders
{
    NSMutableDictionary *headers = [super getHeaders];
    [headers setValue:[NSString stringWithFormat:@"form-data; name=\"%@\"; filename=\"%@\"", self.name, self.fileName] forKey:@"Content-Disposition"];
    
    return headers;
}

@end