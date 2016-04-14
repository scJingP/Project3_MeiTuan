//
//  MTSweepViewController.h
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseViewController.h"

@interface MTSweepViewController : LWBaseViewController

@property (nonatomic, copy) void(^getZbarValue)(NSString *);

@end
