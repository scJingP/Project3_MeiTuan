//
//  MTHeadView.h
//  Project3_MeiTuan
//
<<<<<<< HEAD
//  Created by guoqiang on 16/4/8.
=======
//  Created by guoqiang on 16/4/9.
>>>>>>> bdc9d4fe4e5d488f45c02046cc0f41cdacc9b30c
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
#import "MTHeadButton.h"

@interface MTHeadView : UIView

@property (strong, nonatomic) MTHeadButton *leftbutton;
@property (strong, nonatomic) MTHeadButton *centerbutton;
@property (strong, nonatomic) MTHeadButton *rightbutton;
=======
#import "MTHeadViewButton.h"

@interface MTHeadView : UIView

@property (strong, nonatomic) MTHeadViewButton *allbusinebutton;  //全部商家
@property (strong, nonatomic) MTHeadViewButton *favorablebusinebutton;  //优惠商家
@property (strong, nonatomic) MTHeadViewButton *allclassbutton; //全部分类
@property (strong, nonatomic) MTHeadViewButton *citybutton;  //全城
@property (strong, nonatomic) MTHeadViewButton *capacitysortbutton;  //排序
@property (strong ,nonatomic) MTHeadViewButton *locationbutton;  //定位
@property (strong, nonatomic) MTHeadViewButton *searchbutton;  //搜索
@property (strong, nonatomic) UIView *contanierview;  //容器
@property (strong, nonatomic) UITableView *sorttableview;  //分类表格
@property (strong, nonatomic) UIView *greenline;  //绿线
>>>>>>> bdc9d4fe4e5d488f45c02046cc0f41cdacc9b30c

@end
