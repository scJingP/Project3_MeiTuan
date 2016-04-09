//
//  MTLocationCell.m
//  Project3_MeiTuan
//
//  Created by guoqiang on 16/4/9.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTLocationCell.h"
#import <Masonry.h>

@implementation MTLocationCell
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
#pragma mark - 加载视图
-(void)initSubview{
    [self.contentView addSubview:self.locationlabel];
}

#pragma mark - 自动布局
-(void)setupAutoLayout{
    [self.locationlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.leading.equalTo(@10);
        make.bottom.equalTo(@-10);
        make.trailing.equalTo(@-50);
    }];
}

#pragma  mark - Custom
-(UILabel *)locationlabel{
    if (_locationlabel == nil) {
        _locationlabel = [[UILabel alloc] init];
        _locationlabel.font = [UIFont systemFontOfSize:15];
        _locationlabel.textColor = [UIColor colorWithR:107 g:107 b:107 alpha:1];
    }
    return _locationlabel;
}

@end
