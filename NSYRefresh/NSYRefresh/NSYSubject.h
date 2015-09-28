//
//  NSYSubject.h
//  NSYRefresh
//
//  Created by qianfeng on 15/9/26.
//  Copyright © 2015年 聂嗣洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Model.h"

@interface NSYSubject : NSObject
@property(nonatomic,copy) NSString * title;
@property(nonatomic,copy) NSString * cardNumber;
@property(nonatomic,copy) NSString * note;
@property(nonatomic,copy) NSString * icon;

+(id)subjectWithDict:(NSDictionary *)dict;
@end
