//
//  RankingDataAPIManager.h
//  MVCSample_Objective-C
//
//  Created by inaba masaya on 2015/11/19.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RankingDataAPIManager : NSObject

- (void)loadAppStoreRankingData:(void (^)(NSArray *rankingData))block;

@end
