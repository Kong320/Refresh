//
//  NSYHeadView.h
//  NSYRefresh
//
//  Created by qianfeng on 15/9/26.
//  Copyright © 2015年 聂嗣洋. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NSYHeadView;
enum NSYHeaderViewStatus
{
    NSYHeaderViewStatusBeginDrag, //拖拽读取更多
    NSYHeaderViewStatusDragging,  //松开读取更多
    NSYHeaderViewStatusLoading,   //正在读取
    
};

typedef enum NSYHeaderViewStatus NSYHeaderViewStatus;

@protocol NSYHeadViewDelegate <NSObject>

- (void)HeaderViewStatus:(NSYHeadView *)HeaderView status:(NSYHeaderViewStatus)status;

@end


@interface NSYHeadView : UIView
@property(nonatomic,assign)NSYHeaderViewStatus status;
@property(nonatomic,assign)id<NSYHeadViewDelegate> delegate;



+ (id)headerView;

- (void)stopAnimation;

- (void)setTitle:(NSString *)title forState:(NSYHeaderViewStatus)status;
@end
