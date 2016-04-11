//
//  MTsortTableViewCell.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/9.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTsortTableViewCell.h"
#import <Masonry.h>

@implementation MTsortTableViewCell

#pragma mark - init
-(void)awakeFromNib{
    [self initSubview];
    [self setupAutoLayout];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubview];
        [self setupAutoLayout];
    }
    return self;
}
#pragma mark - 添加子视图
-(void)initSubview{
    [self.contentView addSubview:self.imageview];
    [self.contentView addSubview:self.textlabel];
}
#pragma mark - 布局
-(void)setupAutoLayout{
    [self.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.leading.equalTo(@10);
        make.bottom.equalTo(@10);
    }];
    [self.textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageview);
        make.leading.equalTo(self.imageview.mas_trailing).offset(10);
        make.bottom.equalTo(self.imageview);
    }];
}

#pragma mark - Custom
-(UIImageView *)imageview{
    if (_imageview == nil) {
        _imageview = [[UIImageView alloc] init];
        _imageview.layer.masksToBounds = YES;
    }
    return _imageview;
}
-(UILabel *)textlabel{
    if (_textlabel == nil) {
        _textlabel = [[UILabel alloc] init];
        _textlabel.font = [UIFont systemFontOfSize:13];
        _textlabel.textColor = [UIColor colorWithR:130 g:130 b:130 alpha:1];
    }
    return _textlabel;
}

@end
