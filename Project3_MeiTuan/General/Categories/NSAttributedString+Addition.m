//
//  NSAttributedString+CalcTextSize.m
//  PJWeibo
//
//  Created by tens03 on 16/3/28.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "NSAttributedString+Addition.h"

@implementation NSAttributedString (Addition)

- (CGFloat)calcTextHeightWithTotalSize:(CGSize)totalSize {
    
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGSize size = [self boundingRectWithSize:totalSize options:options context:nil].size;
    
    return ceil(size.height);
}

- (NSString *)convertEmotionString {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    
    NSMutableString *string = [NSMutableString string];
    
    [attributedString enumerateAttributesInRange:NSMakeRange(0, attributedString.length) options:0 usingBlock:^(NSDictionary<NSString *,id> *attrs, NSRange range, BOOL * stop) {
        
        if (attrs[@"NSAttachment"]) {
            NSTextAttachment *textAttachment = attrs[@"NSAttachment"];
            [string appendString:textAttachment.chs];
        } else {
            [string appendString:[self attributedSubstringFromRange:range].string];
        }
        
    }];
    
    return string;
}


@end
