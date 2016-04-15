//
//  MTimageSearchLoginVC.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/14.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTimageSearchLoginVC.h"
#import <Masonry.h>
#import "MTLoginVC.h"
#import "MTimageFunctionButton.h"
@interface MTimageSearchLoginVC ()
@property(strong, nonatomic)UIView *separateView;
@property(strong, nonatomic)MTimageFunctionButton *scanButton;
@property(strong, nonatomic)MTimageFunctionButton *ownedButton;

@end








@implementation MTimageSearchLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addToView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addToView{
    //    self.backgroundColor = [UIColor colorWithR:10 g:10 b:10 alpha:1];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    
    [self.view addSubview:self.scanButton];
    [self.view addSubview:self.separateView];
    [self.view addSubview:self.ownedButton];
    [self autoLayer];
}

-(void)autoLayer{
    [self.scanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
        make.leading.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view);
    }];
    [self.separateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.leading.mas_equalTo(self.view.mas_leading).offset(5);
        make.trailing.mas_equalTo(self.view.mas_trailing).offset(-5);
        make.centerY.mas_equalTo(self.view.mas_centerY);
    }];
    [self.ownedButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
        make.leading.mas_equalTo(self.scanButton);
        make.top.mas_equalTo(self.scanButton.mas_bottom);
        
    }];
}

-(MTimageFunctionButton *)scanButton{
    if (!_scanButton) {
        _scanButton = [[MTimageFunctionButton alloc]init];
        _scanButton.functionLabel.text = @"扫一扫";
        
        [_scanButton addTarget:self action:@selector(scanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scanButton;
}
-(MTimageFunctionButton *)ownedButton{
    if (!_ownedButton) {
        _ownedButton = [[MTimageFunctionButton alloc]init];
        _ownedButton.functionLabel.text = @"付款码";
        
        [_ownedButton addTarget:self action:@selector(ownedButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ownedButton;
}

-(void)scanButtonClick:(MTimageFunctionButton*)sender{
    NSLog(@"%@, 我去 cccc ", sender.functionLabel.text);
}

-(void)ownedButtonClick:(MTimageFunctionButton*)sender{
    NSLog(@"%@, 我去 login ", sender.functionLabel.text);
    [[NSNotificationCenter defaultCenter]postNotificationName:@"logining" object:nil];
}
-(UIView *)separateView{
    if (!_separateView) {
        _separateView = [[UIView alloc]init];
        _separateView.backgroundColor = [UIColor colorWithR:180 g:180 b:180 alpha:1];
    }
    return _separateView;
}

@end
