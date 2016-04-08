//
//  MTBusineCell.h
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTBusineCell : UITableViewCell

@property (strong, nonatomic) UIImageView *imageview;
@property (strong, nonatomic) UILabel *namelabel;
@property (strong, nonatomic) UILabel *catenamelabel;
@property (strong, nonatomic) UILabel *areanamelabel;
@property (strong, nonatomic) UILabel *marknumber;
@property (strong, nonatomic) UILabel *distancelabel;

//加载视图
-(void)initView;

//自动布局
-(void)setupAutoLayout;

//设置数据
-(void)setInformation;

@end
