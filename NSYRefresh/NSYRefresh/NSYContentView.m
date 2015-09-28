//
//  NSYContentView.m
//  NSYRefresh
//
//  Created by qianfeng on 15/9/26.
//  Copyright © 2015年 聂嗣洋. All rights reserved.
//

#import "NSYContentView.h"
#import "NSYContentCell.h"


#import "UITableView+NSYExtension.h"

@interface NSYContentView()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) NSYHeadView *headerView;
@property (weak, nonatomic) NSYFootView *footerView;


@end

@implementation NSYContentView

-(void)setSubjectArray:(NSArray *)subjectArray
{
    _subjectArray = subjectArray;
    [self.tableView reloadData];
}

- (void)awakeFromNib
{

    
    NSYHeadView *headerView =[self.tableView addHeader];
    
    [headerView setTitle:@"哈哈" forState:NSYHeaderViewStatusBeginDrag];
    [headerView setTitle:@"你好" forState:NSYHeaderViewStatusDragging];
    [headerView setTitle:@"再见" forState:NSYHeaderViewStatusLoading];

    
    NSYFootView *footerView = [self.tableView addFooter];
    
    [footerView setTitle:@"拖拽加载更多" forState:NSYFooterViewStatusBeginDrag];
    [footerView setTitle:@"松开加载更多" forState:NSYFooterViewStatusDragging];
    [footerView setTitle:@"正在加载中" forState:NSYFooterViewStatusLoading];
   
}

-(void)dealHeader
{
    
}

+(id)contentView
{
    //    return [[self alloc] init];
    return  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = newSuperview.bounds;
    self.backgroundColor = [UIColor yellowColor];
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.subjectArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSYContentCell *cell = [NSYContentCell subejctCellWithTableView:tableView];
    cell.subject = self.subjectArray[indexPath.row];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


#pragma mark UITableViewDelegate


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}




//-(void)HeaderViewStatus:(NSYHeadView *)HeaderView status:(NSYHeaderViewStatus)status
//{
//    [self performSelector:@selector(sendRequst) withObject:nil afterDelay:1.0];
//}
//
//
//-(void)footerViewStatus:(NSYFootView *)footerView status:(NSYFooterViewStatus)status
//{
//    [self performSelector:@selector(sendRequst) withObject:nil afterDelay:1.0];
//}

//-(void)sendRequst
//{
//    [self.headerView stopAnimation];
//    [self.footerView stopAnimation];
//}


@end
