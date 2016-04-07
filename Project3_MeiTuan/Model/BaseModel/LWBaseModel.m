//
//  LWBaseModel.m
//  PJWeibo
//
//  Created by tens03 on 16/3/16.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseModel.h"
#import <objc/runtime.h>


#define kArchiverPath [NSString stringWithFormat:@"%@/%@",kDocumentPath,[self class]]

@interface LWBaseModel () <NSCoding>

@end

@implementation LWBaseModel

- (NSMutableString *)urlParameterString
{
    if (_urlParameterString == nil) {
        _urlParameterString = [NSMutableString stringWithString:@"?"];
        NSArray *arrPropertyName = [self propertyList];
        for (NSString *name in arrPropertyName) {
            id value = [self valueForKey:name];
            
            if (value == nil) {
                continue;
            }
            
            [_urlParameterString appendString:[NSString stringWithFormat:@"%@=%@&",name, value]];
        }
    }
    return _urlParameterString;
}

- (NSMutableString *)postParameterString
{
    if (_postParameterString == nil) {
        _postParameterString = [NSMutableString string];
        NSArray *arrPropertyName = [self propertyList];
        for (NSString *name in arrPropertyName) {
            id value = [self valueForKey:name];
            
            if (value == nil) {
                continue;
            }
            
            [_postParameterString appendString:[NSString stringWithFormat:@"%@=%@&",name, value]];
        }
    }
    return _postParameterString;
}


#pragma mark - Response数据处理
// 将字典数据转化为对象
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

#pragma mark - Request数据处理
- (NSDictionary *)dictionaryWithSelf
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    NSArray *arrPropertyName = [self propertyList];
    for (NSString *name in arrPropertyName) {
        NSString *value = [self valueForKey:name];
        if (value == nil) {
            continue;
        }
        [dic setObject:value forKey:name];
    }
    return dic;
    
}

- (NSData *)jsonDataWithSelf
{
    return [NSJSONSerialization dataWithJSONObject:[self dictionaryWithSelf] options:NSJSONWritingPrettyPrinted error:nil];
}


#pragma mark - 对象的归档(多个对象、单个对象)、解档、删档
// 单个对象--实例方法--返回的都是数组
- (void)archiverWithSelf
{
    NSArray *arr = @[self];
    [NSKeyedArchiver archiveRootObject:arr toFile:kArchiverPath];
}

// 多个对象--类方法-- 返回的都是数组
+ (void)archiverAll:(NSArray *)arrModel
{
    [NSKeyedArchiver archiveRootObject:arrModel toFile:kArchiverPath];
}

+ (NSArray *)unarchiver;
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:kArchiverPath];
}

+ (BOOL)removeArchiver:(NSError **)error
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:kArchiverPath]) {
        return [fileManager removeItemAtPath:kArchiverPath error:error];
    }
    return NO;
}

+ (void)archiverPath
{
    NSLog(@"%@",kArchiverPath);
}

#pragma mark - <NSCoding>
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    NSArray *arrPropertyName = [self propertyList];
    for (NSString *name in arrPropertyName) {
        id value = [self valueForKey:name];
        [aCoder encodeObject:value forKey:name];
    }
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        NSArray *arrPropertyName = [self propertyList];
        for (NSString *name in arrPropertyName) {
            id value = [aDecoder decodeObjectForKey:name];
            [self setValue:value forKey:name];
        }
    }
    return self;
}


#pragma mark - 私有方法
- (NSArray *)propertyList
{
    Class aClass = [self class];
    NSMutableArray *arrPropertyName = [NSMutableArray array];
    
    while ([aClass isSubclassOfClass:[LWBaseModel class]]) {
        unsigned int propertyCount;
        objc_property_t *propertyList = class_copyPropertyList(aClass, &propertyCount);
        for (int i=0; i<propertyCount; i++) {
            objc_property_t property = propertyList[i];
            NSString *name = [NSString stringWithUTF8String:property_getName(property)];
            [arrPropertyName addObject:name];
        }
        aClass = [aClass superclass];
    }
    return arrPropertyName;
}

#pragma mark - 重写父类方法
- (NSString *)description
{
    NSMutableString *string = [NSMutableString string];
    NSArray *arrPropertyName = [self propertyList];
    for (NSString *name in arrPropertyName) {
        id value = [self valueForKey:name];
        [string appendString:[NSString stringWithFormat:@"\n%@: %@",name, value]];
    }
    return string;
}



@end
