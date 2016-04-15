//
//  MTHomeTableCustomCell.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/14.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTHomeTableCustomCell.h"
#import <Masonry.h>

@interface MTHomeTableCustomCell()
<UITextViewDelegate>

@end

@implementation MTHomeTableCustomCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self addViewtoCell];
        [self autoLayerPosition];
    }
    return self;
}
#pragma mark - 添加 控件
///.cell 添加控件
-(void)addViewtoCell{
    //    UIView *view = [[UIView alloc]init];
    //    view.backgroundColor = [UIColor purpleColor];
    //    [self.contentView addSubview:view];
    //    [view mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.mas_equalTo(self.contentView).offset(10);
    //        make.leading.mas_equalTo(self.contentView).offset(10);
    //        make.height.width.mas_equalTo(100);
    //    }];
    
    //    [self.contentView addSubview:_contentVV];
    [self.contentView addSubview:self.imageView3]; //
    [self.contentView addSubview:self.titleLabel3];
    [self.contentView addSubview:self.distanceLabel];
    [self.contentView addSubview:self.locationDiscountDescribeLabel];
    [self.contentView addSubview:self.priceTextView];
    [self.contentView addSubview:self.originPriceLabel];
    [self.contentView addSubview:self.salesCountLabel];
}
#pragma mark - cell 自动布局
///.cell 自动布局
-(void)autoLayerPosition{
    //    [self.contentVV mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(@6);
    //        make.leading.trailing.bottom.equalTo(self.contentView);
    //    }];
    [self.imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(8);
        make.leading.mas_equalTo(self.contentView).offset(8);
        //        make.bottom.mas_equalTo(self.contentView).offset(-8);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(85);
    }];
    [self.titleLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView3.mas_top).offset(2);
        make.leading.mas_equalTo(self.imageView3.mas_trailing).offset(8);
    }];
    [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.titleLabel3.mas_centerY);
        make.trailing.mas_equalTo(self.contentView).offset(-8);
    }];
    [self.locationDiscountDescribeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel3.mas_bottom).offset(8);
        make.leading.mas_equalTo(self.imageView3.mas_trailing).offset(8);
        make.trailing.mas_equalTo(self.contentView).offset(-8);
    }];
    [self.priceTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.imageView3.mas_bottom).offset(-2);
        make.leading.mas_equalTo(self.imageView3.mas_trailing).offset(8);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(50);
    }];
    [self.originPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.priceTextView.mas_centerY);
        make.leading.mas_equalTo(self.priceTextView.mas_trailing).offset(8);
    }];
    [self.salesCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.priceTextView.mas_centerY);
        make.trailing.mas_equalTo(self.contentView).offset(-8);
    }];
}
#pragma mark - get
-(UIView *)contentVV{
    if (!_contentVV) {
        _contentVV = [[UIView alloc]init];
        _contentVV.backgroundColor = [UIColor purpleColor];
    }
    return _contentVV;
}

-(UIImageView *)imageView3{
    if (!_imageView3) {
        _imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 87)];
        _imageView3.image = [UIImage imageNamed:@"leftImageTest"];
    }
    
    return _imageView3;
}
-(UILabel *)titleLabel3{
    if (!_titleLabel3) {
        _titleLabel3 = [[UILabel alloc]init];
        _titleLabel3.text = @"Coco都可茶饮";
        _titleLabel3.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel3;
}
-(UILabel *)distanceLabel{
    if (!_distanceLabel) {
        _distanceLabel = [[UILabel alloc]init];
        _distanceLabel.text = @"511m";
        _distanceLabel.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        _distanceLabel.font = [UIFont systemFontOfSize:13];
    }
    return _distanceLabel;
}
-(UILabel *)locationDiscountDescribeLabel{
    if (!_locationDiscountDescribeLabel) {
        _locationDiscountDescribeLabel = [[UILabel alloc]init];
        _locationDiscountDescribeLabel.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        _locationDiscountDescribeLabel.text = @"[伊藤/世豪广场等]饮品6选1欢迎选购！欢迎选购欢迎选购";
        _locationDiscountDescribeLabel.font = [UIFont systemFontOfSize:13];
        _locationDiscountDescribeLabel.numberOfLines = 0;
    }
    return _locationDiscountDescribeLabel;
}
///.textView 加上宽高  就  ok啦！
-(UITextView *)priceTextView{
    if (!_priceTextView) {
        _priceTextView = [[UITextView alloc]init];
        NSString *strs = @"￥5.9";
        /**
         *  原想  为 ￥ 变小 为 数字 变大，  但
         */
        //        NSInteger length = strs.length;
        //        NSMutableAttributedString *muAttribute = [[NSMutableAttributedString alloc]initWithString:strs];
        //        [muAttribute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, 1)];
        //        [muAttribute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(1, length)];
        //        [muAttribute addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, length)];
        //        NSAttributedString *attStr = [[NSAttributedString alloc]initWithAttributedString:muAttribute];
        _priceTextView.textColor = [UIColor blueColor];
        _priceTextView.text = strs;
        _priceTextView.scrollEnabled = NO;
        _priceTextView.editable = NO;
        _priceTextView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _priceTextView.font = [UIFont systemFontOfSize:13];
        //        _priceTextView.attributedText = (NSAttributedString*)muAttribute;
    }
    return      _priceTextView;
}

-(UILabel *)originPriceLabel{
    if (!_originPriceLabel) {
        _originPriceLabel = [[UILabel alloc]init];
        _originPriceLabel.font = [UIFont systemFontOfSize:13];
        _originPriceLabel.textColor = [UIColor orangeColor];
        _originPriceLabel.text = @"0.01元抢";
        _originPriceLabel.layer.borderColor = [UIColor orangeColor].CGColor;
        _originPriceLabel.layer.borderWidth = 1;
        _originPriceLabel.adjustsFontSizeToFitWidth = YES;
        /**
         *  原想  为  label 边框 与文本 加 间距  但
         */
        //        CGRect boundsNew ;
        //        boundsNew = _originPriceLabel.bounds;
        //        CGFloat widthOrigin = boundsNew.size.width;
        //        CGFloat heightOrigin =        boundsNew.size.height ;
        //        boundsNew.size.width = widthOrigin + 2;
        //        boundsNew.size.height = heightOrigin + 2;
        //        _originPriceLabel.bounds = boundsNew;
    }
    return _originPriceLabel;
}
-(UILabel *)salesCountLabel{
    if (!_salesCountLabel) {
        _salesCountLabel = [[UILabel alloc]init];
        _salesCountLabel.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
        _salesCountLabel.font = [UIFont systemFontOfSize:13];
        _salesCountLabel.text = @"已售7630";
        _salesCountLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _salesCountLabel;
}

#pragma mark - UITextViewDelegate

@end
