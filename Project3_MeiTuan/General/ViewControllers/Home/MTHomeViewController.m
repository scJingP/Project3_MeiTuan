//
//  MTHomeViewController.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//


#import "MTHomeViewController.h"
#import "MTHomeTableCustomCell.h"
#import "MTHomeView.h"
#import <Masonry.h>

static NSString *identify = @"MTHomeTableCustomCell";

@interface MTHomeViewController()
<UITableViewDataSource, UITableViewDelegate>

///主页大量数据的 tableView
@property(strong, nonatomic)UITableView *mainTableView;
@property(strong, nonatomic)MTHomeView *headHomeView;
@end

@implementation MTHomeViewController

-(void)viewDidLoad{
    [self.mainTableView registerClass:[MTHomeTableCustomCell class] forCellReuseIdentifier:identify];
    
    [self.view addSubview:self.headHomeView];
    [self.view addSubview:self.mainTableView];
    
    [self autoLayer];
}
#pragma mark - 首页 自动布局
-(void)autoLayer{
    [self.headHomeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.trailing.mas_equalTo(self.view);
        make.width.mas_equalTo(320);
        make.height.mas_equalTo(160);
    }];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(161);
        make.leading.trailing.bottom.mas_equalTo(self.view);
    }];
}


#pragma mark - ///主页大量数据的 tableView 的设置
///主页大量数据的 tableView 的 row数目
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}
///主页大量数据的 tableView 的 row 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 101;
}
///主页大量数据的 tableView 的 cell 数据添加
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MTHomeTableCustomCell *cell  = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if(cell){
        ;
    }
    
    
    return cell;
}
///.cell 点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld %ld", indexPath.section, indexPath.row);
}
#pragma mark get
-(MTHomeView *)headHomeView{
    if (!_headHomeView) {
        _headHomeView = [[MTHomeView alloc]initWithFrame:CGRectMake(0, 0, 320, 160)];
        _headHomeView.height = 160;
        _headHomeView.width = 320;
    }
    return _headHomeView;
}
///主页大量数据的 tableView get
-(UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]init];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}

@end
