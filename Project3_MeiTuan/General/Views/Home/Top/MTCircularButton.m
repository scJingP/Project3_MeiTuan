//
//  MTCircularButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTCircularButton.h"
#import <Masonry.h>
@interface MTCircularButton()

@property(strong, nonatomic)UIImageView *iconImageView;
@property(strong, nonatomic)UILabel *functionLabel;
@end

@implementation MTCircularButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
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
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.functionLabel];
    [self autoLayer];
}

-(void)autoLayer{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(15);
        make.height.mas_equalTo(15);
        make.centerY.mas_equalTo(self).offset(1);
        make.leading.mas_equalTo(self.mas_leading).offset(4);
    }];
    
    [self.functionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self).offset(1);
        make.leading.mas_equalTo(self.iconImageView.mas_trailing).offset(3);
    }];
}

-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_search_glass"]];
//        _iconImageView.height = 12;

    }
    return _iconImageView;
}

-(UILabel *)functionLabel{
    if (!_functionLabel) {
        _functionLabel = [[UILabel alloc]init];
        _functionLabel . text = @"输入商家、分类或商圈";
        _functionLabel.font = [UIFont systemFontOfSize:11];
        _functionLabel.textColor = [UIColor colorWithR:83 g:83 b:83 alpha:1];
        _functionLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _functionLabel;
}
@end
