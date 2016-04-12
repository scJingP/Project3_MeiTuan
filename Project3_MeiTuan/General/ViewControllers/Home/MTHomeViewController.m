//
//  MTHomeViewController.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTHomeViewController.h"
#import "MTHomeTableCustomCell.h"
//#import "MTHomeHeadView.h"
#import "MTHomeTopView.h"
#import "MTHomeTableHeadView.h"
//#import "MTHomeHeadAdView.h"
#import <Masonry.h>

static NSString *identify = @"MTHomeTableCustomCell";

@interface MTHomeViewController()
<UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic)UIButton *locationButton;
@property(strong, nonatomic)UITextView *textView;
@property(strong, nonatomic)UILabel *placeHolder;
///主页大量数据的 tableView
@property(strong, nonatomic)UITableView *mainTableView;

///.顶上  搜索框
@property(strong, nonatomic)MTHomeTopView *topView;
@property(strong, nonatomic)MTHomeTableHeadView *headContentView;
@end

@implementation MTHomeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    ///.  tableView 的 cell
    [self.mainTableView registerClass:[MTHomeTableCustomCell class] forCellReuseIdentifier:identify];
    
    //    [self.view addSubview:self.textView];
    //    self.textView.width = 260;
    //    self.textView.height = 15;
    //    self.textView.frame = CGRectMake(50, 20, 210, 36);
    //
    //    [self.view addSubview:self.placeHolder];
    //    self.placeHolder.frame = CGRectMake(35, 5 + 3, 260, 12);
    
    
    [self addToView];
    
}

-(void)addToView{
    ///.添加 topView  似 textView 到  top
    [self.view addSubview:self.topView];
    ///.添加  tableView     到  self.view
    [self.view addSubview:self.mainTableView];
    ///.添加  head tableView
//    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, 320, 160)];

//    [self.headContentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(320);
//        make.height.mas_equalTo(295);
//        make.leading.mas_equalTo(self.mainTableView);
//        make.top.mas_equalTo(self.mainTableView);
//    }];
    self.headContentView.height = 300;
    
    
    
    self.mainTableView.tableHeaderView = self.headContentView ;
    

    
//    self.headTwentyButtonHeadView.height = 160;
//    
//    self.headAdHeadView.height = 125;
    
//    [headView addSubview:self.headTwentyButtonHeadView];
    ///.自动布局
    
    
    
    [self autoLayer];
}


#pragma mark - 首页 自动布局
-(void)autoLayer{
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.height.mas_equalTo(65);
        make.leading.trailing.mas_equalTo(self.view);
    }];
    
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(65);
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
    
    return self.headContentView;
}
#pragma mark get

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
        _textView.layer.cornerRadius = 18;
    }
    return _textView;
}


-(MTHomeTopView *)topView{
    if (!_topView) {
        _topView = [[MTHomeTopView alloc]init];
    }
    return _topView;
}
-(MTHomeTableHeadView *)headContentView{
    if (!_headContentView) {
        _headContentView = [[MTHomeTableHeadView alloc]init];
        _headContentView.backgroundColor = [UIColor colorWithR:80 g:80 b:80 alpha:1];
    }
    return     _headContentView;
}
@end
