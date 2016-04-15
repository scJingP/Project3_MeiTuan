//
//  MTTextButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/13.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTTextButton.h"
#import <Masonry.h>
@implementation MTTextButton

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
        [self addToButton];
    }
    return self;
}

-(void)addToButton{
    self.backgroundColor = [UIColor greenColor];
    self.addressNameLabel.frame = CGRectMake(0, 0, 70, 40);
    [self addSubview:self.addressNameLabel];
}
-(void)autoButton{
    [self.addressNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self);
    }];
}
-(UILabel *)addressNameLabel{
    if (!_addressNameLabel) {
        _addressNameLabel = [[UILabel alloc]init];
        _addressNameLabel.font = [UIFont systemFontOfSize:16];
        _addressNameLabel.textColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
        _addressNameLabel.text = @"火星";
        _addressNameLabel.textColor = [UIColor yellowColor];
        _addressNameLabel.adjustsFontSizeToFitWidth = YES;
        _addressNameLabel.textAlignment = UITextAlignmentCenter;
    }
    return _addressNameLabel;
}
@end
