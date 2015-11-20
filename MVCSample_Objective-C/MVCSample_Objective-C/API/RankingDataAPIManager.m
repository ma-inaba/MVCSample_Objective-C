//
//  RankingDataAPIManager.m
//  MVCSample_Objective-C
//
//  Created by inaba masaya on 2015/11/19.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

#import "RankingDataAPIManager.h"

@implementation RankingDataAPIManager

- (void)loadAppStoreRankingData:(void (^)(NSDictionary *rankingData))block {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 仮に通信したていで５秒スリープさせる
        sleep(5);
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        [dictionary setObject:[NSNumber numberWithInt:111111] forKey:@"appID"];
        [dictionary setObject:@"パズドラ" forKey:@"appTitle"];
        block(dictionary);
    });
}
@end
