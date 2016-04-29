//
//  AFRefreshHeader.m
//  AferPullRefresh
//
//  Created by 口贷网 on 16/4/29.
//  Copyright © 2016年 Afer. All rights reserved.
//

#import "AFRefreshHeader.h"
#import "UIView+FrameExt.h"

#define Header_Height 54.0

@implementation AFRefreshHeader

+ (instancetype)headerWithRefreshBlock:(RefreshBlock)refreshBlock {
    AFRefreshHeader *header = [[self alloc] init];
    header.refreshBlock = refreshBlock;
    return header;
}

- (void)setup {
    [super setup];
    self.height = Header_Height;
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change {
    [super scrollViewContentOffsetDidChange:change];
    
    if (self.state == RefreshStateRefreshing) {
        if (self.window == nil) {
            return;
        }
        
        
         
    }
    

    if (self.scrollView.contentOffset.y < - Header_Height) {
        
        
        CGFloat top = self.scrollViewOriginalInset.top + self.height;
        
        UIEdgeInsets inset = self.scrollView.contentInset;
        inset.top = top;
        self.scrollView.contentInset = inset;
        
        self.scrollView.contentOffset = CGPointMake(0, - top);
        
    } else {
        NSLog(@"%lf", self.scrollView.contentOffset.y);
    }


}



@end
