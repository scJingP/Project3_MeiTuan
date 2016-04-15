//
//  MTLocationCollectionCellCollectionViewCell.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/13.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTLocationCollectionCellCollectionViewCell.h"

@implementation MTLocationCollectionCellCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self addToCell];
    return self;
}

-(void)addToCell{
    [self addSubview:self.button];
//    self.button.frame = CGRectMake(0, 0, 70, 40);//边框   需要
}
-(MTTextButton *)button{
    if (!_button) {
        _button = [[MTTextButton alloc]init];
        _button.layer.borderColor = [UIColor orangeColor].CGColor;
        _button.layer.borderWidth = 1;
    }
    return _button;
}
@end
