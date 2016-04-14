//
//  MTsortTableView.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTsortTableView.h"
#import "MTsortTableVIewCell.h"

static NSString *sortTableVIewCell = @"MTsortTableVIewCell";

@interface MTsortTableView ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *foodarray; //美食
@property (strong, nonatomic) NSMutableArray *housearray;  //酒店
@property (strong, nonatomic) NSMutableArray *entertainment;  //休闲娱乐
@property (strong, nonatomic) NSMutableArray *livearray; //生活服务
@property (strong, nonatomic) NSMutableArray *beautyarray; // 丽人
@property (strong, nonatomic) NSMutableArray *travelarray;  //旅游
@property (strong, nonatomic) NSMutableArray *detailarray;

@end
@implementation MTsortTableView
{
    MTsortDetailTableview *_detailTableView;
}

#pragma mark - init
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self setDataForCell];
        [self registerClass:[MTsortTableVIewCell class] forCellReuseIdentifier:sortTableVIewCell];
    }
    return self;
}

- (instancetype)initWithDetailTableView:(MTsortDetailTableview *)tableView
{
    self = [super init];
    if (self) {
        _detailTableView = tableView;
        self.delegate = self;
        self.dataSource = self;
        [self setDataForCell];
        [self registerClass:[MTsortTableVIewCell class] forCellReuseIdentifier:sortTableVIewCell];
    }
    return self;
}

#pragma mark - private
-(void)setDataForCell{
    self.alldataarray = @[@"全部分类",@"电影",@"美食",@"摄影写真",@"酒店",@"休闲娱乐",@"汽车服务",@"生活服务",@"丽人",@"旅游"];
    self.cityarray = @[@"附近",@"推荐商圈",@"新津县",@"锦江区",@"金牛区",@"龙泉驿区",@"武侯区",@"青白江区",@"新都区",@"青羊区",@"温江区",@"成华区",@"都江堰市",@"彭州市",@"邛崃市",@"金堂县",@"郫县",@"大邑县",@"浦江县",@"双流县",@"高新区"];
    self.sortarray = @[@"智能排序",@"好评优先",@"离我最近",@"人均最低"];
    self.bassarray = self.alldataarray;
}
-(void)setBassarray:(NSArray *)bassarray{
    _bassarray = bassarray;
    [self reloadData];
}
#pragma mark - UITableViewDataSource&&UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bassarray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MTsortTableVIewCell *cell = [tableView dequeueReusableCellWithIdentifier:sortTableVIewCell forIndexPath:indexPath];
    cell.imageview.image = nil;
    if (indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 7 || indexPath.row == 8 || indexPath.row == 9) {
        cell.imageview.image = [UIImage imageNamed:@"icon_map_dealDetailArrow"];
    }
    cell.textlabel.text = self.bassarray[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        _detailTableView.detailarray = self.detailarray[indexPath.row];
}

#pragma mark - Custom
//全部分类详细数据
-(NSMutableArray *)foodarray{
    if (_foodarray == nil) {
        _foodarray = [NSMutableArray arrayWithObjects:@"全部",@"火锅",@"自助餐",@"四餐",@"日韩料理",@"蛋糕甜点",@"烧烤烤鱼",@"川湘菜",@"江浙菜",@"粤菜",@"西北/东北菜",@"京菜/鲁菜",@"云贵菜",@"素食",@"东南亚菜",@"台湾菜",@"海鲜",@"小吃快餐",@"特色菜",@"汤/粥/炖菜",@"咖啡酒吧",@"蒙餐",@"新疆菜",@"其他美食", nil];
    }
    return _foodarray;
}
-(NSMutableArray *)housearray{
    if (_housearray == nil) {
        _housearray = [NSMutableArray arrayWithObjects:@"全部",@"经济型酒店",@"豪华酒店",@"青年旅社",@"客栈",@"主题酒店",@"公寓型酒店",@"度假酒店/度假村", nil];
    }
    return _housearray;
}
-(NSMutableArray *)entertainment{
    if (_entertainment == nil) {
        _entertainment = [NSMutableArray arrayWithObjects:@"全部",@"KTV",@"足疗按摩",@"运动健身",@"桌游/电玩",@"密室逃脱",@"咖啡酒吧",@"演出赛事",@"DIY手工",@"真人CS",@"4D/5D电影",@"其他娱乐", nil];
    }
    return _entertainment;
}
-(NSMutableArray *)livearray{
    if (_livearray == nil) {
        _livearray = [NSMutableArray arrayWithObjects:@"全部",@"母婴亲子",@"体检保健",@"照片冲印",@"培训课程",@"鲜花婚庆",@"配镜",@"其他生活", nil];
    }
    return _livearray;
}
-(NSMutableArray *)beautyarray{
    if (_beautyarray == nil) {
        _beautyarray = [NSMutableArray arrayWithObjects:@"全部",@"美发",@"美甲",@"美容SPA",@"瑜伽/舞蹈", nil];
    }
    return _beautyarray;
}
-(NSMutableArray *)travelarray{
    if (_travelarray == nil) {
        _travelarray = [NSMutableArray arrayWithObjects:@"全部",@"本地/周边游",@"景点门票票", nil];
    }
    return _travelarray;
}

-(NSMutableArray *)detailarray{
    if (_detailarray == nil) {
        NSArray *arr = [NSArray array];
        _detailarray = [NSMutableArray arrayWithObjects:arr,arr,self.foodarray,arr,self.housearray,self.entertainment,arr,self.livearray,self.beautyarray,self.travelarray,nil];
    }
    return _detailarray;
}



@end
