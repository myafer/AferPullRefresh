//
//  UIScrollView+AFRefresh.h
//  AferPullRefresh
//
//  Created by 口贷网 on 16/4/29.
//  Copyright © 2016年 Afer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFRefreshHeader.h"

@interface UIScrollView (AFRefresh)

@property (strong, nonatomic) AFRefreshHeader *af_header;
@property (strong, nonatomic) AFRefreshHeader *af_footer;



@end
