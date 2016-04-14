//
//  MTHeadViewButton.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/9.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTHeadViewButton.h"
#import <Masonry.h>

@implementation MTHeadViewButton

#pragma mark - init
-(void)awakeFromNib{
    [self addSubview:self.imageview];
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self addSubview:self.imageview];
    }
    return self;
}

#pragma mark - Custom
-(UIImageView *)imageview{
    if (_imageview == nil) {
        _imageview = [[UIImageView alloc] init];
        _imageview.layer.masksToBounds= YES;
    }
    return _imageview;
}

@end
