//
//  MTHeadView.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTHeadView.h"
#import <Masonry.h>

@implementation MTHeadView

#pragma mark - init
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark -设置布局
-(void)setupAutoLayout{
    [self addSubview:self.leftbutton];
    [self addSubview:self.centerbutton];
    [self addSubview:self.rightbutton];
    
    NSArray *array = @[self.leftbutton,self.centerbutton,self.rightbutton];
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
    }];
}

#pragma mark - Custom
-(MTHeadButton *)leftbutton{
    if (_leftbutton == nil) {
        _leftbutton = [MTHeadButton buttonWithType:UIButtonTypeCustom];
    }
    return _leftbutton;
}
-(MTHeadButton *)centerbutton{
    if (_centerbutton == nil) {
        _centerbutton = [MTHeadButton buttonWithType:UIButtonTypeCustom];
    }
    return _centerbutton;
}
-(MTHeadButton *)rightbutton{
    if (_rightbutton == nil) {
        _rightbutton = [MTHeadButton buttonWithType:UIButtonTypeCustom];
    }
    return _rightbutton;
}

@end
