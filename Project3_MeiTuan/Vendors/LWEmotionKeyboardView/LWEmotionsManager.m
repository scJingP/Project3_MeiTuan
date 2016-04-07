//
//  LWEmotionsManager.m
//  PJWeibo
//
//  Created by tens03 on 16/3/25.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWEmotionsManager.h"

@implementation LWEmotionsManager

#pragma mark - 私有方法
+ (NSArray *)getEmotionsWithPlistFileName:(NSString *)fileName
{
    NSMutableArray *array = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    for (NSDictionary *dic in dictionary[@"emoticons"]) {
        LWEmotionModel *Model = [[LWEmotionModel alloc] initWithDictionary:dic];
        [array addObject:Model];
    }
    return array;
}


#pragma mark - 共有方法
+ (NSArray *)arrayForAllEmotions
{
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObjectsFromArray:[self defaultEmotions]];
    [arr addObjectsFromArray:[self lxhEmotions]];
    return arr;
}

+ (NSArray *)arrayForAllEmotionPackage
{
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:[self defaultEmotions]];
    [arr addObject:[self lxhEmotions]];
    return arr;
}

+ (NSArray<LWEmotionPackageModel *> *)arrayForAllEmotionPackageModel;
{
    NSMutableArray<LWEmotionPackageModel *> *array = [NSMutableArray<LWEmotionPackageModel *> array];
    
    LWEmotionPackageModel *defaultPackageModel = [[LWEmotionPackageModel alloc] init];
    defaultPackageModel.name = @"defaultEmotions";
    defaultPackageModel.emotions = [self defaultEmotions];
    [array addObject:defaultPackageModel];
    
    LWEmotionPackageModel *lxhPackageModel = [[LWEmotionPackageModel alloc] init];
    lxhPackageModel.name = @"lxhEmotions";
    lxhPackageModel.emotions = [self lxhEmotions];
    [array addObject:lxhPackageModel];
    
    return array;
}

+ (NSDictionary *)dictionaryForAllEmotionPackage
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:[self defaultEmotions] forKey:@"defaultEmotions"];
    [dic setObject:[self lxhEmotions] forKey:@"lxhEmotions"];
    return dic;
}

+ (NSArray *)defaultEmotions
{
    return [self getEmotionsWithPlistFileName:@"defaultInfo.plist"];
}

+ (NSArray *)lxhEmotions
{
    return [self getEmotionsWithPlistFileName:@"lxhInfo.plist"];
}

+ ( LWEmotionModel *)findEmoticonModelWithName:(NSString *)emoticonName
{
    NSArray *Emotions = [self arrayForAllEmotions];
    for (LWEmotionModel *Model in Emotions) {
        if ([Model.chs isEqualToString:emoticonName] || [Model.cht isEqualToString:emoticonName]) {
            return Model;
        }
    }
    return nil;
}

@end
