//
//  VKHistoryPullView.h
//  ServiceEngineer
//
//  Created by Evan on 2017/2/27.
//  Copyright © 2017年 Vanke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VKHistoryPullView : UIView

+ (instancetype)historyPullView;

- (void)showWithPoint:(CGRect)rect dataSources:(NSArray *)dataSource;

@end
