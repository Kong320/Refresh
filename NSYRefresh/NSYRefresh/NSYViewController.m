//
//  NSYViewController.m
//  NSYRefresh
//
//  Created by qianfeng on 15/9/26.
//  Copyright © 2015年 聂嗣洋. All rights reserved.
//

#import "NSYViewController.h"
#import "NSYSubject.h"
#import "NSYContentView.h"

@interface NSYViewController ()

@property (nonatomic,copy) NSArray *plist;
@property (nonatomic,copy) NSArray *subjectArray;

@end

@implementation NSYViewController

-(NSArray *)plist
{
    if (_plist == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"quanquan.plist" ofType:nil];
        NSArray *temp = [NSArray arrayWithContentsOfFile:path];
        _plist = temp;
    }
    return _plist;
}

-(NSArray *)subjectArray
{
    if (_subjectArray == nil) {
        NSArray *dicts = self.plist[1];
        NSMutableArray *objs = [NSMutableArray array];
        for (NSDictionary *dict in dicts) {
            NSYSubject *subject = [NSYSubject subjectWithDict:dict];
            [objs addObject:subject];
        }
        _subjectArray = objs;
    }
    return _subjectArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSYContentView *contentView = [NSYContentView contentView];
    [self.view addSubview:contentView];
    contentView.subjectArray = self.subjectArray;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
