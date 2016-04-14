//
//  MTsortTableVIewCell.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/12.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTsortTableVIewCell.h"
#import <Masonry.h>

@implementation MTsortTableVIewCell
#pragma mark - init
-(void)awakeFromNib{
    [self initSubView];
    [self setupAutoLayout];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
        [self setupAutoLayout];
    }
    return self;
}

#pragma mark - 布局视图
-(void)initSubView{
    [self.contentView addSubview:self.textlabel];
    [self.contentView addSubview:self.imageview];
}
-(void)setupAutoLayout{
    [self.textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.leading.equalTo(@20);
    }];
    [self.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.trailing.equalTo(@-5);
        make.width.equalTo(@7);
        make.height.equalTo(@10);
    }];
}

#pragma mark - Custom
-(UILabel *)textlabel{
    if (_textlabel == nil) {
        _textlabel = [[UILabel alloc] init];
        _textlabel.font = [UIFont systemFontOfSize:14];
        _textlabel.textColor = [UIColor colorWithR:108 g:108 b:108 alpha:1];
    }
    return _textlabel;
}
-(UIImageView *)imageview{
    if (_imageview == nil) {
        _imageview = [[UIImageView alloc] init];
        _imageview.layer.masksToBounds= YES;
    }
    return _imageview;
}

@end
