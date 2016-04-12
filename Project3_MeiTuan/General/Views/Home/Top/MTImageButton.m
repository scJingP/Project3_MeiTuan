//
//  MTImageButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTImageButton.h"
#import <Masonry.h>
@interface MTImageButton()



@end
@implementation MTImageButton
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToView];
    }
    return self;
}

-(void)addToView{
    
    [self addSubview:self.iconImageView];
    [self autoLayer];
}

-(void)autoLayer{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(15);
        make.height.mas_equalTo(15);
        make.top.mas_equalTo(self);
        make.leading.mas_equalTo(self);
    }];
}

-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_search_glass"]];
    }
    return _iconImageView;
}


@end
