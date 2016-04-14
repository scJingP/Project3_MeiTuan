//
//  MTsortDetailTableview.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/13.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTsortDetailTableview.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface MTsortDetailTableview ()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation MTsortDetailTableview

#pragma mark - init
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return self;
}

#pragma mark - UITableViewDataSource&&UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.detailarray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = self.detailarray[indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithR:108 g:108 b:108 alpha:1];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (void)setDetailarray:(NSMutableArray *)detailarray
{
    _detailarray = detailarray;
    [self reloadData];
}



@end
