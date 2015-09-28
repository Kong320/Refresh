//
//  UITableView+NSYExtension.m
//  NSYRefresh
//
//  Created by qianfeng on 15/9/27.
//  Copyright © 2015年 聂嗣洋. All rights reserved.
//

#import "UITableView+NSYExtension.h"



@implementation UITableView (NSYExtension)

-(NSYHeadView *)addHeader
{
    NSYHeadView * headerView = [NSYHeadView headerView];
    [self addSubview:headerView];
    headerView.delegate = self;
    return headerView;
}

-(void)HeaderViewStatus:(NSYHeadView *)headerView status:(NSYHeaderViewStatus)status
{
    [self performSelector:@selector(sendRequst1:) withObject:headerView afterDelay:1.0];
}






-(NSYFootView *)addFooter
{
    NSYFootView * footerView = [NSYFootView footerView];
    [self addSubview:footerView];
    footerView.delegate = self;
    return footerView;
}

-(void)footerViewStatus:(NSYFootView *)footerView status:(NSYFooterViewStatus)status
{
    [self performSelector:@selector(sendRequst2:) withObject:footerView afterDelay:1.0];
}



-(void)sendRequst1:(NSYHeadView *)headerView
{
    [headerView stopAnimation];
}

-(void)sendRequst2:(NSYFootView *)footerView
{
    [footerView stopAnimation];
}

@end
