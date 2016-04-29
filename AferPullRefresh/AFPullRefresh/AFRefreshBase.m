//
//  AFRefreshBase.m
//  AferPullRefresh
//
//  Created by 口贷网 on 16/4/29.
//  Copyright © 2016年 Afer. All rights reserved.
//

#define AFRefresh_Scr_ContentOffset_KeyPath @"contentOffset"
#define AFRefresh_Scr_ContentSize_KeyPath   @"contentSize"
#define AFRefresh_Scr_State_KeyPath         @"state"

#import "AFRefreshBase.h"
#import "UIView+FrameExt.h"

@interface AFRefreshBase()
@property (strong, nonatomic) UIPanGestureRecognizer *pan;
@end

@implementation AFRefreshBase

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.state = RefreshStateNormal;
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)setup {
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview && ![newSuperview isKindOfClass:[UIScrollView class]]) {
        return;
    }
    [self removeObservers];
    if (newSuperview) {
        self.width = newSuperview.width;
        self.x = 0.0;
        
        _scrollView = (UIScrollView *)newSuperview;
        _scrollView.alwaysBounceVertical = YES;
        _scrollViewOriginalInset = _scrollView.contentInset;
        [self addObservers];
    }
}

#pragma mark ------- 添加 scr 的监听

- (void)addObservers {
    NSKeyValueObservingOptions oboptions = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.scrollView addObserver:self forKeyPath:AFRefresh_Scr_ContentOffset_KeyPath options:oboptions context:nil];
    [self.scrollView addObserver:self forKeyPath:AFRefresh_Scr_ContentSize_KeyPath options:oboptions context:nil];
    [self.pan addObserver:self forKeyPath:AFRefresh_Scr_State_KeyPath options:oboptions context:nil];
    self.pan = self.scrollView.panGestureRecognizer;
}

- (void)removeObservers {
    [self.superview removeObserver:self forKeyPath:AFRefresh_Scr_ContentOffset_KeyPath];
    [self.superview removeObserver:self forKeyPath:AFRefresh_Scr_ContentSize_KeyPath];
    [self.pan removeObserver:self forKeyPath:AFRefresh_Scr_State_KeyPath];
    self.pan = nil;
}

#pragma mark ------- 监听实现的方法

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change{}
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change{}
- (void)scrollViewPanStateDidChange:(NSDictionary *)change{}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (!self.userInteractionEnabled) {
        return;
    }
    if ([keyPath isEqualToString:AFRefresh_Scr_ContentSize_KeyPath]) {
        [self scrollViewContentSizeDidChange:change];
    }
    if (self.hidden) {
        return;
    }
    if ([keyPath isEqualToString:AFRefresh_Scr_ContentOffset_KeyPath]) {
        [self scrollViewContentOffsetDidChange:change];
    } else if ([keyPath isEqualToString:AFRefresh_Scr_State_KeyPath]) {
        [self scrollViewPanStateDidChange:change];
    }
}












@end
