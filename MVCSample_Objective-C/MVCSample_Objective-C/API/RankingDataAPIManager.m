//
//  RankingDataAPIManager.m
//  MVCSample_Objective-C
//
//  Created by inaba masaya on 2015/11/19.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

#import "RankingDataAPIManager.h"

@implementation RankingDataAPIManager

- (void)loadAppStoreRankingData:(void (^)(NSArray *rankingData))block {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 仮に通信したていで５秒スリープさせる
        sleep(5);
        NSArray *idArray = [NSArray arrayWithObjects:
                            [NSNumber numberWithInt:111111],
                            [NSNumber numberWithInt:222222],
                            [NSNumber numberWithInt:333333], nil];
        
        NSArray *titleArray = [NSArray arrayWithObjects:
                               @"パズドラ", @"ツムツム", @"モンスト", nil];
        
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (int i = 0; i < 3; i++) {
            NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
            [dictionary setObject:[idArray objectAtIndex:i] forKey:@"appID"];
            [dictionary setObject:[titleArray objectAtIndex:i] forKey:@"appTitle"];
            [tempArray addObject:dictionary];
        }
        
        block(tempArray);
    });
}
@end
