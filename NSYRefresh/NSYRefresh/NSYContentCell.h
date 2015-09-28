//
//  NSYContentCell.h
//  NSYRefresh
//
//  Created by qianfeng on 15/9/26.
//  Copyright © 2015年 聂嗣洋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSYSubject.h"
#import "UITableViewCell+initcell.h"

@interface NSYContentCell : UITableViewCell

@property (nonatomic,strong)NSYSubject *subject;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;


+(id)subejctCellWithTableView:(UITableView *)tableView;

@end
