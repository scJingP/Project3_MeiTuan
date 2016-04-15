//
//  MTCustomButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/10.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTCustomButton.h"
#import <Masonry.h>
@implementation MTCustomButton

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
    [self addSubview:self.iconImage];
    [self addSubview:self.functionLabel];
    [self autoLayer];
}

-(void)autoLayer{
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(8);
        make.leading.mas_equalTo(self).offset(13);
        make.height.mas_equalTo(38);
        make.width.mas_equalTo(38);
    }];
    [self.functionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(38);
        make.centerX.mas_equalTo(self.iconImage.mas_centerX);
        make.top.mas_equalTo(self.iconImage.mas_bottom).offset(5);
    }];
}

-(UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"about_praise"]];
    }
    return _iconImage;
}
-(UILabel *)functionLabel{
    if (!_functionLabel) {
        _functionLabel = [[UILabel alloc]init];
        _functionLabel.font = [UIFont systemFontOfSize:11];
        _functionLabel.text = @"美食";
        _functionLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _functionLabel;
}

@end
