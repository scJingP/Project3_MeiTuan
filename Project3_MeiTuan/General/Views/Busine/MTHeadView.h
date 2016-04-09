//
//  MTHeadView.h
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/9.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTHeadViewButton.h"

@interface MTHeadView : UIView

@property (strong, nonatomic) MTHeadViewButton *allbusinebutton;  //全部商家
@property (strong, nonatomic) MTHeadViewButton *favorablebusinebutton;  //优惠商家
@property (strong, nonatomic) MTHeadViewButton *allclassbutton; //全部分类
@property (strong, nonatomic) MTHeadViewButton *citybutton;  //全城
@property (strong, nonatomic) MTHeadViewButton *capacitysortbutton;  //排序
@property (strong ,nonatomic) MTHeadViewButton *locationbutton;  //定位
@property (strong, nonatomic) MTHeadViewButton *searchbutton;  //搜索
@property (strong, nonatomic) UIView *greenline;  //绿线

@end
