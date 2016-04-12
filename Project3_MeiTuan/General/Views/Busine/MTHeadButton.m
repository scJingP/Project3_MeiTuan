//
//  MTHeadButton.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTHeadButton.h"
#import <Masonry.h>

@implementation MTHeadButton

#pragma mark - init
-(void)awakeFromNib{
    [self addSubview:self.textlabel];
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self addSubview:self.textlabel];
    }
    return self;
}

#pragma mark - 自动布局
-(void)updateConstraints{
    [self.textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
    }];
    [super updateConstraints];
}

#pragma mark - Custom
-(UILabel *)textlabel{
    if (_textlabel == nil) {
        _textlabel = [[ UILabel alloc] init];
        _textlabel.font = [UIFont systemFontOfSize:14];
        _textlabel.textColor = [UIColor colorWithR:133 g:133 b:133 alpha:1];
    }
    return _textlabel;
}

@end
