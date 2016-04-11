//
//  MTBusineCell.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/8.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTBusineCell.h"
#import <Masonry.h>

@implementation MTBusineCell
#pragma init
-(void)awakeFromNib{
    [self initView];
    [self setupAutoLayout];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =   [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - 加载视图
-(void)initView{
<<<<<<< HEAD
//    [self.contentView addSubview:self.headview];
    [self.contentView addSubview:self.imageview];
    [self.contentView addSubview:self.starimage];
=======
    [self.contentView addSubview:self.imageview];
    [self.contentView addSubview:self.starimageview];
>>>>>>> bdc9d4fe4e5d488f45c02046cc0f41cdacc9b30c
    [self.contentView addSubview:self.namelabel];
    [self.contentView addSubview:self.catenamelabel];
    [self.contentView addSubview:self.areanamelabel];
    [self.contentView addSubview:self.marknumber];
    [self.contentView addSubview:self.distancelabel];
    
}

#pragma mark - 自动布局
-(void)setupAutoLayout{
<<<<<<< HEAD
//    [self.headview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.leading.trailing.equalTo(self);
//    }];
=======
>>>>>>> bdc9d4fe4e5d488f45c02046cc0f41cdacc9b30c
    [self.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.equalTo(@2);
        make.bottom.equalTo(@-2);
    }];
    [self.namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.leading.equalTo(self.imageview.mas_trailing).offset(10);
        make.trailing.equalTo(@10);
    }];
    [self.catenamelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.namelabel.mas_bottom).offset(35);
        make.leading.equalTo(self.namelabel);
<<<<<<< HEAD
=======
        make.bottom.equalTo(@-15);
>>>>>>> bdc9d4fe4e5d488f45c02046cc0f41cdacc9b30c
    }];
    [self.areanamelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.catenamelabel);
        make.leading.equalTo(self.catenamelabel.mas_trailing).offset(15);
<<<<<<< HEAD
    }];
    [self.marknumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.namelabel.mas_bottom).offset(7);
        make.leading.equalTo(self.imageview.mas_trailing).offset(100);
    }];
    [self.starimage mas_makeConstraints:^(MASConstraintMaker *make) {
=======
        make.bottom.equalTo(self.catenamelabel);
    }];
    [self.marknumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.namelabel.mas_bottom).offset(10);
        make.leading.equalTo(self.imageview.mas_trailing).offset(100);
    }];
    [self.starimageview mas_makeConstraints:^(MASConstraintMaker *make) {
>>>>>>> bdc9d4fe4e5d488f45c02046cc0f41cdacc9b30c
        make.leading.equalTo(self.namelabel);
        make.top.equalTo(self.marknumber);
        make.trailing.equalTo(self.marknumber.mas_leading).offset(-15);
    }];
    [self.distancelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.areanamelabel);
        make.trailing.equalTo(@10);
    }];
}
<<<<<<< HEAD
#pragma mark - 设置宽高
-(void)updateConstraints{
//    [self.headview mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@50);
//    }];
    [self.imageview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@80);
    }];
    [self.starimage mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@20);
    }];
    [self.namelabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@20);
    }];
    [self.catenamelabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
        make.height.equalTo(@20);
    }];
    [self.areanamelabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@20);
        make.width.equalTo(@60);
=======

#pragma mark - 设置宽高
-(void)updateConstraints{
    [self.imageview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@80);
    }];
    [self.namelabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);
    }];
    [self.catenamelabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
    }];
    [self.areanamelabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@70);
>>>>>>> bdc9d4fe4e5d488f45c02046cc0f41cdacc9b30c
    }];
    [self.marknumber mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
    }];
<<<<<<< HEAD
    [self.distancelabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
=======
    [self.starimageview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15);
    }];
    [self.distancelabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@50);
>>>>>>> bdc9d4fe4e5d488f45c02046cc0f41cdacc9b30c
    }];
    [super updateConstraints];
}

#pragma mark - 设置数据
-(void)setInformation{
    
}

#pragma Custom
-(UIImageView *)imageview{
    if (_imageview == nil) {
        _imageview = [[UIImageView alloc] init];
        _imageview.layer.cornerRadius = 10;
        _imageview.layer.masksToBounds = YES;
    }
    return _imageview;
}
<<<<<<< HEAD
-(UIImageView *)starimage{
    if (_starimage == nil) {
        _starimage = [[UIImageView alloc] init];
        _starimage.layer.cornerRadius = 10;
        _imageview.layer.masksToBounds = YES;
    }
    return _starimage;
=======
-(UIImageView *)starimageview{
    if (_starimageview == nil) {
        _starimageview = [[UIImageView alloc] init];
        _starimageview.layer.masksToBounds = YES;
    }
    return _starimageview;
>>>>>>> bdc9d4fe4e5d488f45c02046cc0f41cdacc9b30c
}
-(UILabel *)namelabel{
    if (_namelabel == nil) {
        _namelabel = [[UILabel alloc] init];
        _namelabel.font = [UIFont systemFontOfSize:16];
        _namelabel.textColor = [UIColor colorWithR:100 g:100 b:100 alpha:1];
    }
    return _namelabel;
}
-(UILabel *)catenamelabel{
    if (_catenamelabel == nil) {
        _catenamelabel = [[UILabel alloc] init];
        _catenamelabel.font = [UIFont systemFontOfSize:14];
        _catenamelabel.textColor = [UIColor colorWithR:151 g:151 b:151 alpha:1];
    }
    return _catenamelabel;
}
-(UILabel *)areanamelabel{
    if (_areanamelabel == nil) {
        _areanamelabel = [[UILabel alloc] init];
        _areanamelabel.font = [UIFont systemFontOfSize:14];
        _areanamelabel.textColor = [UIColor colorWithR:151 g:151 b:151 alpha:1];
    }
    return _areanamelabel;
}
-(UILabel *)marknumber{
    if (_marknumber == nil) {
        _marknumber = [[UILabel alloc] init];
        _marknumber.font = [UIFont systemFontOfSize:13];
        _marknumber.textColor = [UIColor colorWithR:172 g:172 b:172 alpha:1];
    }
    return _marknumber;
}
-(UILabel *)distancelabel{
    if (_distancelabel== nil) {
        _distancelabel = [[UILabel alloc] init];
        _distancelabel.font = [UIFont systemFontOfSize:13];
        _distancelabel.textColor = [UIColor colorWithR:172 g:172 b:172 alpha:1];
    }
    return _distancelabel;
}
<<<<<<< HEAD
-(MTHeadView *)headview{
    if (_headview == nil) {
        _headview = [[MTHeadView alloc] init];
    }
    return _headview;
}
=======
>>>>>>> bdc9d4fe4e5d488f45c02046cc0f41cdacc9b30c

@end
