//
//  readme.h
//  NSYRefresh
//
//  Created by qianfeng on 15/9/27.
//  Copyright © 2015年 聂嗣洋. All rights reserved.
//

/*
 我是个小菜鸡,第一次写上下拉刷新方法,很多不足,请原谅.
 还有很多不完善的地方请大神指出来
 
 
 
 再三声明,这个库不适合真正加入的大项目中,如果出现问题,概不负责
 下载过程使用延时方法模拟下载
 */





//使用方法:
//只需要导入#import "UITableView+NSYExtension.h"

#pragma mark 方法1 下拉刷新方法
//这个方法在tableView头部创建下拉刷新方法
//返回值:NSYHeadView
-(NSYHeadView *)addHeader;

//上述方法的返回值来设置滑动和正在加载时的文字
//NSYHeaderViewStatus为枚举,有三种值
/*
 enum NSYHeaderViewStatus
 {
 NSYHeaderViewStatusBeginDrag, //拖拽读取更多
 NSYHeaderViewStatusDragging,  //松开读取更多
 NSYHeaderViewStatusLoading,   //正在读取
 
 };
 */
- (void)setTitle:(NSString *)title forState:(NSYHeaderViewStatus)status;


#pragma mark 方法2 上拉加载方法
//这个方法在tableView尾部创建上拉加载方法
//返回值:NSYFootView
-(NSYFootView *)addFooter;


//上述方法的返回值来设置滑动和正在加载时的文字
//NSYFooterViewStatus为枚举,有三种值
/*
 enum NSYFooterViewStatus
 {
 NSYFooterViewStatusBeginDrag, //拖拽读取更多
 NSYFooterViewStatusDragging,  //松开读取更多
 NSYFooterViewStatusLoading,   //正在读取
 
 };
 */
- (void)setTitle:(NSString *)title forState:(NSYFooterViewStatus)status;






