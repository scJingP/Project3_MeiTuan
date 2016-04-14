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
#import "MTsortTableView.h"
#import "MTsortDetailTableview.h"
#import <Masonry.h>

static NSString *Busine = @"busine";
static NSString *Location = @"location";
@interface MTBusineViewController ()<UITableViewDataSource,UITableViewDelegate>{
    CGFloat lineX;
}

@property (strong, nonatomic) MTHeadView *headview;
@property (strong, nonatomic) NSArray *allbusinearray;
@property (strong ,nonatomic) NSArray *favorablebusinearray;
@property (strong, nonatomic) NSArray *arryTableViewData;
@property (strong, nonatomic) MTsortTableView *sorttableview;  //分类表格
@property (strong, nonatomic) MTsortDetailTableview *sortdetailtableview;
@property (strong, nonatomic) UIView *indisplayview;  //里面的容器
@property (strong, nonatomic) UIView *outdisplayview; //外面的容器

@end

@implementation MTBusineViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    //加载数据
    [self setDataForCell];
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
    
    //分类按钮点击
    [self.headview.allclassbutton addTarget:self
                                     action:@selector(sortButtonOncliked:)
                           forControlEvents:UIControlEventTouchUpInside];
    [self.headview.citybutton addTarget:self
                                 action:@selector(sortButtonOncliked:)
                       forControlEvents:UIControlEventTouchUpInside];
    [self.headview.capacitysortbutton addTarget:self
                                         action:@selector(sortButtonOncliked:)
                               forControlEvents:UIControlEventTouchUpInside];
    [self setupHeadviewLayout];
    
    //代理、注册
    self.allbusinetableview.delegate = self;
    self.allbusinetableview.dataSource = self;
    [self.allbusinetableview registerClass:[MTBusineCell class] forCellReuseIdentifier:Busine];
    [self.allbusinetableview registerClass:[MTLocationCell class] forCellReuseIdentifier:Location];
}
#pragma marl - 数据加载
-(void)setDataForCell{
    //数据
    self.allbusinearray = @[@"东都休闲",@"洗浴",@"音乐广场",@"200",@"2km",@"about_criticism",@"ic_comment_social_share_kaixin_normal"];
    self.favorablebusinearray = @[@"自我主张造型",@"美发",@"双林路",@"100",@"1km",@"icon_cateye-1",@"ic_comment_social_share_qqweibo_normal"];
    self.arryTableViewData = self.allbusinearray;
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
        if (self.outdisplayview) {
            self.outdisplayview.hidden = YES;
            self.headview.allclassbutton.selected = NO;
            self.headview.citybutton.selected = NO;
            self.headview.capacitysortbutton.selected = NO;
        }
        //绿线动画
        [UIView animateWithDuration:0.15 animations:^{
          [self.headview.greenline mas_updateConstraints:^(MASConstraintMaker *make) {
              make.leading.equalTo(@(lineX));
          }];
        }];
    }
    if (sender.tag == 1) {
        self.arryTableViewData = self.favorablebusinearray;
        if (self.outdisplayview) {
            self.outdisplayview.hidden = YES;
            self.headview.allclassbutton.selected = NO;
            self.headview.citybutton.selected = NO;
            self.headview.capacitysortbutton.selected = NO;
        }
        //绿线动画
        [UIView animateWithDuration:0.15 animations:^{
          [self.headview.greenline mas_updateConstraints:^(MASConstraintMaker *make) {
              make.leading.equalTo(@(lineX));
          }];
        }];
    }
}
-(void)sortButtonOncliked:(MTHeadViewButton *)sender{
    self.sortdetailtableview.detailarray = nil;
    [self.view addSubview:self.outdisplayview];
    [self.outdisplayview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.leading.trailing.equalTo(self.allbusinetableview);
    }];
    if (sender.tag == 2) {
        if (self.headview.allclassbutton.selected == YES) {      // 关闭显示视图
            self.headview.allclassbutton.selected = NO;
            self.outdisplayview.hidden = YES;  //外面的容器
        }else if (self.headview.allclassbutton.selected == NO){      // 显示显示视图
            self.headview.allclassbutton.selected = YES;
            self.headview.citybutton.selected = NO;
            self.headview.capacitysortbutton.selected = NO;
            self.outdisplayview.hidden = NO;
            self.sorttableview.bassarray = self.sorttableview.alldataarray;
            [self addOutdisplayviewAndSortTableView]; //添加全部分类的TableView
        }
    }else if (sender.tag == 3) {
        if (self.headview.citybutton.selected == YES) {
            self.headview.citybutton.selected = NO;
            self.outdisplayview.hidden = YES;
        }else if (self.headview.citybutton.selected == NO){
            self.headview.citybutton.selected = YES;
            self.headview.allclassbutton.selected = NO;
            self.headview.capacitysortbutton.selected = NO;
            self.outdisplayview.hidden = NO;
            self.sorttableview.bassarray = self.sorttableview.cityarray;
            [self addOutdisplayviewAndSortTableView];
        }
    }else if (sender.tag == 4) {
        if (self.headview.capacitysortbutton.selected == YES) {
            self.headview.capacitysortbutton.selected = NO;
            self.outdisplayview.hidden = YES;
        }else if (self.headview.capacitysortbutton.selected == NO){
            self.headview.capacitysortbutton.selected = YES;
            self.headview.allclassbutton.selected = NO;
            self.headview.citybutton.selected = NO;
            self.outdisplayview.hidden = NO;
            self.sorttableview.bassarray = self.sorttableview.sortarray;
            [self addOutdisplayviewAndSortTableView];
            [self.sorttableview mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.leading.equalTo(self.outdisplayview);
                make.height.equalTo(@160);
                make.width.equalTo(@(kScreenWidth / 2));
            }];
        }
    }
}
-(void)addOutdisplayviewAndSortTableView{
    [self.outdisplayview addSubview:self.indisplayview];
    [self.outdisplayview addSubview:self.sorttableview];
    [self.indisplayview addSubview:self.sortdetailtableview];
    [self.sorttableview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.leading.equalTo(self.outdisplayview);
        make.height.mas_equalTo(480-44-70);
        make.width.equalTo(@(kScreenWidth / 2));
    }];
    [self.indisplayview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.width.equalTo(self.sorttableview);
        make.leading.equalTo(self.sorttableview.mas_trailing);
    }];
    [self.sortdetailtableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.width.equalTo(self.indisplayview);
        make.leading.equalTo(self.indisplayview);
    }];

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
        return 70;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 10;
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
-(UIView *)indisplayview{
    if (_indisplayview == nil) {
        _indisplayview = [[UIView alloc] init];
        _indisplayview.backgroundColor = [UIColor colorWithR:229 g:229 b:229 alpha:1];
    }
    return _indisplayview;
}
-(UIView *)outdisplayview{
    if (_outdisplayview == nil) {
        _outdisplayview = [[UIView alloc] init];
        _outdisplayview.backgroundColor = [UIColor colorWithR:83 g:83 b:83 alpha:0.9];
     }
    return _outdisplayview;
}
//点击隐藏表格
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.outdisplayview]; //获取点击的坐标点
    if (point.y >= self.sorttableview.bottomY && point.y <=self.outdisplayview.bottomY) {
        self.outdisplayview.hidden = YES;
        self.headview.allclassbutton.selected = NO;
        self.headview.citybutton.selected = NO;
        self.headview.capacitysortbutton.selected = NO;
    }
}
-(MTsortTableView *)sorttableview{
    if (_sorttableview == nil) {
        _sorttableview = [[MTsortTableView alloc] initWithDetailTableView:self.sortdetailtableview];
    }
    return _sorttableview;
}
-(MTsortDetailTableview *)sortdetailtableview{
    if (_sortdetailtableview == nil) {
        _sortdetailtableview = [[MTsortDetailTableview alloc] init];
        _sortdetailtableview.backgroundColor = [UIColor clearColor];
    }
    return _sortdetailtableview;
}





@end
