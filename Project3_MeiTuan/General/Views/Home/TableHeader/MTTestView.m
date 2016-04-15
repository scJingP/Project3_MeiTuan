//
//  MTTestView.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTTestView.h"

@implementation MTTestView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToView];
    }
    return self;
}
-(void)addToView{
            self.backgroundColor = [UIColor colorWithR:0 g:255 b:0 alpha:1];
//    self.frame = CGRectMake(0, 0, 320, 160);
    self.width = 320;
    self.height  = 160;
}
@end
