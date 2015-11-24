//
//  RankingViewController.m
//  MVCSample_Objective-C
//
//  Created by inaba masaya on 2015/11/19.
//  Copyright © 2015年 inaba masaya. All rights reserved.
//

#import "RankingViewController.h"
#import "RankingTableView.h"

@interface RankingViewController ()
@property (weak, nonatomic) IBOutlet RankingTableView *rankingTableView;

@end

@implementation RankingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.rankingTableView.rankingTableViewDelegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    // KVO監視を始める
    [[ModelLocator sharedInstance].rankingModel addObserver:self forKeyPath:@"rankingAppDataEntities" options:0 context:nil];
    [self refreshData];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
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
        __weak __typeof__(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.rankingTableView reloadData];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        });
    }
}

- (void)didSelectRowWithAppDataEntity:(AppDataEntity *)appDataEntity {
    
    NSLog(@"選択されました %@",appDataEntity);
}

@end
