//
//  MTTouchesBeginView.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/14.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTTouchesBeginView.h"

@implementation MTTouchesBeginView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToView];
    }
    return self;
}
-(void)addToView{
    UIView *translucentView = [[UIView alloc]initWithFrame:CGRectMake(30, 120, 260, 300)];
    translucentView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
//    [kAppDelegate.window addSubview:translucentView];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"1234567");
}

@end
 