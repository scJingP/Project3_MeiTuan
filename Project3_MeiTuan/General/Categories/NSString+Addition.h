//
//  NSString+CalcTextSize.h
//  PJWeibo
//
//  Created by tens03 on 16/3/22.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)

/**
 *  计算文本高度
 *
 *  @param font      计算的基准字体
 *  @param totalSize 文本的总大小
 *
 *  @return 文本的高度
 */
- (CGFloat)calcTextHeightWithFont:(UIFont *)font withTotalSize:(CGSize)totalSize;
@end

@interface NSString (regularString)

- (NSString *)stringRegularWithRegularExpression:(NSString *)pattern;

@end
