//
//  LWIconButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWIconButton.h"
#import <Masonry.h>

@interface LWIconButton ()

@end

@implementation LWIconButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubview];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubview];
    }
    return self;
}

- (UILabel *)lblTitle
{
    if (_lblTitle == nil) {
        _lblTitle = [[UILabel alloc] init];
        _lblTitle.font = [UIFont systemFontOfSize:12];
        _lblTitle.tintColor = [UIColor blackColor];
    }
    return _lblTitle;
}

- (UIImageView *)ivIcon
{
    if (_ivIcon == nil) {
        _ivIcon = [[UIImageView alloc] init];
//        _ivIcon.backgroundColor = [UIColor redColor];
    }
    return _ivIcon;
}

#pragma mark - private
- (void)initSubview
{
    [self addSubview:self.ivIcon];
    [self addSubview:self.lblTitle];
    
    [self.ivIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-10);
        make.width.mas_equalTo(self.width/3);
        make.height.mas_equalTo(self.height/3);
    }];
    
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.ivIcon.mas_bottom).offset(5);
    }];
}

@end
