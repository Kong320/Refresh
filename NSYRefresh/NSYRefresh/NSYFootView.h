//
//  NSYFootView.h
//  NSYRefresh
//
//  Created by qianfeng on 15/9/26.
//  Copyright © 2015年 聂嗣洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NSYFootView;
enum NSYFooterViewStatus
{
    NSYFooterViewStatusBeginDrag, //拖拽读取更多
    NSYFooterViewStatusDragging,  //松开读取更多
    NSYFooterViewStatusLoading,   //正在读取
    
};

typedef enum NSYFooterViewStatus NSYFooterViewStatus;

@protocol NSYFootViewDelegate <NSObject>

- (void)footerViewStatus:(NSYFootView *)footerView status:(NSYFooterViewStatus)status;

@end


@interface NSYFootView : UIView
@property(nonatomic,assign)NSYFooterViewStatus status;
@property(nonatomic,assign)id<NSYFootViewDelegate> delegate;

+ (id)footerView;

- (void)stopAnimation;

- (void)setTitle:(NSString *)title forState:(NSYFooterViewStatus)status;

@end
