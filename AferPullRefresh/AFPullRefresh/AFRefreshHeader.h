//
//  AFRefreshHeader.h
//  AferPullRefresh
//
//  Created by 口贷网 on 16/4/29.
//  Copyright © 2016年 Afer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFRefreshBase.h"



@interface AFRefreshHeader : AFRefreshBase
+ (instancetype)headerWithRefreshBlock:(RefreshBlock)refreshBlock;
@end
