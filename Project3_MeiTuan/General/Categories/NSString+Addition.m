//
//  NSString+CalcTextSize.m
//  PJWeibo
//
//  Created by tens03 on 16/3/22.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "NSString+Addition.h"

@implementation NSString (Addition)

- (CGFloat)calcTextHeightWithFont:(UIFont *)font withTotalSize:(CGSize)totalSize {
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin;
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    
    NSDictionary *attributes = @{ NSFontAttributeName :font, NSParagraphStyleAttributeName :style};
    
    CGSize size = [self boundingRectWithSize:totalSize
                                     options:opts
                                  attributes:attributes
                                     context:nil].size;
    
    return ceil(size.height);
}

@end

@implementation NSString (regularString)

- (NSString *)stringRegularWithRegularExpression:(NSString *)pattern
{
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSRange range = [regular rangeOfFirstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    if (range.location != NSNotFound) {
        range.location += 1;
        range.length -= 2;
        return [self substringWithRange:range];
    }
    return nil;
}

@end
