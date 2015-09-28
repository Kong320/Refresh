//
//  NSObject+Model.m
//  美食
//
//  Created by qianfeng on 15-9-22.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "NSObject+Model.h"

@implementation NSObject (Model)

+(id)objectWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [self init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
