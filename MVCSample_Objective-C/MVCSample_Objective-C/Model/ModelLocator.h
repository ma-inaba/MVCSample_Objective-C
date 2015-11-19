//
//  ModelLocator.h
//  MVCSample_Objective-C
//
//  Created by inaba masaya on 2015/11/19.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RankingModel.h"

@interface ModelLocator : NSObject

+ (ModelLocator *)sharedInstance;
- (id)init UNAVAILABLE_ATTRIBUTE;

@property RankingModel *rankingModel;

@end
