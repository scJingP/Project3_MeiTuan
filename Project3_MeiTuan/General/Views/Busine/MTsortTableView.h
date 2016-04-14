//
//  MTsortTableView.h
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTsortDetailTableview.h"

@interface MTsortTableView : UITableView

//全部分类
@property (strong, nonatomic) NSArray *alldataarray;
@property (strong, nonatomic) NSArray *cityarray;
@property (strong, nonatomic) NSArray *bassarray;
@property (strong, nonatomic) NSArray *sortarray;



- (instancetype)initWithDetailTableView:(MTsortDetailTableview *)tableView;

@end
