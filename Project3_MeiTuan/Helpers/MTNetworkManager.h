//
//  MTNetworkManager.h
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTBusineRequestModel.h"

@interface MTNetworkManager : NSObject

+ (void)GET_Busine:(MTBusineRequestModel *)model completionHandle:(void(^)(NSArray *array))block;

@end
