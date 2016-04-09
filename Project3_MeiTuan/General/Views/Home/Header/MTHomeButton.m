//
//  MTHomeButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/10.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTHomeButton.h"
#import <Masonry.h>
@implementation MTHomeButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addImageLabeltoView];
        
    }
    return self;
}

-(void)addImageLabeltoView{
    [self addSubview:self.iconImageView];
    [self addSubview:self.functionLabel];
    [self autoLayer];
}
#pragma mark - 自动布局
///.
-(void)autoLayer{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(40);
        make.top.leading.mas_equalTo(self).offset(5);
    }];
    [self.functionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.mas_bottom).offset(5);
    }];
}

#pragma mark - get
-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"about_praise"]];
    }
    return _iconImageView;
}

-(UILabel *)functionLabel{
    if (!_functionLabel) {
        _functionLabel   = [[UILabel alloc]init];
        _functionLabel.font = [UIFont systemFontOfSize:16];
        _functionLabel .text = @"美食";
        _functionLabel.textColor = [UIColor blackColor];
    }
    return _functionLabel;
}
@end