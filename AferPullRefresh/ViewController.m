//
//  ViewController.m
//  AferPullRefresh
//
//  Created by 口贷网 on 15/8/3.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+AferPullLoad.h"
#import "UIScrollView+PullLoad.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, AferPullDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _table.backgroundColor = [UIColor grayColor];
    _table.pulldelegatee = self;
    
}

//- (void)scrollView:(UIScrollView *)scrollView loadWithState:(LoadState)state {
//    
//}

- (void)scrollView:(UIScrollView *)scrollView loadWithState:(AferLoadState)state {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    return cell;
}



@end
