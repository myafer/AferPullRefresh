//
//  ExampleTableViewController.m
//  AferPullRefresh
//
//  Created by 口贷网 on 16/4/29.
//  Copyright © 2016年 Afer. All rights reserved.
//

#import "ExampleTableViewController.h"
#import "UIScrollView+AFRefresh.h"

@implementation ExampleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.af_header = [AFRefreshHeader headerWithRefreshBlock:^{
        
    }];
}

@end
