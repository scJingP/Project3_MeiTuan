//
//  UIImage+TNSGetUIImageHelper.h
//  PJNews
//
//  Created by tens03 on 16/1/30.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addition)

+ (UIImage *)getHttpImageOfURL:(NSURL *)imgUrl;

+ (UIImage *)getHttpImageOfStringPath:(NSString *)stringPath;

+ (UIImage *)createImageWithColor:(UIColor *)color;
@end
