//
//  MTBusineRequestModel.h
//  Project3_MeiTuan
//
//  Created by tens03 on 16/4/11.
//  Copyright © 2016年 tens03. All rights reserved.
//

#import "LWBaseRequestModel.h"
#import <MapKit/MapKit.h>

@interface MTBusineRequestModel : LWBaseRequestModel

/**
cityId	59
mypos	30.544956,104.064975
sort	smart
coupon	all
mpt_cate1	-1
offset	20
limit	20
fields	phone,scoreSource,markNumbers,cityId,addr,lng,hasGroup,subwayStationId,cates,frontImg,chooseSitting,wifi,avgPrice,style,featureMenus,avgScore,name,parkingInfo,lat,cateId,introduction,showType,areaId,districtId,preferent,lowestPrice,cateName,areaName,zlSourceType,campaignTag,mallName,mallId,brandId,brandName,brandLogo,brandStory,smPromotion,ktv,geo,historyCouponCount,recommendation,iUrl,isQueuing,newPayInfo,payInfo,sourceType,abstracts,groupInfo,isSuperVoucher,discount,isWaimai,collectionDeals,nearPoi,sparkle,topicList,cityIds,showChannel
__vhost	api.mobile.meituan.com
utm_source	xiaomi
utm_medium	android
utm_term	371
version_name	6.7.1
utm_content	869545022422020
utm_campaign	AgroupBgroupC1080995042226885120_c0_efe57e6b073376da04db836c74bd37bc7D100E0Gmerchant
ci	59
msid	8695450224220201460355919940
uuid	6DC7B0F806CBC6D4D09247C42F72748DFA8B0396173390EB493C6E4E5BE5D4D1
userid	126031703
 */

@property (nonatomic, assign) NSInteger cityId;
@property (nonatomic, copy) NSString *mypos;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, copy) NSString *msid;
@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *userid;

@end
