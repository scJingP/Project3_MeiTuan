//
//  UITextView+Addition.h
//  PJWeibo
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LWEmotionModel.h"

@interface UITextView (Addition)

- (void)insertEmotion:(LWEmotionModel *)model;

@end
