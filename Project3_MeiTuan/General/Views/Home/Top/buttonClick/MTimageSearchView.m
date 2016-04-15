//
//  MTimageSearchView.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTimageSearchView.h"
#import <Masonry.h>
#import "MTLoginVC.h"
@interface MTimageSearchView()

@property(strong, nonatomic)UIView *separateView;

@end

@implementation MTimageSearchView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToView];
    }
    return self;
}

-(void)addToView{
//    self.backgroundColor = [UIColor colorWithR:10 g:10 b:10 alpha:1];
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];

    [self addSubview:self.scanButton];
    [self addSubview:self.separateView];
    [self addSubview:self.ownedButton];
    [self autoLayer];
}

-(void)autoLayer{
    [self.scanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
        make.leading.mas_equalTo(self);
        make.top.mas_equalTo(self);
    }];
    [self.separateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.leading.mas_equalTo(self.mas_leading).offset(5);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-5);
        make.centerY.mas_equalTo(self.mas_centerY);
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [super touchesBegan:touches withEvent:event];
    self.hidden = YES;
}

@end
