//
//  NSYSubject.m
//  NSYRefresh
//
//  Created by qianfeng on 15/9/26.
//  Copyright © 2015年 聂嗣洋. All rights reserved.
//

#import "NSYSubject.h"


@implementation NSYSubject
+(id)subjectWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"title = %@ note = %@    ", _title,_note];
}
@end
