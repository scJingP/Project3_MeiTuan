//
//  LWBaseModel.h
//  PJWeibo
//
//  Created by tens03 on 16/3/16.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWBaseModel : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong) NSMutableString *postParameterString;
@property (nonatomic, strong) NSMutableString *urlParameterString;

/**
 *  以当前类的属性生成一个字典
 *
 *  @return 字典
 */
- (NSDictionary *)dictionaryWithSelf;

/**
 *  将当前对象归档
 */
- (void)archiverWithSelf;

/**
 *  将当前对象数组归档
 */
+ (void)archiverAll:(NSArray *)arrModel;

/**
 *  将本地化得文件解档为存储LWBaseModel对象的数组
 *
 *  @return 存储LWBaseModel对象的数组
 */
+ (NSArray *)unarchiver;

/**
 *  将本地化的归档文件删除
 *
 *  @param archiverPath 错误信息的指针
 *
 *  @return 是否删除成功
 */
+ (BOOL)removeArchiver:(NSError **)error;

+ (void)archiverPath;
@end
