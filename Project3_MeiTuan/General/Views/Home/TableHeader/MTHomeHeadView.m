//
//  MTHomeHeadView.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/10.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTHomeHeadView.h"
#import "MTCustomButton.h"

@interface MTHomeHeadView()
<UIScrollViewDelegate>
@property (strong, nonatomic)NSMutableArray *muImageArray;
@property (strong, nonatomic)NSMutableArray *muFuncationArray;

@property (strong, nonatomic)UIView *viewCurrent;
@property (strong, nonatomic)UIView *viewRight;

@property (strong, nonatomic)UIScrollView *scrollView;
@property (strong, nonatomic)NSMutableArray *muButtonArray;

@property (strong, nonatomic)UIPageControl *pageControl;
@end
@implementation MTHomeHeadView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToView];
    }
    
    return self;
}

-(void)addToView{
//    self.backgroundColor = [UIColor yellowColor];
    self.frame = CGRectMake(0, 0, 320, 160);
    
    [self addSubview:self.scrollView];
    self.scrollView.frame = CGRectMake(0, 0, 320, 160);
    
    [self.scrollView addSubview:self.viewCurrent];
    self.viewCurrent.frame = CGRectMake(0, 0, 641, 160);
    
    [self addSubview:self.pageControl];
    self.pageControl.frame = CGRectMake(100, 150, 120, 10);
    
    //    [self.scrollView addSubview:self.viewRight];
    //    self.viewRight.frame = CGRectMake(320, 0, 320, 160);
}



-(NSMutableArray *)muImageArray{
    if (!_muImageArray) {
        _muImageArray = [NSMutableArray array];
        
    }
    return _muImageArray;
}
-(NSMutableArray *)muFuncationArray{
    if (!_muFuncationArray) {
        NSArray *array = @[@"美食", @"电影", @"酒店", @"休闲娱乐", @"外卖",

                           @"足疗按摩", @"美发", @"购物", @"火锅", @"甜点饮品",
                           @"自助餐", @"KTV", @"火车票机票", @"周边游", @"丽人",                           @"小吃快餐", @"美甲", @"生活服务", @"旅游", @"全部分类"
                           ];
        _muFuncationArray    = [NSMutableArray arrayWithArray:array];
    }
    return _muFuncationArray;
}

-(UIView *)viewCurrent{
    if (!_viewCurrent) {
        _viewCurrent = [[UIView alloc]init];
        for (int i = 0; i < 20; i++) {
            MTCustomButton *button = [[MTCustomButton alloc]init];
            button.functionLabel.text = self.muFuncationArray[i];
            [_viewCurrent addSubview:button];
            CGRect framm = CGRectMake(0, 0, 64, 80);
            CGFloat            x = i % 10 * 64;
            CGFloat            y = i / 10 * 80;
            framm.origin.x = x;
            framm.origin.y = y;
            button.frame = framm;
            button.tag = 100 + i;
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.muButtonArray addObject:button];
        }
    }
    return _viewCurrent;
}

-(UIView *)viewRight{
    if (!_viewRight) {
        _viewRight = [[UIView alloc]init];
        for (int i = 0; i < 10; i++) {
            MTCustomButton *button = [[MTCustomButton alloc]init];
            button.functionLabel.text = self.muFuncationArray[i];
            [_viewRight addSubview:button];
            CGRect framm = CGRectMake(10, 20, 64, 60);
            CGFloat x = i % 5 * 64;
            CGFloat y = i / 5 * 80;
            framm.origin.x = x;
            framm.origin.y = y;
            button.frame = framm;
            button.tag = 200 + i;
            [self.muButtonArray addObject:button];
        }
    }
    return _viewRight;
}

-(void)buttonClick:(MTCustomButton*)sender{

}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.scrollView.contentOffset.x == 320) {
            self.pageControl.currentPage = 1;
    }else{
        self.pageControl.currentPage = 0;
    }

}
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.contentSize = CGSizeMake(641, 160);
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

-(NSMutableArray *)muButtonArray{
    if (!_muButtonArray) {
        _muButtonArray = [NSMutableArray array];
    }
    return _muButtonArray;
}

-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = 2;
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.pageIndicatorTintColor = [UIColor blueColor];
    }
    return _pageControl;
}
@end
