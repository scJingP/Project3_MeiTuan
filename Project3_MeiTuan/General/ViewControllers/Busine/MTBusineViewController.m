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
#import "MTHeadViewButton.h"
#import <Masonry.h>

static NSString *Busine = @"busine";
static NSString *Location = @"location";
@interface MTBusineViewController ()<UITableViewDataSource,UITableViewDelegate>{
}

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) MTHeadView *headview;

@end

@implementation MTBusineViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.headview];  //头视图
    [self setupHeadviewLayout];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
//    self.tableview.scrollEnabled = NO;
    [self.tableview registerClass:[MTBusineCell class] forCellReuseIdentifier:Busine];
    [self.tableview registerClass:[MTLocationCell class] forCellReuseIdentifier:Location];
}

#pragma mark - 布局视图
-(void)setupHeadviewLayout{
    [self.headview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.view);
        make.top.equalTo(@20);
        make.height.equalTo(@90);
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
    MTBusineCell *businecell;
    MTLocationCell *locationcell;
    if (indexPath.section == 0) {
        locationcell = [tableView dequeueReusableCellWithIdentifier:Location forIndexPath:indexPath];
        locationcell.backgroundColor = [UIColor colorWithR:242 g:242 b:242 alpha:1];
        locationcell.locationlabel.text = @"定位";
        return locationcell;
    }else{
        businecell = [tableView dequeueReusableCellWithIdentifier:Busine forIndexPath:indexPath];
        businecell.imageview.backgroundColor = [UIColor blackColor];
        businecell.starimageview.backgroundColor = [UIColor lightGrayColor];
        businecell.namelabel.text = [@(indexPath.row)stringValue];
        businecell.catenamelabel.text = [@(indexPath.row)stringValue];
        businecell.areanamelabel.text = [@(indexPath.row)stringValue];
        businecell.marknumber.text = [@(indexPath.row)stringValue];
        businecell.distancelabel.text= [@(indexPath.row)stringValue];
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
    [self.tableview deselectRowAtIndexPath:indexPath animated:YES];
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
