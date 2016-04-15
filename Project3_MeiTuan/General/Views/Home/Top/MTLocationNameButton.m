//
//  MTLocationNameButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTLocationNameButton.h"
#import <Masonry.h>

@interface MTLocationNameButton()

@end

@implementation MTLocationNameButton
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToButton];
    }
    return self;
}
-(void)addToButton{
//    self.width = 20;
//    self.height = 30;

    [self addSubview:self.iconImage];
    [self addSubview:self.functionLabel];
    [self autoButton];
}
-(void)autoButton{
    [self.functionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.leading.mas_equalTo(self).offset(0);
    }];
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(11);
        make.height.mas_equalTo(7);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.leading.mas_equalTo(self.functionLabel.mas_trailing).offset(5);
    }];
}

-(UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.image  = [UIImage imageNamed:@"icon_unfold"];
    }
    return _iconImage;
}
-(UILabel *)functionLabel{
    if (!_functionLabel ) {
        _functionLabel = [[UILabel alloc]init];
        _functionLabel.text = @"输入商家分类或商圏";
        _functionLabel.textColor = [UIColor colorWithR:80 g:80 b:80 alpha:1];
        _functionLabel.font = [UIFont systemFontOfSize:14];
    }
    return     _functionLabel;
}
@end
