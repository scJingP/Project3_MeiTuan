//
//  NSTextAttachment+Addition.m
//  PJWeibo
//
//  Created by tens03 on 16/4/7.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "NSTextAttachment+Addition.h"
#import <objc/runtime.h>

@implementation NSTextAttachment (Addition)

- (void)setChs:(NSString *)chs
{
    objc_setAssociatedObject(self, @selector(chs), chs, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)chs
{
    return objc_getAssociatedObject(self, @selector(chs));
}

@end
