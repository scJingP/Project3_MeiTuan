//
//  MTHomeCollectionCell.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/10.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTHomeCollectionCell.h"

@implementation MTHomeCollectionCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addToView];
    }
    return self;
}
///.添加到父视图
-(void)addToView{
    [self addSubview: self.button];
    [self autoLayer];
}
///.自动布局
-(void)autoLayer{
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(75);
        make.width.mas_equalTo(64);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
    } ];
}
#pragma mark - get
-(MTHomeButton *)button{
    if (!_button) {
        _button = [[MTHomeButton alloc]initWithFrame:self.frame];
    }
    return _button;
}


@end
