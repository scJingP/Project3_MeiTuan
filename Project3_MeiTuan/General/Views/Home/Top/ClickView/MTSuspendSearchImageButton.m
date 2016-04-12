//
//  MTSuspendSearchImageButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTSuspendSearchImageButton.h"
#import <Masonry.h>

@interface MTSuspendSearchImageButton()

///.height 40  width 100
@end

@implementation MTSuspendSearchImageButton


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToView];
    }
    return self;
}

-(void)addToView{
    self.backgroundColor = [UIColor colorWithR:10 g:10 b:10 alpha:1];
    
    [self addSubview:self.iconImage];
    [self addSubview:self.functionLabel];
    [self autoLayer];
}

-(void)autoLayer{
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {

        make.height.mas_equalTo(10);
        make.width.mas_equalTo(10);
        make.top.mas_equalTo(self).offset(10);
        make.leading.mas_equalTo(self).offset(10);

    }];
    [self.functionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.iconImage.mas_centerX).offset(3);
        make.centerY.mas_equalTo(self.iconImage.mas_centerY);
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
        _functionLabel.text = @"扫一扫";
        _functionLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _functionLabel;
}



@end
