//
//  LWAppMacro.h
//  PJWeibo
//
//  Created by tens03 on 16/3/18.
//  Copyright © 2016年 tens03. All rights reserved.
//

#ifndef LWAppMacro_h
#define LWAppMacro_h

// 屏幕宽高
#define kScreenWidth        CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHeight       CGRectGetHeight([UIScreen mainScreen].bounds)

#define kDocumentPath       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#define kAppKey             @"3584873925"
#define kAppRedirectURL     @"https://api.weibo.com/oauth2/default.html"

#define kAppDelegate        ((AppDelegate *)[UIApplication sharedApplication].delegate)


#endif /* LWAppMacro_h */
