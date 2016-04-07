//
//  UIImage+TNSGetUIImageHelper.m
//  PJNews
//
//  Created by tens03 on 16/1/30.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "UIImage+Addition.h"

@implementation UIImage (Addition)

+ (UIImage *)getHttpImageOfURL:(NSURL *)imgUrl
{
    NSData *imgData = [NSData dataWithContentsOfURL:imgUrl];
    return [UIImage imageWithData:imgData];
}

+ (UIImage *)getHttpImageOfStringPath:(NSString *)stringPath
{
    NSURL *url = [NSURL URLWithString:stringPath];
    NSData *imgData = [NSData dataWithContentsOfURL:url];
    return [UIImage imageWithData:imgData];
}

//将颜色转化为图片
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
