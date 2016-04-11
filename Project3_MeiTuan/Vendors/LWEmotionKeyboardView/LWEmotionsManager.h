//
//  LWEmoticonsManager.h
//  PJWeibo
//
//  Created by tens03 on 16/3/25.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LWEmotionModel.h"

@interface LWEmotionsManager : NSObject

/**
 *  通过表情名称找出表情包中对应的Model
 *
 *  @param emoticonName 表情名称
 *
 *  @return 表情Model
 */
+ ( LWEmotionModel *)findEmoticonModelWithName:(NSString *)emoticonName;

/**
 *  获取所有表情包，一个表情包(一类表情)为一个键值对，一个表情包组成，key:表情包名称，value:这一类的表情组成的数组
 *
 *  @return 字典，所有表情包
 */
+ (NSDictionary *)dictionaryForAllEmotionPackage;

/**
 *  获取所有表情包。一个表情包(一类表情)为一个数组，其中包含多个表情
 *
 *  @return 数组，所有表情包
 */
+ (NSArray *)arrayForAllEmotionPackage;

/**
 *  获取所有 "表情包Model" Model中有两个字段：name、emotions
 *
 *  @return 数组，所有 "表情包Model"
 */
+ (NSArray<LWEmotionPackageModel *> *)arrayForAllEmotionPackageModel;

@end
