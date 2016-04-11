//
//  MTHomeViewController.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//


#import "MTHomeViewController.h"
#import "MTHomeTableCustomCell.h"
#import "MTHomeHeadView.h"
#import <Masonry.h>

static NSString *identify = @"MTHomeTableCustomCell";

@interface MTHomeViewController()
<UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic)UIButton *locationButton;
@property(strong, nonatomic)UITextView *textView;
@property(strong, nonatomic)UILabel *placeHolder;
///主页大量数据的 tableView
@property(strong, nonatomic)UITableView *mainTableView;
@property(strong, nonatomic)MTHomeHeadView *headHomeheadView;

@end

@implementation MTHomeViewController

-(void)viewDidLoad{
    [self.mainTableView registerClass:[MTHomeTableCustomCell class] forCellReuseIdentifier:identify];
    
//    [self.view addSubview:self.headHomeheadView];
    
    [self.view addSubview:self.textView];
    self.textView.frame = CGRectMake(30, 5, 260, 15);
    
    [self.view addSubview:self.placeHolder];
    self.placeHolder.frame = CGRectMake(35, 5 + 3, 260, 12);
    
    [self.view addSubview:self.mainTableView];
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, 160)];
    self.mainTableView.tableHeaderView = headView ;
    [headView addSubview:self.headHomeheadView];
    
    [self autoLayer];
}
#pragma mark - 首页 自动布局
-(void)autoLayer{
//    [self.headHomeheadView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.trailing.mas_equalTo(self.view);
//        make.width.mas_equalTo(320);
//        make.height.mas_equalTo(160);
//    }];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(10);
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
        
    }
    
    return cell;
}
///tableView header
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//UIView *head = self.headHomeheadView;
//    head.frame = CGRectMake(0, 10, 320, 160);
    
    return self.headHomeheadView;
}
#pragma mark get
-(MTHomeHeadView *)headHomeheadView{
    if (!_headHomeheadView) {
        _headHomeheadView = [[MTHomeHeadView alloc]init];
//        _headHomeheadView.frame = CGRectMake(0, 0, 320, 160);
    }
    return _headHomeheadView;
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
-(UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc]init];
//        _textView.delegate = self;
    }
    return _textView;
}
-(UILabel *)placeHolder{
    if (!_placeHolder) {
        _placeHolder = [[UILabel alloc]init];
        _placeHolder . text = @"请输入商家、分类或商圈";
        _placeHolder.font = [UIFont systemFontOfSize:11];
        _placeHolder.textColor = [UIColor colorWithR:180 g:180 b:180 alpha:1];
    }
    return _placeHolder;
}
@end
