//
//  NSYFootView.m
//  NSYRefresh
//
//  Created by qianfeng on 15/9/26.
//  Copyright © 2015年 聂嗣洋. All rights reserved.
//

#import "NSYFootView.h"

@interface NSYFootView()
@property(nonatomic,weak)UIButton * alertButtonView;

@property(nonatomic,weak)UIView * loadingView;

@property(nonatomic,assign)UIScrollView *scrollView;

@end


@implementation NSYFootView
{
    NSString * _beginDragText;
    NSString * _draggingText;
    NSString * _loadingText;
    
}


#pragma mark 根据状态设置,返回对应状态的title
- (void)setTitle:(NSString *)title forState:(NSYFooterViewStatus)status//5
{
    switch (status) {
            
        case NSYFooterViewStatusBeginDrag:
            _beginDragText = title;
            break;
        case NSYFooterViewStatusDragging:
            _draggingText = title;
            break;
        case NSYFooterViewStatusLoading:
            _loadingText = title;
            break;
            
        default:
            break;
    }
    
}

#pragma mark 设置status
-(void)setStatus:(NSYFooterViewStatus)status
{
    _status = status;
    
    switch (status) {
        case NSYFooterViewStatusBeginDrag:
            [self.alertButtonView setTitle:[self titleWithStatus:status] forState:UIControlStateNormal];
            break;
        case NSYFooterViewStatusDragging:
            [self.alertButtonView setTitle:[self titleWithStatus:status]  forState:UIControlStateNormal];
            break;
        case NSYFooterViewStatusLoading:
            self.alertButtonView.hidden = YES;
            [self loadingView];
            break;
        default:
            break;
    }
    
}

#pragma mark 根据状态返回相应title的值,且带有默认值
- (NSString *)titleWithStatus:(NSYFooterViewStatus)status
{
    NSString * title = nil;
    
    switch (status) {
            
        case NSYFooterViewStatusBeginDrag:
            title = _beginDragText?_beginDragText:@"拖拽";
            break;
        case NSYFooterViewStatusDragging:
            title = _draggingText?_draggingText:@"松开";
            break;
        case NSYFooterViewStatusLoading:
            title = _loadingText?_loadingText:@"加载";
            break;
            
        default:
            break;
    }
    
    return title;
}

#pragma mark 设置scrollView属性 添加监听@"contentOffset"
-(void)setScrollView:(UIScrollView *)scrollView//4
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    _scrollView = scrollView;
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark 监听scrollView值新值变化执行
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context//6+
{
    //如果status的值等于NSYFooterViewStatusLoading则返回,不执行以下代码
    if (self.status == NSYFooterViewStatusLoading) return;
    
    //重新设置scrollView的偏移量
    [self willMoveToSuperview:self.scrollView];
    
    if (self.scrollView.isDragging) {
        CGFloat maxY = _scrollView.contentSize.height - _scrollView.frame.size.height;
        CGFloat footerViewHeight = self.frame.size.height;
        
        if (_scrollView.contentOffset.y >= maxY && _scrollView.contentOffset.y < maxY + footerViewHeight) {
            [self setStatus:NSYFooterViewStatusBeginDrag];
        }
        else if (_scrollView.contentOffset.y > maxY + footerViewHeight)
        {
            [self setStatus:NSYFooterViewStatusDragging];
        }
        
    }
    else
    {
        if (self.status == NSYFooterViewStatusDragging)
        {
            [self setStatus:NSYFooterViewStatusLoading];
            _scrollView.contentInset = UIEdgeInsetsMake(0, 0, self.frame.size.height, 0);
            
            [_delegate footerViewStatus:self status:NSYFooterViewStatusLoading];
            
        }
    }
    
}


#pragma mark 设置正在加载时的View 内容为这个View同样大小的label 且带有菊花
-(UIView *)loadingView
{
    if (_loadingView == nil) {
        UIView *loadingView = [UIView new];
        [self addSubview:loadingView];
        _loadingView = loadingView;
        loadingView.frame = self.bounds;
        
        UILabel *labelTitle = [UILabel new];
        [loadingView addSubview:labelTitle];

        labelTitle.text =  [self titleWithStatus:NSYFooterViewStatusLoading];
        labelTitle.frame = loadingView.bounds;
        labelTitle.textColor = [UIColor grayColor];
        labelTitle.font = [UIFont boldSystemFontOfSize:12];
        labelTitle.textAlignment = NSTextAlignmentCenter;
        
        UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView addSubview:activity];
        activity.frame = CGRectMake(120, 10, 40, 40);
        [activity startAnimating];
        
    }
    
    return _loadingView;
}

#pragma mark 上拉时显示的View
-(UIButton *)alertButtonView
{

    if (_alertButtonView == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        btn.frame = self.bounds;
        
        _alertButtonView = btn;
        
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        
        [btn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        
    }
    return _alertButtonView;
}


#pragma mark 创建这个View 类方法
+ (id)footerView//1
{
    return [[self alloc] init];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    //1.添加到那里?
    UITableView * tableView = (UITableView *)newSuperview;
    //2.添加到什么位置?
    CGFloat selfX = 0;
    CGFloat selfY = tableView.contentSize.height;
    CGFloat selfW = tableView.frame.size.width;
    CGFloat selfH = 60;
    
    self.frame = CGRectMake(selfX, selfY, selfW, selfH);
    
    
    self.backgroundColor = [UIColor yellowColor];
    
    
}

#pragma mark 将父视图 指向为当前View的scrollView
- (void)didMoveToSuperview
{
    self.scrollView = self.superview;
}


- (void)stopAnimation
{

    self.scrollView.contentInset = UIEdgeInsetsMake(0,0,0,0);

    [self clear];
}

- (void)clear
{
    [self.alertButtonView removeFromSuperview];

    [self.loadingView removeFromSuperview];

    self.status = NSYFooterViewStatusBeginDrag;
}

#pragma mark 销毁当前View时移除KVO
- (void)dealloc
{
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
}


@end
