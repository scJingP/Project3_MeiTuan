//
//  LWBaseViewController.m
//  PJWeibo
//
//  Created by tens03 on 16/3/16.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseViewController.h"
#import <MBProgressHUD.h>
#import <objc/runtime.h>

@interface LWBaseViewController ()

@end

const char *hudKey;

@implementation LWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAlertViewWithText:(NSString *)text afterDelay:(NSTimeInterval)delay
{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hub.mode = MBProgressHUDModeText;
    hub.labelText = text;
    [hub hide:YES afterDelay:delay];
}

- (void)showLoding {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    // 属性的动态绑定
    objc_setAssociatedObject(self, hudKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hiddenLoding {
    MBProgressHUD *hud = objc_getAssociatedObject(self, hudKey);
    [hud hide:YES];
}

@end
