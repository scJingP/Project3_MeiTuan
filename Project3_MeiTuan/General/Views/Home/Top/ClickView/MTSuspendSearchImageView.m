//
//  MTSuspendSearchImageView.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTSuspendSearchImageView.h"
#import "MTSuspendSearchImageButton.h"
#import <Masonry.h>
#import <objc/runtime.h>
@interface MTSuspendSearchImageView ()
@property(strong, nonatomic)NSMutableArray *muButtonArray;
@end

@implementation MTSuspendSearchImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToView];
    }
    return self;
}
-(void)addToView{
    self.backgroundColor = [UIColor colorWithR:100 g:100 b:100 alpha:1];
    self.width = 81;
    self.height = 100;
    
    for (int i = 0; i < 2; i++) {
        MTSuspendSearchImageButton *button = [[MTSuspendSearchImageButton alloc]init];
        CGRect framee = CGRectMake(0, 0, 100, 40);
        int yy;
        if (yy == 1) {
            yy = 41;
            button.functionLabel.text = @"付款码";
        }
        framee.origin.y = yy;
        button.tag = 200 + i;
        button.frame = framee;
        [self addSubview:button];
    }
}
-(void)autoLayer{
    
}
-(void)buttonClick:(MTSuspendSearchImageButton*)sender{
    NSLog(@"%@ %ld", sender.functionLabel.text, sender.tag);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.selected = !sender.selected;
    });
    
    
}

@end
