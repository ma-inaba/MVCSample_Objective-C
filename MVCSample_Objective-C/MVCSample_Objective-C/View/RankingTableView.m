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
    
    // KVO監視を始める
    [[ModelLocator sharedInstance].rankingModel addObserver:self forKeyPath:@"rankingAppDataEntities" options:0 context:nil];
    [self refreshData];
}

- (void)dealloc {
    
    // KVO監視を解除する
    [[ModelLocator sharedInstance].rankingModel removeObserver:self forKeyPath:@"rankingAppDataEntities"];
}

// データを取得する
- (void)refreshData {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [[ModelLocator sharedInstance].rankingModel receiveRankingData];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"rankingAppDataEntities"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self reloadData];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        });
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
