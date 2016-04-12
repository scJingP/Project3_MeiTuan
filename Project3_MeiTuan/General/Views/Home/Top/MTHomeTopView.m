//
//  MTTopView.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTHomeTopView.h"
#import "MTNameAndBottonImageButton.h"
#import "MTCircularButton.h"
#import "MTImageButton.h"
#import <Masonry.h>

#import "MTSuspendSearchImageView.h"
@interface MTHomeTopView()

@property(strong, nonatomic)MTNameAndBottonImageButton *locationButton;
@property(strong, nonatomic)MTCircularButton *searchTextButton;
@property(strong, nonatomic)MTImageButton *searchImageButton;
@property(strong, nonatomic)MTImageButton *loginButton;


@end

@implementation MTHomeTopView



- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addToView];
    }
    return self;
}

-(void)addToView{
    self.backgroundColor = [UIColor colorWithR:25 g:182 b:158 alpha:1];
    
    
    
    [self addSubview:self.searchTextButton];
    
    [self addSubview:self.searchImageButton];
    
    [self addSubview:self.loginButton];
    
    
    [self addSubview:self.locationButton];
    
    
    [self autoLayer];
}

-(void)autoLayer{
    [self.locationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).offset(5);
        make.top.mas_equalTo(self.searchTextButton).offset(5);
    }];
    [self.searchTextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(26);
        make.width.mas_equalTo(180);
        make.leading.mas_equalTo(self).offset(55);
        make.top.mas_equalTo(self).offset(28);
        
    }];
    [self.searchImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.searchTextButton.mas_trailing).offset(8);
        make.top.mas_equalTo(self.locationButton.mas_top);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.searchImageButton.mas_trailing).offset(8);
        make.top.mas_equalTo(self.locationButton.mas_top);
    }];
    
}

#pragma mark   - get

-(UIButton *)locationButton{
    if(!_locationButton){
        _locationButton = [[MTNameAndBottonImageButton alloc]init];
        [_locationButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _locationButton;
}
-(MTCircularButton *)searchTextButton {
    if (!_searchTextButton) {
        _searchTextButton = [[MTCircularButton alloc]init];
        _searchTextButton.layer.cornerRadius = 13;
        [_searchTextButton addTarget:self action:@selector(searchTextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchTextButton;
}

-(UIButton *)searchImageButton{
    if (!_searchImageButton) {
        _searchImageButton = [[MTImageButton alloc]init];
        [_searchImageButton addTarget:self action:@selector(searchImageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return     _searchImageButton;
}
-(UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton     = [[MTImageButton alloc]init];
        [_loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

#pragma mark - buttonClick
/**
 @property(strong, nonatomic)UIButton *locationButton;
 @property(strong, nonatomic)MTCircularButton *searchTextButton;
 @property(strong, nonatomic)UIButton *searchImageButton;
 @property(strong, nonatomic)UIButton *loginButton;
 */
-(void)locationButtonClick:(MTNameAndBottonImageButton*)sender{
    NSLog(@"locattion");
}
-(void)searchTextButtonClick:(MTCircularButton*)sender{
    NSLog(@"searchText");
}
-(void)searchImageButtonClick:(MTImageButton*)sender{
    NSLog(@"searchImage");
    [self suspendSearchImageButtonShow];
}
-(void)loginButtonClick:(MTImageButton*)sender{
    NSLog(@"loginButton");
}

//-(void)MTSuspendSearchImageButton
-(void)suspendSearchImageButtonShow{
    MTSuspendSearchImageView *suspendSearchImageView = [[MTSuspendSearchImageView alloc]init];
    suspendSearchImageView.frame = CGRectMake(220, 60, 100, 81);
    [self addSubview:suspendSearchImageView];
    [self exchangeSubviewAtIndex:2 withSubviewAtIndex:1];
}

@end
