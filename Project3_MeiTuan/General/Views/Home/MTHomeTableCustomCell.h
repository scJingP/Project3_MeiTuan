//
//  MTHomeTableCustomCell.h
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/10.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTHomeTableCustomCell : UITableViewCell

//@property(strong, nonatomic)NSString * range;//"伊藤/世豪广场",
//@property(strong, nonatomic)NSString * mtitle;//": "100元代金券1张，除酒水外全场通用",
//@property(strong, nonatomic)NSString * title;//": "100元代金券1张，可叠加2张，免预约",
//@property(strong, nonatomic)NSNumber * value;//": 100,

@property(strong, nonatomic)UIView *contentVV;

///.cell 左边的图片
@property(strong, nonatomic)UIImageView *imageView3;//
///.cell 标题
@property(strong, nonatomic)UILabel *titleLabel3;//coco
///.cell 标题 右边的距离
@property(strong, nonatomic)UILabel *distanceLabel;
///.cell 两行的 文本描述
@property(strong, nonatomic)UILabel *locationDiscountDescribeLabel;
//@property(strong, nonatomic)NSAttributedString *priceAttributedString;
///.cell 价格
@property(strong, nonatomic)UITextView *priceTextView;
///.cell 多优惠 或 原价 为秀优越
@property(strong, nonatomic)UILabel *originPriceLabel;
///.cell 销量(已售 数)
@property(strong, nonatomic)UILabel *salesCountLabel;
@end
