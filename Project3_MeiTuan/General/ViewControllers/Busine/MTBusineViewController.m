//
//  MTBusineViewController.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTBusineViewController.h"
#import "MTBusineCell.h"
#import "MTLocationCell.h"
#import "MTHeadView.h"
#import "MTfavoraTableView.h"
#import <Masonry.h>

static NSString *Busine = @"busine";
static NSString *Location = @"location";
@interface MTBusineViewController ()<UITableViewDataSource,UITableViewDelegate>{
    CGFloat lineX;
}

@property (weak, nonatomic) IBOutlet UITableView *allbusinetableview;
@property (strong, nonatomic) MTHeadView *headview;
@property (nonatomic, strong) NSArray *allbusinearray;
@property (nonatomic ,strong) NSArray *favorablebusinearray;
@property (nonatomic, strong) NSArray *arryTableViewData;
@end

@implementation MTBusineViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    //数据
    self.allbusinearray = @[@"东都休闲",@"洗浴",@"音乐广场",@"200",@"2km",@"about_criticism",@"ic_comment_social_share_kaixin_normal"];
    self.favorablebusinearray = @[@"自我主张造型",@"美发",@"双林路",@"100",@"1km",@"icon_cateye-1",@"ic_comment_social_share_qqweibo_normal"];
    self.arryTableViewData = self.allbusinearray;
    
    lineX = 13;
    [self.view addSubview:self.headview];  //头视图
    [self.view addSubview:self.headview.greenline]; // 绿线
    //headview按钮点击
    [self.headview.allbusinebutton addTarget:self
                                      action:@selector(busineButtonOnclike:)
                            forControlEvents:UIControlEventTouchUpInside];
    [self.headview.favorablebusinebutton addTarget:self
                                            action:@selector(busineButtonOnclike:)
                                  forControlEvents:UIControlEventTouchUpInside];
    [self setupHeadviewLayout];
    self.allbusinetableview.delegate = self;
    self.allbusinetableview.dataSource = self;
    [self.allbusinetableview registerClass:[MTBusineCell class] forCellReuseIdentifier:Busine];
    [self.allbusinetableview registerClass:[MTLocationCell class] forCellReuseIdentifier:Location];
}

#pragma mark - SET
-(void)setArryTableViewData:(NSArray *)arryTableViewData{
    _arryTableViewData = arryTableViewData;
    [self.allbusinetableview reloadData];
}

#pragma mark - private
-(void)busineButtonOnclike:(MTHeadViewButton *)sender{
    lineX = sender.leftX + 13;
    if (sender.tag == 0) {
        self.arryTableViewData = self.allbusinearray;
        //绿线动画
        [UIView animateWithDuration:0.15 animations:^{
          [self.headview.greenline mas_updateConstraints:^(MASConstraintMaker *make) {
              make.leading.equalTo(@(lineX));
          }];
        }]; 
    }
    if (sender.tag == 1) {
        self.arryTableViewData = self.favorablebusinearray;
        //绿线动画
        [UIView animateWithDuration:0.15 animations:^{
          [self.headview.greenline mas_updateConstraints:^(MASConstraintMaker *make) {
              make.leading.equalTo(@(lineX));
          }];
        }];
    }
}

#pragma mark - 布局视图
-(void)setupHeadviewLayout{
    [self.headview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.view);
        make.top.equalTo(@20);
        make.height.equalTo(@90);
    }];
    [self.headview.greenline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headview).offset(4);
        make.leading.equalTo(@(lineX));
        make.height.equalTo(@2);
        make.width.equalTo(@50);
    }];
}

#pragma mark - UITableViewDataSource&&UITableViewDelegate
//返回多少队列
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//返回多少行Cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 10;
    }
}
//创建Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        MTLocationCell *locationcell;
        MTBusineCell *businecell;
        if (indexPath.section == 0) {
            locationcell = [tableView dequeueReusableCellWithIdentifier:Location forIndexPath:indexPath];
            locationcell.backgroundColor = [UIColor colorWithR:242 g:242 b:242 alpha:1];
            locationcell.locationlabel.text = @"定位";
            return locationcell;
        }else{
            businecell = [tableView dequeueReusableCellWithIdentifier:Busine forIndexPath:indexPath];
            businecell.namelabel.text =  self.arryTableViewData[0];
            businecell.catenamelabel.text = self.arryTableViewData[1];
            businecell.areanamelabel.text = self.arryTableViewData[2];
            businecell.marknumber.text = self.arryTableViewData[3];
            businecell.distancelabel.text= self.arryTableViewData[4];
            businecell.imageview.image = [UIImage imageNamed:self.arryTableViewData[5]];
            businecell.starimageview.image = [UIImage imageNamed:self.arryTableViewData[6]];
            return businecell;
        }
}
//Cell高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 40;
    }else{
        return 100;
    }
}
//点击Cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.allbusinetableview deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Custom
-(MTHeadView *)headview{  //头视图
    if (_headview == nil) {
        _headview = [[MTHeadView alloc] init];
        _headview.backgroundColor = [UIColor colorWithR:247 g:247 b:247 alpha:1];
    }
    return _headview;
}



@end
