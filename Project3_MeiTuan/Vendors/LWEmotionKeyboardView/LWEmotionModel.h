//
//  LWEmoticonsModel.h
//  PJWeibo
//
//  Created by tens03 on 16/3/25.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseModel.h"

@interface LWEmotionModel : LWBaseModel

@property (nonatomic, copy) NSString *chs;
@property (nonatomic, copy) NSString *cht;
@property (nonatomic, copy) NSString *png;
@property (nonatomic, copy) NSString *gif;
@property (nonatomic, copy) NSString *type;

@end

@interface LWEmotionPackageModel : LWBaseModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray<LWEmotionModel *> *emotions;

@end
