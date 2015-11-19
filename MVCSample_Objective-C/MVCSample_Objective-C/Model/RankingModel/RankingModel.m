//
//  RankingModel.m
//  MVCSample_Objective-C
//
//  Created by inaba masaya on 2015/11/19.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

#import "RankingModel.h"

@implementation RankingModel

- (void)receiveRankingData {
    self.rankingAppDataEntities = [NSMutableArray array];
    
    // ここでapiクラス等つかってデータを取得し、配列にセットする
    // TODO: 非同期で通信し、データを取ってくる想定。APIManagerを使用する
    // TODO: 現状はとりあえずの実装
    
    NSMutableArray *tempArray = [NSMutableArray array];
    AppDataEntity *entity = [[AppDataEntity alloc] init];
    entity.appID = 112233;
    entity.appTitle = @"パズドラ";
    [tempArray addObject:entity];
    
    AppDataEntity *entity2 = [[AppDataEntity alloc] init];
    entity2.appID = 665544;
    entity2.appTitle = @"ツムツム";
    [tempArray addObject:entity2];
    
    AppDataEntity *entity3 = [[AppDataEntity alloc] init];
    entity3.appID = 334455;
    entity3.appTitle = @"モンスト";
    [tempArray addObject:entity3];

    self.rankingAppDataEntities = tempArray;

}

@end
