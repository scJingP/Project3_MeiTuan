//
//  MTTextSearchButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTTextSearchButton.h"
#import <Masonry.h>

@interface MTTextSearchButton()

@property(strong, nonatomic)UIImageView *iconImage;
@property(strong, nonatomic)UILabel *functionLabel;

@end

@implementation MTTextSearchButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToButton];
    }
    return self;
}
-(void)addToButton{
    self.width = 160;
    self.height = 30;
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.iconImage];
    [self addSubview:self.functionLabel];
    [self autoButton];
}
-(void)autoButton{
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(16);
        make.height.mas_equalTo(16);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.leading.mas_equalTo(self).offset(5);
    }];
    [self.functionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.leading.mas_equalTo(self.iconImage.mas_trailing).offset(3);
    }];
}

-(UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.image  = [UIImage imageNamed:@"icon_search_empty"];
    }
    return _iconImage;
}
-(UILabel *)functionLabel{
    if (!_functionLabel ) {
        _functionLabel = [[UILabel alloc]init];
        _functionLabel.text = @"输入商家分类或商圏";
        _functionLabel.textColor = [UIColor colorWithR:80 g:80 b:80 alpha:1];
        _functionLabel.font = [UIFont systemFontOfSize:12];
    }
    return     _functionLabel;
}
@end
