//
//  MTNameAndBottonImageButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTNameAndBottonImageButton.h"
#import <Masonry.h>

@interface MTNameAndBottonImageButton()

@property(strong, nonatomic)UIImageView *iconImageView;
@property(strong, nonatomic)UILabel *functionLabel;
@end
@implementation MTNameAndBottonImageButton
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToView];
    }
    return self;
}

-(void)addToView{
//    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.functionLabel];
    [self autoLayer];
}

-(void)autoLayer{
    [self.functionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.leading.mas_equalTo(self);
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(12);
        make.height.mas_equalTo(7);
        make.top.mas_equalTo(self.functionLabel.mas_top).offset(5);
        make.leading.mas_equalTo(self.functionLabel.mas_trailing).offset(2);
    }];
}

-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_down"]];
        //        _iconImageView.height = 12;
        
    }
    return _iconImageView;
}

-(UILabel *)functionLabel{
    if (!_functionLabel) {
        _functionLabel = [[UILabel alloc]init];
        _functionLabel . text = @"成都";
        _functionLabel.font = [UIFont systemFontOfSize:13];
        _functionLabel.textColor = [UIColor colorWithR:240 g:240 b:240 alpha:1];
        _functionLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _functionLabel;
}
@end