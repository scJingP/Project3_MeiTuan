//
//  MTHomeTableHeadView.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTHomeTableHeadView.h"
#import "MTHomeHeadAdView.h"
#import "MTHomeHeadButtonView.h"
#import <Masonry.h>
@interface MTHomeTableHeadView()
///.20个button view
@property(strong, nonatomic)MTHomeHeadButtonView *headTwentyButtonHeadView;
///.4 个button view
@property(strong, nonatomic)MTHomeHeadAdView *headAdHeadView;

@end

@implementation MTHomeTableHeadView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToTableViewHeader];
    }
    return self;
}



#pragma mark - tableView header add to view
-(void)addToTableViewHeader{
//    self.backgroundColor = [UIColor blackColor];
    
    [self addSubview:self.headAdHeadView];
    [self addSubview:self.headTwentyButtonHeadView];

    [self autoHeader];
}
#pragma mark - tableView Header  自动布局
-(void)autoHeader{
    
    
    [self.headTwentyButtonHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(320);
        make.height.mas_equalTo(160);
        make.top.mas_equalTo(self);
        make.leading.mas_equalTo(self);
    }];
    [self.headAdHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(320);
        make.height.mas_equalTo(129);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-5);
        make.leading.mas_equalTo(self);
    }];
}

#pragma mark - get
-(MTHomeHeadButtonView *)headTwentyButtonHeadView{
    if (!_headTwentyButtonHeadView) {
        _headTwentyButtonHeadView = [[MTHomeHeadButtonView alloc]init];
    }
    return _headTwentyButtonHeadView;
}
-(MTHomeHeadAdView *)headAdHeadView{
    if (!_headAdHeadView) {
        _headAdHeadView = [[MTHomeHeadAdView alloc]init];
    }
    return _headAdHeadView;
}

@end
