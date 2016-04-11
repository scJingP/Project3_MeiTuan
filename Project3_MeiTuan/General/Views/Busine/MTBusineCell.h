//
//  MTBusineCell.h
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
#import "MTHeadView.h"

@interface MTBusineCell : UITableViewCell

@property (strong, nonatomic) UIImageView *imageview; //图片
@property (strong, nonatomic) UIImageView *starimage;  //星星
@property (strong, nonatomic) UILabel *namelabel;  //店名
@property (strong, nonatomic) UILabel *catenamelabel;  //类型
@property (strong, nonatomic) UILabel *areanamelabel;  //地址
@property (strong, nonatomic) UILabel *marknumber;  //评价数量
@property (strong, nonatomic) UILabel *distancelabel;  //距离
@property (strong, nonatomic) MTHeadView *headview;
=======

@interface MTBusineCell : UITableViewCell

@property (strong, nonatomic) UIImageView *imageview;  //图片
@property (strong, nonatomic) UIImageView *starimageview;  //星星
@property (strong, nonatomic) UILabel *namelabel;  //店名
@property (strong, nonatomic) UILabel *catenamelabel;  //类型
@property (strong, nonatomic) UILabel *areanamelabel;  //附近地址
@property (strong, nonatomic) UILabel *marknumber;  //评价
@property (strong, nonatomic) UILabel *distancelabel;  //距离
>>>>>>> bdc9d4fe4e5d488f45c02046cc0f41cdacc9b30c

//加载视图
-(void)initView;

//自动布局
-(void)setupAutoLayout;

//设置数据
-(void)setInformation;

@end
