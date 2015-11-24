//
//  RankingTableView.m
//  MVCSample_Objective-C
//
//  Created by inaba masaya on 2015/11/19.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

#import "RankingTableView.h"

@implementation RankingTableView

- (void)awakeFromNib {
    
    self.delegate = self;
    self.dataSource = self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.rankingTableViewDelegate respondsToSelector:@selector(didSelectRowWithAppDataEntity:)]) {
        AppDataEntity *entity = [[ModelLocator sharedInstance].rankingModel.rankingAppDataEntities objectAtIndex:indexPath.row];
        [self.rankingTableViewDelegate didSelectRowWithAppDataEntity:entity];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[ModelLocator sharedInstance].rankingModel.rankingAppDataEntities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }

    AppDataEntity *entity = [[ModelLocator sharedInstance].rankingModel.rankingAppDataEntities objectAtIndex:indexPath.row];
    cell.textLabel.text = entity.appTitle;
    return cell;
}

@end
