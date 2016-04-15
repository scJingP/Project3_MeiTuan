//
//  MTAdButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTAdButton.h"
#import <Masonry.h>

@implementation MTAdButton
    ///.width 155.5  height 63.5
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToButton];
    } 
    return self;
}
-(void)addToButton{

    [self addSubview:self.activeNameLabel];
    [self addSubview:self.activeDescribeLabel];
    [self addSubview:self.iconImage];
    
    [self autoButton];
}
-(void)autoButton{
    [self.activeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(12);
        make.leading.mas_equalTo(3);
    }];
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-12);
    }];
    [self.activeDescribeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.activeNameLabel.mas_bottom).offset(5);
        make.leading.mas_equalTo(self.activeNameLabel.mas_leading);
    }];
}

-(UILabel *)activeNameLabel{
    if (!_activeNameLabel) {
        _activeNameLabel = [[UILabel alloc]init];
        _activeNameLabel.text = @"下单立减";
        _activeNameLabel.font = [UIFont systemFontOfSize:16];
    }
    return _activeNameLabel;
}
-(UILabel *)activeDescribeLabel{
    if (!_activeDescribeLabel) {
        _activeDescribeLabel = [[UILabel alloc]init];
        _activeDescribeLabel.text = @"K歌9.9元起";
        _activeDescribeLabel.font = [UIFont systemFontOfSize:11];
        _activeDescribeLabel.textColor = [UIColor colorWithR:200 g:200 b:200 alpha:1];
    }
    return _activeDescribeLabel;
}
-(UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"about_praise"]];
    }
    return _iconImage;
}
@end
