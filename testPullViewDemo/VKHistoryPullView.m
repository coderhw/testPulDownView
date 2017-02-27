//
//  VKHistoryPullView.m
//  ServiceEngineer
//
//  Created by Evan on 2017/2/27.
//  Copyright © 2017年 Vanke. All rights reserved.
//

#import "VKHistoryPullView.h"

#define kView_W(View) (View.frame.origin.x + View.bounds.size.width)
#define kView_H(View) (View.frame.origin.y + View.bounds.size.height)

#define kViewW(View) View.bounds.size.width
#define kViewH(View) View.bounds.size.height

#define kViewOriginY(View) View.frame.origin.y
#define kViewOriginX(View) View.frame.origin.x

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface VKHistoryPullView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray     *dataSources;
@property (nonatomic, strong) UITableView *listView;

@property (nonatomic, assign) CGFloat tableViewH;

@end

@implementation VKHistoryPullView

+ (instancetype)historyPullView {
    
    return [[[self class] alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-20, 300)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initTableView];
    }
    return self;
}

- (void)initTableView {
    [self addSubview:self.listView];
}

- (UITableView *)listView {
    
    if(!_listView) {
        _listView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,
                                                                  CGRectGetWidth(self.bounds),
                                                                  CGRectGetHeight(self.bounds))
                                                                  style:UITableViewStylePlain];
        _listView.dataSource = self;
        _listView.delegate = self;
        _listView.tableFooterView = [UIView new];
    }    
    return _listView;
}


#pragma mark - UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdetifier = @"cellIdetifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdetifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdetifier];
    }
    cell.textLabel.text = [_dataSources objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)showWithPoint:(CGRect)rect dataSources:(NSArray *)dataSource {
    _dataSources = dataSource;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 0.5;
    self.layer.cornerRadius = 3.0f;
    self.layer.masksToBounds = YES;

    _listView.frame = CGRectMake(0, 0,CGRectGetWidth(self.bounds),CGRectGetHeight(self.bounds));
    self.frame = CGRectMake(rect.origin.x, CGRectGetMaxY(rect), rect.size.width, 44*_dataSources.count);

    [_listView reloadData];
    [[[UIApplication sharedApplication].keyWindow.subviews objectAtIndex:0] addSubview:self];
}

@end
