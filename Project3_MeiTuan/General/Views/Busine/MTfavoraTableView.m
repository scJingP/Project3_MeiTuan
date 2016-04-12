//
//  MTfavoraTableView.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTfavoraTableView.h"
#import "MTBusineCell.h"
#import "MTLocationCell.h"

static NSString *BusineCell = @"businecell";
static NSString *LocationCell = @"locationCell";
@implementation MTfavoraTableView

#pragma mark - init
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self registerClass:[MTBusineCell class] forHeaderFooterViewReuseIdentifier:BusineCell];
        [self registerClass:[MTLocationCell class] forHeaderFooterViewReuseIdentifier:LocationCell];
    }
    return self;
}


#pragma mark - UITableViewDataSource&&UITableViewDelegate
//返回多少队列
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//返回多少行Cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 10;
    }
}
//创建Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    MTLocationCell *locationcell;
    MTBusineCell *businecell;
    if (indexPath.section == 0) {
        locationcell = [tableView dequeueReusableCellWithIdentifier:LocationCell forIndexPath:indexPath];
        locationcell.backgroundColor = [UIColor redColor];
        locationcell.locationlabel.text = @"定位";
        return locationcell;
    }else{
        businecell = [tableView dequeueReusableCellWithIdentifier:BusineCell forIndexPath:indexPath];
        businecell.imageview.backgroundColor = [UIColor blackColor];
        businecell.starimageview.backgroundColor = [UIColor lightGrayColor];
        businecell.namelabel.text = [@(indexPath.row)stringValue];
        businecell.catenamelabel.text = [@(indexPath.row)stringValue];
        businecell.areanamelabel.text = [@(indexPath.row)stringValue];
        businecell.marknumber.text = [@(indexPath.row)stringValue];
        businecell.distancelabel.text= [@(indexPath.row)stringValue];
        return businecell;
    }
}
//Cell高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 40;
    }else{
        return 100;
    }
}
//点击Cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
