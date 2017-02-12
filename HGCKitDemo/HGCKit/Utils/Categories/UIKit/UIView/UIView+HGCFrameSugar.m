//
//  UIView+HGCFrameSugar.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/10/19.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "UIView+HGCFrameSugar.h"

@implementation UIView (HGCFrameSugar)

- (void)setFrame_x:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)frame_x {
    return self.frame.origin.x;
}

- (void)setFrame_y:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)frame_y {
    return self.frame.origin.y;
}

- (CGPoint)frame_origin {
    return self.frame.origin;
}

- (void)setFrame_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin.x = origin.x;
    frame.origin.y = origin.y;
    self.frame = frame;
}

- (void)setFrame_centerX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)frame_centerX {
    return self.center.x;
}

- (void)setFrame_centerY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)frame_centerY {
    return self.center.y;
}

- (void)setFrame_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)frame_width {
    return self.frame.size.width;
}

- (void)setFrame_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)frame_height {
    return self.frame.size.height;
}

- (void)setFrame_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)frame_size {
    return self.frame.size;
}

- (void)setFrame_top:(CGFloat)top {
    self.frame = CGRectMake(self.frame_left, top, self.frame_width, self.frame_height);
}

- (CGFloat)frame_top {
    return self.frame.origin.y;
}

- (void)setFrame_bottom:(CGFloat)bottom {
    self.frame = CGRectMake(self.frame_left, bottom - self.frame_height, self.frame_width, self.frame_height);
}

- (CGFloat)frame_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setFrame_left:(CGFloat)left {
    self.frame = CGRectMake(left, self.frame_top, self.frame_width, self.frame_height);
}

- (CGFloat)frame_left {
    return self.frame.origin.x;
}

- (void)setFrame_right:(CGFloat)right {
    self.frame = CGRectMake(right - self.frame_width, self.frame_top, self.frame_width, self.frame_height);
}

- (CGFloat)frame_right {
    return self.frame.origin.x + self.frame.size.width;
}

@end

@implementation UIView (HGCUtils)

- (UIViewController *)hgc_viewController {
    for (UIView *next = self; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    
    return nil;
}

- (void)hgc_removeAllSubviews {
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}

- (void)hgc_addTapAction:(SEL)tapAction target:(id)target {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:tapAction];
    [self addGestureRecognizer:gesture];
}

@end
