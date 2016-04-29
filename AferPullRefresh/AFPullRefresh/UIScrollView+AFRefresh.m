//
//  UIScrollView+AFRefresh.m
//  AferPullRefresh
//
//  Created by 口贷网 on 16/4/29.
//  Copyright © 2016年 Afer. All rights reserved.
//

#import "UIScrollView+AFRefresh.h"
#import <objc/runtime.h>

@implementation NSObject (AFRefresh)

+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2
{
    method_exchangeImplementations(class_getInstanceMethod(self, method1), class_getInstanceMethod(self, method2));
}

+ (void)exchangeClassMethod1:(SEL)method1 method2:(SEL)method2
{
    method_exchangeImplementations(class_getClassMethod(self, method1), class_getClassMethod(self, method2));
}

@end

@implementation UIScrollView (AFRefresh)

- (AFRefreshHeader *)af_header {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAf_header:(AFRefreshHeader *)af_header {
    if (af_header != self.af_header) {
        [self.af_header removeFromSuperview];
        [self addSubview:af_header];
        
        [self willChangeValueForKey:NSStringFromSelector(@selector(af_header))];
        objc_setAssociatedObject(self, (__bridge const void *)(NSStringFromSelector(@selector(af_header))), af_header, OBJC_ASSOCIATION_RETAIN);
        [self didChangeValueForKey:NSStringFromSelector(@selector(af_header))];
    }
}

- (AFRefreshHeader *)af_footer {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAf_footer:(AFRefreshHeader *)af_footer {
    if (af_footer != self.af_footer) {
        [self.af_footer removeFromSuperview];
        [self addSubview:af_footer];
        [self willChangeValueForKey:NSStringFromSelector(@selector(af_footer))];
        objc_setAssociatedObject(self, (__bridge const void *)(NSStringFromSelector(@selector(af_footer))), af_footer, OBJC_ASSOCIATION_RETAIN);
        [self didChangeValueForKey:NSStringFromSelector(@selector(af_footer))];
    }
}


@end
