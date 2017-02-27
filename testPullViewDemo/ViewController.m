//
//  ViewController.m
//  testPullViewDemo
//
//  Created by Evan on 2017/2/27.
//  Copyright © 2017年 vanke. All rights reserved.
//

#import "ViewController.h"
#import "VKHistoryPullView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)pullAction:(UIButton *)sender {

    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[sender convertRect:sender.bounds toView:window];
    
    VKHistoryPullView *historyPullView = [VKHistoryPullView historyPullView];
    NSArray *data =  @[@"我是历史搜索记录1", @"我是历史搜索记录1", @"我是历史搜索记录3", @"我是历史搜索记录4"];
    [historyPullView showWithPoint:rect dataSources:data];
                                    
}

@end
