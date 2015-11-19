//
//  RankingTableView.h
//  MVCSample_Objective-C
//
//  Created by inaba masaya on 2015/11/19.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelLocator.h"

@protocol RankingTableViewDelegate <NSObject>

- (void)didSelectRowWithAppDataEntity:(AppDataEntity *)appDataEntity;

@end

@interface RankingTableView : UITableView
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, assign) id<RankingTableViewDelegate> rankingTableViewDelegate;

@end
