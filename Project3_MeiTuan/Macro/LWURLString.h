//
//  LWRequestURL.h
//  PJWeibo
//
//  Created by tens03 on 16/3/18.
//  Copyright © 2016年 tens03. All rights reserved.
//

#ifndef LWRequestURL_h
#define LWRequestURL_h

#define baseURLString(url)                  [NSString stringWithFormat:@"https://api.weibo.com/2/%@",url]

#define kURLStringPublicTimeline            baseURLString(@"statuses/home_timeline.json")
#define kURLStringComment                   baseURLString(@"comments/show.json")
#define kURLStringReleaseWeiboAndImage      @"https://upload.api.weibo.com/2/statuses/upload.json"
#define kURLStringReleaseWeibo              @"https://api.weibo.com/2/statuses/update.json"

#define kHttpGet                             @"GET"
#define kHttpPost                            @"POST"

#endif /* LWRequestURL_h */
