//
//  MTCustomADButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTCustomADButton.h"
#import <Masonry.h>
@interface MTCustomADButton()
///.width  160  height 64
@end

@implementation MTCustomADButton


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToView];
    }
    return self;
}
-(void)addToView{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.maxLabel];
    [self addSubview:self.minLabel];
    [self addSubview:self.iconImageView];
    [self autoLayer];
}
-(void)autoLayer{
    [self.maxLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).offset(9);
        make.top.mas_equalTo(self).offset(16);
    }];
    [self.minLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).offset(9);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-12);
    }];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(46);
        make.height.mas_equalTo(46);
        make.top.mas_equalTo(self).offset(9);
        make.trailing.mas_equalTo(self).offset(-9);
    }];
}

#pragma mark - get
-(UILabel *)maxLabel{
    if (!_maxLabel) {
        _maxLabel = [[UILabel alloc]init];
        _maxLabel.text = @"全场满减";
        _maxLabel.textColor = [UIColor orangeColor];
        _maxLabel.font = [UIFont systemFontOfSize:16];
        _maxLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _maxLabel;
}
-(UILabel *)minLabel{
    if (!_minLabel) {
        _minLabel = [[UILabel alloc]init];
        _minLabel.text = @"K歌最高减20";
        _minLabel.textColor = [UIColor colorWithR:80 g:80 b:80 alpha:1];
        _minLabel.font = [UIFont systemFontOfSize:12];
        _maxLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _minLabel;
}
-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"about_praise"]];
    }
    return _iconImageView;
}


@end
