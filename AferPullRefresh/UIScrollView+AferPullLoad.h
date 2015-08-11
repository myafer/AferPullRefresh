//
//  UIScrollView+AferPullLoad.h
//  AferPullRefresh
//
//  Created by 口贷网 on 15/8/3.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import <UIKit/UIKit.h>

//下拉上拉加载状态
typedef enum {
    AferPullUpLoadState,    //上拉加载状态
    AferPullDownLoadState,  //下拉加载状态
}AferLoadState;

//拖拽刷新代理
@protocol AferPullDelegate <NSObject>
@optional
- (void)bb;
@end

@interface UIScrollView (AferPullLoad)
@property (assign, nonatomic) id <AferPullDelegate> pulldelegatee;

@end
