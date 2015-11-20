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
    [apiManager loadAppStoreRankingData:^(NSDictionary *rankingData) {
       
        AppDataEntity *entity = [[AppDataEntity alloc] init];
        entity.appID = [[rankingData objectForKey:@"appID"] intValue];
        entity.appTitle = [rankingData objectForKey:@"appTitle"];
        
        // NSMutableArrayのaddObjectはkvoの監視ができないので手動通知
        [self willChangeValueForKey:@"rankingAppDataEntities"];
        [self.rankingAppDataEntities addObject:entity];
        [self didChangeValueForKey:@"rankingAppDataEntities"];
        
    }];

}

@end
