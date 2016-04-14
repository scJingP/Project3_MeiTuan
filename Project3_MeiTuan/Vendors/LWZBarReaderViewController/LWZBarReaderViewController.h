//
//  LWZBarReaderViewController.h
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/13.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@protocol LWZBarReaderViewControllerDelegate <NSObject>

- (void)LWZBarReaderView:(ZBarReaderView *)readerView cancleOnClick:(UIButton *)sender;

@end

@interface LWZBarReaderViewController : UIViewController

@property (nonatomic, weak) id<LWZBarReaderViewControllerDelegate> delegate;

@end
