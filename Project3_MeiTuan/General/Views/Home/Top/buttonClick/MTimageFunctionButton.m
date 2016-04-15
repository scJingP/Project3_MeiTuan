//
//  MTimageFunctionButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTimageFunctionButton.h"

@implementation MTimageFunctionButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToView];
    }
    return self;
}

-(void)addToView{
//    self.width = 100;
//    self.height = 50;
    [self addSubview:self.iconImage];
    [self addSubview:self.functionLabel];
    [self autoLayer];
}

-(void)autoLayer{
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(12);
        make.leading.mas_equalTo(self).offset(6);
        make.height.mas_equalTo(16);
        make.width.mas_equalTo(16);
    }];
    [self.functionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.iconImage.mas_trailing).offset(5);
        make.centerY.mas_equalTo(self.iconImage.mas_centerY);
    }];
}

-(UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_message_highlighted"]];
    }
    return _iconImage;
}
-(UILabel *)functionLabel{
    if (!_functionLabel) {
        _functionLabel = [[UILabel alloc]init];
        _functionLabel.font = [UIFont systemFontOfSize:16];
        _functionLabel.text = @"扫一扫";//付款码
        _functionLabel.textColor = [UIColor colorWithR:230 g:230 b:230 alpha:1];
        _functionLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _functionLabel;
}
@end
