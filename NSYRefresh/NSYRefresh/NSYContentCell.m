//
//  NSYContentCell.m
//  NSYRefresh
//
//  Created by qianfeng on 15/9/26.
//  Copyright © 2015年 聂嗣洋. All rights reserved.
//

#import "NSYContentCell.h"

@implementation NSYContentCell

-(void)setSubject:(NSYSubject *)subject
{
    _subject = subject;

    self.iconImageView.image = [UIImage imageNamed:subject.icon];

    self.nameLabel.text = subject.title;
}


+(id)subejctCellWithTableView:(UITableView *)tableView
{
    return [self cellWithTableView:tableView];
}



@end
