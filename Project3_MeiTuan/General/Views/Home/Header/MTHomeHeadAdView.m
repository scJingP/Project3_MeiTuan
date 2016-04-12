//
//  MTHomeHeadAdView.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTHomeHeadAdView.h"
#import "MTCustomADButton.h"
#import <Masonry.h>

@interface MTHomeHeadAdView()

@property(strong, nonatomic)NSMutableArray *muButtonArray;

@end

@implementation MTHomeHeadAdView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        [self addToView];
    }
    return self;
}

-(void)addToView{
    NSArray *adMaxArray = @[
                         @"全场满减",
                         @"新人福利会",
                         @"新用户专享",
                         @"一元抢吧"
                         ];
    NSArray *adMinArray = @[
                            @"K歌最高减20",
                            @"购物专享减",
                            @"最高立减25元",
                            @"爆品抢到时手软"
                            ];

    for (int i = 0; i < 4;  i ++) {
        MTCustomADButton *button = [[MTCustomADButton alloc]init];
        button.height = 64;
        button.width = 160;
        button.tag = 150 + i;
        button.maxLabel.text = adMaxArray[i];
        button.minLabel.text = adMinArray[i];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
//        button.layer.borderColor = [UIColor colorWithR:200 g:200 b:200 alpha:1].CGColor;
//        button.layer.borderWidth = 1;

        CGRect framee = CGRectMake(0, 0, 159.6, 63.6);
        CGFloat xx = i % 2 * 159.6;
        if (i == 1 || i == 3) {
            xx = 160.4;
        }
        CGFloat yy = i / 2 * 63.6;
        if (i == 2 || i == 3) {
            yy = 64.4;
        }
        framee.origin.x = xx;
        framee.origin.y = yy;
        button.frame = framee;

        [self addSubview:button];
        [self.muButtonArray addObject:button];
    }
}
-(void)autoLayer{
    
}

-(void)buttonClick:(MTCustomADButton*)sender{
    NSLog(@"%@", sender.maxLabel);
}
-(NSMutableArray *)muButtonArray{
    if (!_muButtonArray) {
        _muButtonArray = [NSMutableArray array];
    }
    return _muButtonArray;
}
@end
