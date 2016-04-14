//
//  UIView+GetLowerLeftCorner.m
//  01.16_注册登录
//
//  Created by tens03 on 16/1/16.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "UIView+Margin.h"

@implementation UIView (Margin)

/*
 CGRectGetHeight    返回label本身的高度
 CGRectGetMinY      返回label顶部的Y坐标
 CGRectGetMaxY      返回label底部的Y坐标
 CGRectGetMinX      返回label左边缘的X坐标
 CGRectGetMaxX      返回label右边缘的X坐标
 CGRectGetMidX      表示得到一个frame中心点的X坐标
 CGRectGetMidY      表示得到一个frame中心点的Y坐标
 */

// 获取、设置 宽度
- (float)width
{
    return self.frame.size.width;
}
- (void)setWidth:(float)width
{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

// 获取、设置 高度
- (float)height
{
    return self.frame.size.height;
}
- (void)setHeight:(float)height
{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

// 获取、设置 上边Y值
- (float)topY
{
    return CGRectGetMinY(self.frame);
}
- (void)setTopY:(float)topY
{
    CGRect rect = self.frame;
    rect.origin.y = topY;
    self.frame = rect;
}

// 获取、设置 下边Y值
- (float)bottomY
{
    return CGRectGetMaxY(self.frame);
}
- (void)setBottomY:(float)bottomY
{
    CGRect rect = self.frame;
    rect.origin.y = bottomY - rect.size.height;
    self.frame= rect;
}

// 获取、设置 左边X值
- (float)leftX
{
    return CGRectGetMinX(self.frame);
}
- (void)setLeftX:(float)leftX
{
    CGRect rect = self.frame;
    rect.origin.x = leftX;
    self.frame = rect;
}

// 获取、设置 右边X值
- (float)rightX
{
    return CGRectGetMaxX(self.frame);
}
- (void)setRightX:(float)rightX
{
    CGRect rect = self.frame;
    rect.origin.x = rightX - rect.size.width;
    self.frame = rect;
}

// 获取、设置 centerX -- 注意：获取centerX是当前视图中心点在当前视图坐标系中的坐标，设置centerX是当前视图中心点在父视图坐标系中的坐标
- (float)centerX
{
    return CGRectGetWidth(self.frame)/2.0;
}
- (void)setCenterX:(float)centerX
{
    CGRect rect = self.frame;
    rect.origin.x = centerX-rect.size.width/2.0;
    self.frame = rect;
}

// 获取、设置 centerY -- 注意：获取centerY是当前视图中心点在当前视图坐标系中的坐标，设置centerY是当前视图中心点在父视图坐标系中的坐标
- (float)centerY
{
    return CGRectGetHeight(self.frame)/2.0;
}
- (void)setCenterY:(float)centerY
{
    CGRect rect = self.frame;
    rect.origin.y = centerY-rect.size.height/2.0;
    self.frame = rect;
}




@end
