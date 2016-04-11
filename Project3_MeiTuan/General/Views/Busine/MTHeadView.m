//
//  MTHeadView.m
//  Project3_MeiTuan
//

#import "MTHeadView.h"
#import <Masonry.h>
#import "MTHeadButton.h"
#import "MTsortTableViewCell.h"

static NSString *SortTableViewCell = @"sorttableviewcell";
@interface MTHeadView ()<UITableViewDataSource,UITableViewDelegate>{
    CGFloat lineX;
}

@end
@implementation MTHeadView

#pragma mark - init
-(instancetype)init{
    self = [super init];
    if (self) {
        lineX = 13;
        [self initSubview];
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark -设置布局
//-(void)setupAutoLayout{
//    [self addSubview:self.leftbutton];
//    [self addSubview:self.centerbutton];
//    [self addSubview:self.rightbutton];
//    
//    NSArray *array = @[self.leftbutton,self.centerbutton,self.rightbutton];
//    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
//    [array mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.equalTo(self);
//    }];
//}

#pragma mark - Custom
//-(MTHeadButton *)leftbutton{
//    if (_leftbutton == nil) {
//        _leftbutton = [MTHeadButton buttonWithType:UIButtonTypeCustom];
//    }
//    return _leftbutton;
//}
//-(MTHeadButton *)centerbutton{
//    if (_centerbutton == nil) {
//        _centerbutton = [MTHeadButton buttonWithType:UIButtonTypeCustom];
//    }
//    return _centerbutton;
//}
//-(MTHeadButton *)rightbutton{
//    if (_rightbutton == nil) {
//        _rightbutton = [MTHeadButton buttonWithType:UIButtonTypeCustom];
//    }
//    return _rightbutton;
//}

#pragma mark - 添加视图
-(void)initSubview{
    [self addSubview:self.allbusinebutton];
    [self addSubview:self.favorablebusinebutton];
    [self addSubview:self.greenline];
    [self addSubview:self.allclassbutton];
    [self addSubview:self.citybutton];
    [self addSubview:self.capacitysortbutton];
//    [self addSubview:self.locationbutton];
    [self addSubview:self.searchbutton];
}

#pragma mark - 布局
-(void)setupAutoLayout{
    NSArray *array = @[self.allclassbutton,self.citybutton,self.capacitysortbutton];
    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.equalTo(@40);
    }];
    [self.allbusinebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.leading.equalTo(self);
        make.width.equalTo(@76);
        make.height.equalTo(@48);
    }];
    [self.favorablebusinebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.leading.equalTo(self.allbusinebutton.mas_trailing);
        make.width.equalTo(self.allbusinebutton);
        make.height.equalTo(self.allbusinebutton);
    }];
    [self.greenline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.allbusinebutton.mas_bottom);
        make.leading.equalTo(@(lineX));
        make.height.equalTo(@2);
        make.width.equalTo(@50);
    }];
    [self.searchbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(@48);
        make.width.equalTo(@50);
    }];
//    [self.locationbutton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.trailing.equalTo(self.searchbutton.mas_leading);
//        make.top.equalTo(self);
//        make.height.equalTo(self.searchbutton);
//        make.width.equalTo(self.searchbutton);
//    }];
}

#pragma mark - 按钮点击
-(void)busineButtonOnclike:(MTHeadViewButton *)sender{
    lineX = sender.leftX + 13;
    [self setNeedsUpdateConstraints];
    [self needsUpdateConstraints];
    [UIView animateWithDuration:0.15 animations:^{
        [self layoutIfNeeded];
    }];
}
-(void)sortButtonOnclike:(MTHeadViewButton *)sender{
//    if (sender.selected) {
        [self addSubview:self.contanierview];
        [self.contanierview addSubview:self.sorttableview];
        [self.contanierview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self);
            make.top.equalTo(self.allclassbutton.mas_bottom);
            make.height.equalTo(@370);
        }];
        [self.sorttableview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.equalTo(self.contanierview);
            make.height.equalTo(self.contanierview);
            make.width.equalTo(@160);
        }];
//    }else{
//        self.contanierview.hidden = YES;
//        self.sorttableview.hidden = YES;
//    }
    
//    sender.selected = !sender.selected;
}
#pragma mark - 更新绿线的布局
-(void)updateConstraints{
    if (self.greenline.superview) {
        [self.greenline mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@(lineX));
        }];
    }
    [super updateConstraints];
}

#pragma mark -UITableViewDataSource&&UITableViewDelegate
//返回多少个Cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
//创建Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MTsortTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SortTableViewCell forIndexPath:indexPath];
    cell.imageView.backgroundColor = [UIColor blackColor];
    cell.textlabel.text = [@(indexPath.row) stringValue];
    return cell;
}

#pragma mark - Custom
-(MTHeadViewButton *)allbusinebutton{
    if (_allbusinebutton == nil) {
        _allbusinebutton = [MTHeadViewButton buttonWithType:UIButtonTypeCustom];
        _allbusinebutton.tag = 0;
        [_allbusinebutton setTitle:@"全部商家" forState:UIControlStateNormal];
        [_allbusinebutton setTitleColor:[UIColor colorWithR:123 g:123 b:123 alpha:1] forState:UIControlStateNormal];
        [_allbusinebutton setTitleColor:[UIColor colorWithR:62 g:182 b:168 alpha:1] forState:UIControlStateSelected];
        _allbusinebutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_allbusinebutton addTarget:self action:@selector(busineButtonOnclike:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _allbusinebutton;
}


-(MTHeadViewButton *)favorablebusinebutton{
    if (_favorablebusinebutton == nil) {
        _favorablebusinebutton = [MTHeadViewButton buttonWithType:UIButtonTypeCustom];
        _favorablebusinebutton.tag = 1;
        [_favorablebusinebutton setTitle:@"优惠商家" forState:UIControlStateNormal];
        [_favorablebusinebutton setTitleColor:[UIColor colorWithR:123 g:123 b:123 alpha:1] forState:UIControlStateNormal];
        [_favorablebusinebutton setTitleColor:[UIColor colorWithR:62 g:182 b:168 alpha:1] forState:UIControlStateSelected];
        _favorablebusinebutton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_favorablebusinebutton addTarget:self action:@selector(busineButtonOnclike:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _favorablebusinebutton;
}

-(MTHeadViewButton *)allclassbutton{
    if (_allclassbutton == nil) {
        _allclassbutton = [MTHeadViewButton buttonWithType:UIButtonTypeCustom];
        _allclassbutton.tag = 2;
        _allclassbutton.backgroundColor = [UIColor whiteColor];
        _allclassbutton.layer.borderWidth = 1;
        _allclassbutton.layer.borderColor = [UIColor colorWithR:232 g:232 b:232 alpha:1].CGColor;
        [_allclassbutton setTitle:@"全部分类" forState:UIControlStateNormal];
        [_allclassbutton setTitleColor:[UIColor colorWithR:123 g:123 b:123 alpha:1] forState:UIControlStateNormal];
        _allclassbutton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_allclassbutton addTarget:self action:@selector(sortButtonOnclike:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _allclassbutton;
}


-(MTHeadViewButton *)citybutton{
    if (_citybutton == nil) {
        _citybutton = [MTHeadViewButton buttonWithType:UIButtonTypeCustom];
        _citybutton.tag = 3;
        _citybutton.backgroundColor = [UIColor whiteColor];
        _citybutton.layer.borderWidth = 1;
        _citybutton.layer.borderColor = [UIColor colorWithR:232 g:232 b:232 alpha:1].CGColor;
        [_citybutton setTitle:@"全城" forState:UIControlStateNormal];
        [_citybutton setTitleColor:[UIColor colorWithR:123 g:123 b:123 alpha:1] forState:UIControlStateNormal];
        _citybutton.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _citybutton;
}
-(MTHeadViewButton *)capacitysortbutton{
    if (_capacitysortbutton == nil) {
        _capacitysortbutton = [MTHeadViewButton buttonWithType:UIButtonTypeCustom];
        _capacitysortbutton.tag = 4;
        _capacitysortbutton.backgroundColor = [UIColor whiteColor];
        _capacitysortbutton.layer.borderWidth = 1;
        _capacitysortbutton.layer.borderColor = [UIColor colorWithR:232 g:232 b:232 alpha:1].CGColor;
        [_capacitysortbutton setTitle:@"智能排序" forState:UIControlStateNormal];
        [_capacitysortbutton setTitleColor:[UIColor colorWithR:123 g:123 b:123 alpha:1] forState:UIControlStateNormal];
        _capacitysortbutton.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _capacitysortbutton;
}
-(UIView *)greenline{
    if (_greenline == nil) {
        _greenline = [[UIView alloc] init];
        _greenline.backgroundColor = [UIColor colorWithR:58 g:172 b:159 alpha:1];
    }
    return _greenline;
}
-(MTHeadViewButton *)locationbutton{
    if (_locationbutton == nil) {
        _locationbutton = [MTHeadViewButton buttonWithType:UIButtonTypeCustom];
        [_locationbutton setImage:[UIImage imageNamed:@"icon_homepage_map_old"] forState:UIControlStateNormal];
        _locationbutton.tag = 5;
    }
    return _locationbutton;
}
-(MTHeadViewButton *)searchbutton{
    if (_searchbutton == nil) {
        _searchbutton = [MTHeadViewButton buttonWithType:UIButtonTypeCustom];
        [_searchbutton setImage:[UIImage imageNamed:@"icon_search_glass"] forState:UIControlStateNormal];
        _searchbutton.tag = 6;
    }
    return _searchbutton;
}

-(UIView *)contanierview{
    if (_contanierview == nil) {
        _contanierview = [[UIView alloc] init];
        _contanierview.backgroundColor = [UIColor colorWithR:239 g:239 b:239 alpha:1];
    }
    return _contanierview;
}

-(UITableView *)sorttableview{
    if (_sorttableview == nil) {
        _sorttableview = [[UITableView alloc] init];
        [_sorttableview registerClass:[MTsortTableViewCell class] forCellReuseIdentifier:SortTableViewCell];

    }
    return _sorttableview;
}

@end
