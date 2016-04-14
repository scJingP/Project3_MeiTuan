//
//  MTHeadView.m
//  Project3_MeiTuan
//

#import "MTHeadView.h"
#import <Masonry.h>

static NSString *SortTableViewCell = @"sorttableviewcell";
@interface MTHeadView (){
}
@end
@implementation MTHeadView

#pragma mark - init
-(instancetype)init{
    self = [super init];
    if (self) {
        [self initSubview];
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - 添加视图
-(void)initSubview{
    [self addSubview:self.allbusinebutton];
    [self addSubview:self.favorablebusinebutton];
    [self addSubview:self.greenline];
    [self addSubview:self.allclassbutton];
    [self addSubview:self.citybutton];
    [self addSubview:self.capacitysortbutton];
    [self addSubview:self.locationbutton];
    [self addSubview:self.searchbutton];
    [self.allclassbutton addSubview:self.allclassbutton.imageview];
    [self.citybutton addSubview:self.citybutton.imageview];
    [self.capacitysortbutton addSubview:self.capacitysortbutton.imageview];
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
    [self.searchbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(@48);
        make.width.equalTo(@50);
    }];
    [self.locationbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.searchbutton.mas_leading);
        make.top.equalTo(self);
        make.height.equalTo(self.searchbutton);
        make.width.equalTo(self.searchbutton);
    }];
    [self.allclassbutton.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.bottom.equalTo(self.allclassbutton);
        make.height.equalTo(@10);
        make.width.equalTo(@15);
    }];
    [self.citybutton.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.bottom.equalTo(self.citybutton);
        make.height.equalTo(@10);
        make.width.equalTo(@15);
    }];
    [self.capacitysortbutton.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.bottom.equalTo(self.capacitysortbutton);
        make.height.equalTo(@10);
        make.width.equalTo(@15);
    }];
   
}

#pragma mark - Custom
-(MTHeadViewButton *)allbusinebutton{
    if (_allbusinebutton == nil) {
        _allbusinebutton = [MTHeadViewButton buttonWithType:UIButtonTypeCustom];
        _allbusinebutton.tag = 0;
        [_allbusinebutton setTitle:@"全部商家" forState:UIControlStateNormal];
        [_allbusinebutton setTitleColor:[UIColor colorWithR:123 g:123 b:123 alpha:1] forState:UIControlStateNormal];
        [_allbusinebutton setTitleColor:[UIColor colorWithR:39 g:170 b:152 alpha:1] forState:UIControlStateSelected];
        _allbusinebutton.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _allbusinebutton;
}

-(MTHeadViewButton *)favorablebusinebutton{
    if (_favorablebusinebutton == nil) {
        _favorablebusinebutton = [MTHeadViewButton buttonWithType:UIButtonTypeCustom];
        _favorablebusinebutton.tag = 1;
        [_favorablebusinebutton setTitle:@"优惠商家" forState:UIControlStateNormal];
        [_favorablebusinebutton setTitleColor:[UIColor colorWithR:123 g:123 b:123 alpha:1] forState:UIControlStateNormal];
        [_favorablebusinebutton setTitleColor:[UIColor colorWithR:39 g:170 b:152 alpha:1] forState:UIControlStateSelected];
        _favorablebusinebutton.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _favorablebusinebutton;
}

-(UIView *)greenline{
    if (_greenline == nil) {
        _greenline = [[UIView alloc] init];
        _greenline.backgroundColor = [UIColor colorWithR:58 g:172 b:159 alpha:1];
    }
    return _greenline;
}

-(MTHeadViewButton *)allclassbutton{
    if (_allclassbutton == nil) {
        _allclassbutton = [MTHeadViewButton buttonWithType:UIButtonTypeCustom];
        _allclassbutton.tag = 2;
        _allclassbutton.backgroundColor = [UIColor whiteColor];
        _allclassbutton.layer.borderWidth = 1;
        _allclassbutton.layer.borderColor = [UIColor colorWithR:232 g:232 b:232 alpha:1].CGColor;
        [_allclassbutton setTitle:@"全部分类" forState:UIControlStateNormal];
        [_allclassbutton setTitleColor:[UIColor colorWithR:65 g:179 b:162 alpha:1] forState:UIControlStateSelected];
        [_allclassbutton setTitleColor:[UIColor colorWithR:123 g:123 b:123 alpha:1] forState:UIControlStateNormal];
        _allclassbutton.imageview.image = [UIImage imageNamed:@"icon_dealsmap_cateArrow"];
        _allclassbutton.titleLabel.font = [UIFont systemFontOfSize:14];
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
        [_citybutton setTitleColor:[UIColor colorWithR:65 g:179 b:162 alpha:1] forState:UIControlStateSelected];
        [_citybutton setTitleColor:[UIColor colorWithR:123 g:123 b:123 alpha:1] forState:UIControlStateNormal];
        _citybutton.imageview.image = [UIImage imageNamed:@"icon_dealsmap_cateArrow"];
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
        [_capacitysortbutton setTitleColor:[UIColor colorWithR:65 g:179 b:162 alpha:1] forState:UIControlStateSelected];
        [_capacitysortbutton setTitleColor:[UIColor colorWithR:123 g:123 b:123 alpha:1] forState:UIControlStateNormal];
        _capacitysortbutton.imageview.image = [UIImage imageNamed:@"icon_dealsmap_cateArrow"];
        _capacitysortbutton.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _capacitysortbutton;
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


@end
