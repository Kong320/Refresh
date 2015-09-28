//
//  UITableView+NSYExtension.h
//  NSYRefresh
//
//  Created by qianfeng on 15/9/27.
//  Copyright © 2015年 聂嗣洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSYFootView.h"
#import "NSYHeadView.h"


@interface UITableView (NSYExtension)<NSYHeadViewDelegate,NSYFootViewDelegate>

-(NSYHeadView *)addHeader;
-(NSYFootView *)addFooter;

@end
