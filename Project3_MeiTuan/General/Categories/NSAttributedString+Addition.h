//
//  NSAttributedString+CalcTextSize.h
//  PJWeibo
//
//  Created by tens03 on 16/3/28.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Addition)

- (CGFloat)calcTextHeightWithTotalSize:(CGSize)totalSize;

- (NSString *)convertEmotionString;

@end
