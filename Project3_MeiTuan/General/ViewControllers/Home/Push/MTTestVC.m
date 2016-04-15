//
//  MTTestVC.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/15.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTTestVC.h"
#import "MTHomeHeadView.h"
@implementation MTTestVC


-(void)viewDidLoad{
    [super viewDidLoad];
    
    MTHomeHeadView *homeHeadView = [[MTHomeHeadView alloc]init];
    homeHeadView.frame = CGRectMake(0, 80, 320, 150);
    [self.view addSubview:homeHeadView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

}

@end
