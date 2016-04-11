//
//  LWBaseViewController.h
//  PJWeibo
//
//  Created by tens03 on 16/3/16.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWBaseViewController : UIViewController

- (void)showAlertViewWithText:(NSString *)text afterDelay:(NSTimeInterval)delay;

- (void)showLoding;

- (void)hiddenLoding;

@end
