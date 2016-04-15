//
//  MTImageSearchButton.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/12.
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
    [self addSubview:self.iconImage];
    [self autoLayer];
}

-(void)autoLayer{
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(8);
        make.leading.mas_equalTo(self).offset(13);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(25);
    }];
}

-(UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_message_highlighted"]];
    }
    return _iconImage;
}
@end
