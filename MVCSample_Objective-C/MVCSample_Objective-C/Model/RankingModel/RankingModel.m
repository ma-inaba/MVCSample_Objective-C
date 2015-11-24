//
//  RankingModel.m
//  MVCSample_Objective-C
//
//  Created by inaba masaya on 2015/11/19.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

#import "RankingModel.h"
#import "RankingDataAPIManager.h"

@implementation RankingModel

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.rankingAppDataEntities = [NSMutableArray array];
    }
    return self;
}

- (void)receiveRankingData {

    RankingDataAPIManager *apiManager = [[RankingDataAPIManager alloc] init];
    __weak __typeof__(self) weakSelf = self;
    [apiManager loadAppStoreRankingData:^(NSArray *rankingData) {

        // NSMutableArrayのaddObjectはkvoの監視ができないので手動通知
        [weakSelf willChangeValueForKey:@"rankingAppDataEntities"];
        for (NSDictionary *dict in rankingData) {
            
            AppDataEntity *entity = [[AppDataEntity alloc] init];
            entity.appID = [[dict objectForKey:@"appID"] intValue];
            entity.appTitle = [dict objectForKey:@"appTitle"];
            [weakSelf.rankingAppDataEntities addObject:entity];
        }
        [weakSelf didChangeValueForKey:@"rankingAppDataEntities"];
        
    }];
}

- (void)removeAllRankingData {
    
    [self.rankingAppDataEntities removeAllObjects];
}

@end
