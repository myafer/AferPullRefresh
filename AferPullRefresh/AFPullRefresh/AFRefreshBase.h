//
//  AFRefreshBase.h
//  AferPullRefresh
//
//  Created by 口贷网 on 16/4/29.
//  Copyright © 2016年 Afer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    RefreshStateNormal,         // 普通状态
    RefreshStatePulling,        // 拉取状态
    RefreshStateRefreshing,     // 刷新中状态
    RefreshStateWillRefresh,    // 即将刷新状态
    RefreshStateNoMoreData      // 没有更多的数据
} RefreshState;

typedef void (^RefreshBlock)();

@interface AFRefreshBase : UIView {
    UIEdgeInsets _scrollViewOriginalInset;
    __weak UIScrollView *_scrollView;
}

@property (nonatomic, copy) RefreshBlock refreshBlock;
@property (nonatomic, assign) RefreshState state;


- (void)beginRefreshing;
- (void)endRefreshing;
- (void)isRefreshing;

@property (assign, nonatomic, readonly) UIEdgeInsets scrollViewOriginalInset;
@property (weak, nonatomic, readonly) UIScrollView *scrollView;

@property (assign, nonatomic) CGFloat pullingPercent;


- (void)setup;

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change;
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change;
- (void)scrollViewPanStateDidChange:(NSDictionary *)change;

@end
