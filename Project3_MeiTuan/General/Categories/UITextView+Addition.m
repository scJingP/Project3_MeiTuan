//
//  UITextView+Addition.m
//  PJWeibo
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "UITextView+Addition.h"

@implementation UITextView (Addition)

- (void)insertEmotion:(LWEmotionModel *)model
{
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:model.png];
    attachment.bounds = CGRectMake(0, 0, self.font.lineHeight, self.font.lineHeight);
    attachment.chs = model.chs;
    NSAttributedString *imageAttributedString = [NSAttributedString attributedStringWithAttachment:attachment];
    
    NSMutableAttributedString *contentAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    int index = (int)self.selectedRange.location;
    [contentAttributedString replaceCharactersInRange:self.selectedRange withAttributedString:imageAttributedString];
    self.attributedText = contentAttributedString;
    
    NSRange range = NSMakeRange(index+1, 0);
    self.selectedRange = range;
}

@end
