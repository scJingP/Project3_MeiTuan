//
//  UIColor+Addition.m
//  PJWeibo
//
//  Created by tens03 on 16/3/16.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "UIColor+Addition.h"

@implementation UIColor (Addition)

+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha
{
    return [self colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}

@end
