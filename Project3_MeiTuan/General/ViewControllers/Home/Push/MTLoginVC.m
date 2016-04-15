//
//  MTLoginVC.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/13.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTLoginVC.h"
static NSString *identify = @"MTLoginVC";
@interface MTLoginVC ()
<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;


@end

@implementation MTLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addToView];
}

-(void)addToView{
    UIBarButtonItem *buttonItemLeft = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStyleBordered target:self action:nil];
    self.navigationItem.leftBarButtonItem = buttonItemLeft;
    
    UIBarButtonItem *buttonItemRight = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStyleBordered target:self action:@selector(registButtonClick:)];
    self.navigationItem.rightBarButtonItem = buttonItemRight;
    
    self.userNameText.delegate = self;
    self.passwordText.delegate = self;
    [self.userNameText becomeFirstResponder];
}
#pragma mark - UITextfieldDelegate


#pragma mark private
-(void)registButtonClick:(UIBarButtonItem*)sender{
    NSLog(@"马上去注册");
}

- (IBAction)loginClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
