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
#import "MTAdButton.h"
#import <Masonry.h>
#import "MTImageButton.h"
#import "MTTextSearchButton.h"
#import "MTLocationNameButton.h"

///.image Search View
#import "MTimageSearchLoginVC.h"
///.address View alocation
#import "MTCollectionView.h"
///.  imageScan View
#import "MTimageSearchView.h"
///.  login
#import "MTLoginVC.h"
///.textSearch
#import "MTTextSearchVC.h"
///.touches begin view
#import "MTTouchesBeginView.h"

#import "MTTestVC.h"
static NSString *identifyTableViewCell = @"MTHomeTableCustomCell";
static int buttonItemSelectCount  = 0;

@interface MTHomeViewController()
<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    UIView *headView;
    MTHomeHeadView * homeHeadView;
    ///. 需要移除的
    UIView *deleteView;
    ///. button  double click
    BOOL  buttonItemSelectStatus;
}
@property(strong, nonatomic)UIButton *locationButton;
@property(strong, nonatomic)UITextView *textView;
@property(strong, nonatomic)UILabel *placeHolder;
///主页大量数据的 tableView
@property(strong, nonatomic)UITableView *mainTableView;
@property(strong, nonatomic)UIView *tableViewHeadView;

///.adsButton
@property(strong, nonatomic)NSMutableArray *adsButton;
///.navigation button
@property(strong, nonatomic)MTImageButton *imageSearchButton;
///.addressView alocation
@property(strong, nonatomic)UIView *translucentView;
@property(strong, nonatomic)MTCollectionView *collectionView;
///.  image search View
@property(strong, nonatomic)MTimageSearchView *imagesearchView;

@end

@implementation MTHomeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    
    [self addToView];
}

-(void)addToView{
    
    
    ///.imageSearch login
    [self loginingNotification];
    
    [self.mainTableView registerClass:[MTHomeTableCustomCell class] forCellReuseIdentifier:identifyTableViewCell];
    
    //    [self.view addSubview:self.headHomeheadView];
    
    [self.view addSubview:self.textView];
    self.textView.frame = CGRectMake(30, 5, 260, 15);
    
    [self.view addSubview:self.placeHolder];
    self.placeHolder.frame = CGRectMake(35, 5 + 3, 260, 12);
    
    [self.view addSubview:self.mainTableView];
    /**
     *  navigationBar 上  的   button
     */
    [self navigationItemSet];
    
    /**
     add to headView       这5行  代码  可以  加入  tableView header
     */
    //    headView = [[UIView alloc]init]; //]WithFrame:CGRectMake(0, 20, 320, 160)];
    //    headView.height = 160;
    //    self.mainTableView.tableHeaderView = headView;
    //    MTTestView *testView = [[MTTestView alloc]init];
    //    [headView addSubview:testView];
    /**
     为何  这  里  就不行  呢？
     */
    headView = [[UIView alloc]init];
    headView.height = 300;
    self.mainTableView.tableHeaderView = headView;//self.tableViewHeadView;
    [self addToTableViewHead];
    [headView addSubview:self.tableViewHeadView];
    
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
        make.top.mas_equalTo(self.view).offset(70);
        make.leading.trailing.bottom.mas_equalTo(self.view);
    }];
}

#pragma mark - make top view  locationButton textSearchButton imageSearchButton loginButton
-(void)navigationItemSet{
    /**
     先写  路
     button
     view
     UIBarButtonItem
     toolBar
     addToView
     */
    

    /**
     textSearchButton
     */
    MTTextSearchButton *textSearchButton = [[MTTextSearchButton alloc]init];
    [textSearchButton setFrame:CGRectMake(0, 0, 160, 32)];
    //    textSearchButton.layer.cornerRadius = 15;
    //    textSearchButton.layer.masksToBounds = YES;
    [textSearchButton addTarget:self action:@selector(textSearchButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    //buttonsView add buttons
    UIView *buttonsView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 32)];
    [buttonsView addSubview:textSearchButton];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonsView];
    [buttonsView setFrame:CGRectMake(0, 0, 320, 32)];
    //toolBar
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 32)];
    toolBar.barStyle = UIBarStyleDefault;
    toolBar.backgroundColor = [UIColor whiteColor];
    toolBar.tintColor = [UIColor blueColor];
    toolBar.items = [NSArray arrayWithObjects:buttonItem, nil];
    self.navigationItem.titleView = toolBar;
    /**
     locationButton
     */
    MTLocationNameButton *locationButton = [[MTLocationNameButton alloc]init];
    locationButton.functionLabel.text = @"成都";
    [locationButton setFrame:CGRectMake(0, 0, 40, 32)];
    [locationButton addTarget:self action:@selector(locationButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc]initWithCustomView:locationButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    /**
     right button
     */
    //imageSearchButton
    MTImageButton *imageSearchButton = [[MTImageButton alloc]init];
    [imageSearchButton setFrame:CGRectMake(0, 0, 25, 32)];
    [imageSearchButton addTarget:self action:@selector(imageSearchButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItemImage = [[UIBarButtonItem alloc]initWithCustomView:imageSearchButton];
    //loginButton
    MTImageButton *loginButton = [[MTImageButton alloc]init];
    [loginButton setFrame:CGRectMake(0, 25, 25, 32)];
    [loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItemLogin = [[UIBarButtonItem alloc]initWithCustomView:loginButton];
    self.navigationItem.rightBarButtonItems = @[rightButtonItemLogin, rightButtonItemImage];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithR:25 g:182 b:158 alpha:1];
}
/**
 locationButton
 textSearchButton
 imageSearchButton
 loginButton
 */
#pragma mark - login NSNotificationCenter
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"logining" object:nil];
}
-(void)loginingNotification{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginAchive) name:@"logining" object:nil];
}

#pragma mark mark - top navigation button Click
-(void)locationButtonClick:(UIBarButtonItem*)sender{
    [self.view.window addSubview:self.collectionView];
    self.collectionView.hidden = NO;
    deleteView = self.collectionView ;
    [self autoCollectionView];
}

-(void)textSearchButtonClick:(UIBarButtonItem*)sender{
    [self textSearchAchive];
    NSLog(@"textSearch");
}
-(void)imageSearchButtonClick:(UIBarButtonItem*)sender{
    [self.view.window addSubview:self.imagesearchView];
    self.imagesearchView.hidden = NO;
    deleteView = self.imagesearchView;
    [self autoSearchView];
    
    
    //    buttonItemSelectCount ++;
    //    buttonItemSelectStatus = YES;
    //
    //    if (buttonItemSelectCount % 2 ) {
    //        [self.view.window addSubview:self.imagesearchView];
    //        self.imagesearchView.hidden = NO;
    //        deleteView = self.imagesearchView;
    //        [self autoSearchView];
    //    }
    //    else{
    //        [deleteView removeFromSuperview];
    //    }
    //    buttonItemSelectStatus = NO;
}
-(void)loginButtonClick:(UIBarButtonItem*)sender{
    NSLog(@"login");
    [self loginAchive];
}
-(void)phoneclick{
    NSLog(@"phoneclick");
    MTimageSearchView *imageSearchView = [[MTimageSearchView alloc]init];
    [self.view addSubview:    imageSearchView];
    imageSearchView.frame = CGRectMake(217, 70, 100, 101);
}
-(void)mapclick{
    NSLog(@"mapclick");
}

-(void)imageSearchViewScanButton:(MTimageFunctionButton*)sender{
    //    [self showSearchView];
}


#pragma mark - top Click handle collectionView

-(void)autoCollectionView{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(270);
        make.height.mas_equalTo(300);
        make.centerX.mas_equalTo(self.view).offset(-25);;
        make.top.mas_equalTo(self.view).offset(40);
    }];
}

-(void)autoSearchView{
    [self.imagesearchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(81);
        make.height.mas_equalTo(81);
        make.top.mas_equalTo(self.view).offset(80);
        make.trailing.mas_equalTo(self.view).offset(-5);
    }];
}
-(void)loginAchive{
    MTLoginVC *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MTLoginVC"];
    [self.navigationController pushViewController:loginVC animated:YES];
    
}
-(void)textSearchAchive{
    MTTextSearchVC *textSearchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MTTextSearchVC"];
    [self.navigationController pushViewController:textSearchVC animated:YES];
}
#pragma mark - tableView head
/**
 *  add to tableView head
 */
-(void)addToTableViewHead{
    /**
     20 button  view  并添加到  tableView header
     */
    homeHeadView = [[MTHomeHeadView alloc]init];
    homeHeadView.height = 160;
    homeHeadView.frame = CGRectMake(0, 0, 320, 150);
    ///.添加到  tableView header
    [self.tableViewHeadView addSubview:homeHeadView];
    /**
     *  制件、 布局  广告 view   并添加到  tableView header
     */
    NSArray *colorArray = @[
                            [UIColor colorWithR:242 g:96 b:0 alpha:1],
                            [UIColor colorWithR:252 g:104 b:74 alpha:1],
                            [UIColor colorWithR:0 g:255 b:0 alpha:1],
                            [UIColor blueColor]
                            ];
    NSArray *activeNameArray = @[
                                 @"下单立减",
                                 @"新人福利会",
                                 @"新用户专享",
                                 @"一元抢吧"
                                 ];
    NSArray *activeDescribeArray = @[
                                     @"K歌9.9元起",
                                     @"购物专享减",
                                     @"最高立减25元",
                                     @"爆品抢到手软"
                                     ];
    UIView *adView = [[UIView alloc]initWithFrame:CGRectMake(0, 165, 320, 128)];
    
    for (int i = 0; i < 4; i++) {
        CGRect frameAll = CGRectMake(0, 0, 159.5, 63.5);
        CGFloat xx  = 0;
        if (i == 1 || i == 3) {
            xx = 160.5;
        }
        CGFloat yy = 0;
        if (i == 2 || i == 3) {
            yy = 64.5;
        }
        frameAll.origin.x = xx;
        frameAll.origin.y = yy;
        
        MTAdButton *adButton = [[MTAdButton alloc]init];
        adButton.activeNameLabel.text = activeNameArray[i];
        adButton.activeNameLabel.textColor = colorArray[i];
        adButton.activeDescribeLabel.text = activeDescribeArray[i];
        adButton.frame = frameAll;
        [adView addSubview:adButton];
        [self.adsButton addObject:adButton];
    }
    ///. 添加到  tableView header
    [self.tableViewHeadView addSubview:adView];
}

#pragma mark - UITableViewDataSource ///主页大量数据的 tableView 的设置
///主页大量数据的 tableView 的 row数目
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 11;
}
///主页大量数据的 tableView 的 row 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 101;
}
///主页大量数据的 tableView 的 cell 数据添加
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MTHomeTableCustomCell *cell  = [tableView dequeueReusableCellWithIdentifier:identifyTableViewCell];
    
    if(cell){
        
    }
    
    return cell;
}
///tableView header
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //UIView *head = self.headHomeheadView;
    //    head.frame = CGRectMake(0, 10, 320, 160);
    
    //    return self.tableViewHeadView;
    return headView;
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



#pragma mark - tableView head
-(NSMutableArray *)adsButton{
    if (!_adsButton) {
        _adsButton = [NSMutableArray array];
    }
    return  _adsButton;
}

-(UIView *)tableViewHeadView{
    if (!_tableViewHeadView) {
        _tableViewHeadView = [[UIView alloc]init];
    }
    return _tableViewHeadView;
}
/**
 *  address locationView get
 */
-(UIView *)translucentView{
    if (!_translucentView) {
        _translucentView = [[UIView alloc]init];
        _translucentView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
    }
    return _translucentView;
}
-(MTCollectionView *)collectionView{
    if (!_collectionView ) {
        _collectionView = [[MTCollectionView alloc]init];
    }
    return _collectionView;
}
/**
 *  image search view get
 */
-(MTimageSearchView *)imagesearchView{
    if (!_imagesearchView) {
        _imagesearchView = [[MTimageSearchView alloc]init];
    }
    return _imagesearchView;
}
@end


