//
//  RankingModel.h
//  MVCSample_Objective-C
//
//  Created by inaba masaya on 2015/11/19.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDataEntity.h"

@interface RankingModel : NSObject

@property NSMutableArray<AppDataEntity *> *rankingAppDataEntities;

// データを取得してentityにセットする
- (void)receiveRankingData;

@end
