//
//  MTNetworkManager.m
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "MTNetworkManager.h"

typedef void(^ModelData)(NSDictionary *dictionary);

@implementation MTNetworkManager

#pragma mark - 私有方法
+ (void)dataTaskWithRequest:(NSURLRequest *)arg1 withModelData:(ModelData)arg2
{
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:arg1 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"请求失败，%@",error);
            return ;
        }
        
        /* NSJSONReadingOptions
         NSJSONReadingMutableContainers：返回可变容器，NSMutableDictionary或NSMutableArray。
         NSJSONReadingMutableLeaves：返回的JSON对象中字符串的值为NSMutableString
         NSJSONReadingAllowFragments：允许JSON字符串最外层既不是NSArray也不是NSDictionary，但必须是有效的JSON数据
         */
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"%@",error);
            return ;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            arg2(dic);
        });
    }];
    [dataTask resume];
}

+ (void)handleNetworkErrorCode:(int)arg1
{
    
}

#pragma mark - api
+ (void)GET_Busine:(MTBusineRequestModel *)model completionHandle:(void(^)(NSArray *array))block {
    
    NSString *urlPar = [NSString stringWithFormat:@"%@%@",kURLStringBusineList,model.urlParameterString];
    NSURL *url = [NSURL URLWithString:urlPar];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self dataTaskWithRequest:request withModelData:^(NSDictionary *dictionary) {
        NSLog(@"%@",dictionary);
    }];
    
}




@end
