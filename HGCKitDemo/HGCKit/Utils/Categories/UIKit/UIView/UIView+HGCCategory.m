//
//  UIView+HGCCategory.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/3/21.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "UIView+HGCCategory.h"
#import <objc/runtime.h>
#import "HGCMasonryWrapper.h"

static CGFloat const kHGCDefaultLineHeight = 0.5;
static NSInteger const kHGCTopLineTag = 831;
static NSInteger const kHGCBottomLineTag = 901;

@implementation UIView (HGCCategory)


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - View with Color

+ (instancetype)hgc_whiteView {
    return [self hgc_viewWithColor:[UIColor whiteColor]];
}

+ (instancetype)hgc_clearView {
    return [self hgc_viewWithColor:[UIColor clearColor]];
}

+ (instancetype)hgc_blackView {
    return [self hgc_viewWithColor:[UIColor blackColor]];
}

+ (instancetype)hgc_blackViewWithAlpha:(CGFloat)alpha {
    return [self hgc_viewWithColor:[[UIColor blackColor] colorWithAlphaComponent:alpha]];
}

+ (instancetype)hgc_purpleView {
    return [self hgc_viewWithColor:[UIColor purpleColor]];
}

+ (instancetype)hgc_redView {
    return [self hgc_viewWithColor:[UIColor redColor]];
}

+ (instancetype)hgc_blueView {
    return [self hgc_viewWithColor:[UIColor blueColor]];
}

+ (instancetype)hgc_greenView {
    return [self hgc_viewWithColor:[UIColor greenColor]];
}

+ (instancetype)hgc_viewWithColor:(UIColor *)color {
    UIView *view = [UIView new];
    view.backgroundColor = color;
    return view;
}

- (void)hgc_setBackgroundColor:(UIColor *)bgColor alpha:(CGFloat)alpha {
    self.backgroundColor = bgColor;
    if (floor(alpha) == 0) {
        self.opaque = NO;
    }
    else {
        self.opaque = YES;
    }
    self.alpha = alpha;
}

- (void)hgc_addBorderWithRadius:(CGFloat)radius
                          color:(UIColor *)color
                          width:(CGFloat)width
{
    [self hgc_addBorderWithRadius:radius color:color width:width shouldRasterize:YES];
}

- (void)hgc_addBorderWithRadius:(CGFloat)radius
                          color:(UIColor *)color
                          width:(CGFloat)width
                shouldRasterize:(BOOL)shouldRasterize
{
    if (shouldRasterize) {
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

- (void)hgc_addShadowWithColor:(UIColor *)color
                       opacity:(CGFloat)opacity
                        offset:(CGSize)offset
                        radius:(CGFloat)radius
{
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
}

- (void)hgc_removeShadow {
    self.layer.shadowColor = nil;
    self.layer.shadowOpacity = 0;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowRadius = 0;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Tap

- (UITapGestureRecognizer *)hgc_tapInSelf {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHgc_tapInSelf:(UITapGestureRecognizer *)tap {
    objc_setAssociatedObject(self, @selector(hgc_tapInSelf), tap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)())hgc_tapAction {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHgc_tapAction:(void (^)())block {
    objc_setAssociatedObject(self, @selector(hgc_tapAction), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)hgc_addTapGestureWithAction:(void (^)())block {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapInSelfAction:)];
    [self addGestureRecognizer:tap];
    [self setHgc_tapInSelf:tap];
    [self setHgc_tapAction:block];
}

- (void)_tapInSelfAction:(id)sender {
    UITapGestureRecognizer *tap = [self hgc_tapInSelf];
    tap.enabled = NO;
    void (^block)() = [self hgc_tapAction];
    !block ?: block();
    tap.enabled = YES;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Long Press

- (UILongPressGestureRecognizer *)hgc_longPressInSelf {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHgc_longPressInSelf:(UILongPressGestureRecognizer *)press {
    objc_setAssociatedObject(self, @selector(hgc_longPressInSelf), press, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)())hgc_longPressAction {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHgc_longPressAction:(void (^)())block {
    objc_setAssociatedObject(self, @selector(hgc_longPressAction), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)hgc_addLongPressGestureWithDuration:(CGFloat)duration action:(void (^)())block {
    UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(_longPressInSelfAction:)];
    press.minimumPressDuration = duration;
    [self addGestureRecognizer:press];
    [self setHgc_longPressInSelf:press];
    [self setHgc_longPressAction:block];
}

- (void)_longPressInSelfAction:(id)sender {
    // 长按手势的响应方法会在 UIGestureRecognizerStateBegan 和 UIGestureRecognizerStateEnded
    // 各响应一次
    // 注意不要设置 press.enabled 为 YES, 否则长按手势的状态会被设置为 UIGestureRecognizerStateCancelled
    
    UILongPressGestureRecognizer *press = [self hgc_longPressInSelf];
    if (press.state == UIGestureRecognizerStateBegan) {
        void (^block)() = [self hgc_longPressAction];
        !block ?: block();
    }
    else if (press.state == UIGestureRecognizerStateEnded) {
        
    }
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Top Line

- (UIView *)hgc_topLine {
    return [self viewWithTag:kHGCTopLineTag];
}

- (void)hgc_addTopLineWithColor:(UIColor *)color {
    [self hgc_addTopLineWithColor:color leading:0 trailing:0 height:kHGCDefaultLineHeight];
}

- (void)hgc_addTopLineWithColor:(UIColor *)color height:(CGFloat)height {
    [self hgc_addTopLineWithColor:color leading:0 trailing:0 height:height];
}

- (void)hgc_addTopLineWithColor:(UIColor *)color
               horizontalMargin:(CGFloat)horMargin
{
    [self hgc_addTopLineWithColor:color leading:horMargin trailing:horMargin height:kHGCDefaultLineHeight];
}

- (void)hgc_addTopLineWithColor:(UIColor *)color
               horizontalMargin:(CGFloat)horMargin
                         height:(CGFloat)height
{
    [self hgc_addTopLineWithColor:color leading:horMargin trailing:horMargin height:height];
}

- (void)hgc_addTopLineWithColor:(UIColor *)color
                        leading:(CGFloat)leading
                       trailing:(CGFloat)trailing
{
    [self hgc_addTopLineWithColor:color leading:leading trailing:trailing height:kHGCDefaultLineHeight];
}

- (void)hgc_addTopLineWithColor:(UIColor *)color
                        leading:(CGFloat)leading
                       trailing:(CGFloat)trailing
                         height:(CGFloat)height
{
    UIView *line = [UIView new];
    line.backgroundColor = color;
    line.tag = kHGCTopLineTag;
    [self addSubview:line];
    [HGCMas view:line leftMargin:leading rightMargin:trailing to:self];
    [HGCMas view:line topAligntTo:self];
    [HGCMas view:line height:height];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Bottom Line

- (UIView *)hgc_bottomLine {
    return [self viewWithTag:kHGCBottomLineTag];
}

- (void)hgc_addBottomLineWithColor:(UIColor *)color {
    [self hgc_addBottomLineWithColor:color leading:0 trailing:0 height:kHGCDefaultLineHeight];
}

- (void)hgc_addBottomLineWithColor:(UIColor *)color height:(CGFloat)height {
    [self hgc_addBottomLineWithColor:color leading:0 trailing:0 height:height];
}

- (void)hgc_addBottomLineWithColor:(UIColor *)color
                  horizontalMargin:(CGFloat)horMargin
{
    [self hgc_addBottomLineWithColor:color leading:horMargin trailing:horMargin height:kHGCDefaultLineHeight];
}

- (void)hgc_addBottomLineWithColor:(UIColor *)color
                  horizontalMargin:(CGFloat)horMargin
                            height:(CGFloat)height
{
    [self hgc_addBottomLineWithColor:color leading:horMargin trailing:horMargin height:height];
}

- (void)hgc_addBottomLineWithColor:(UIColor *)color
                           leading:(CGFloat)leading
                          trailing:(CGFloat)trailing
{
    [self hgc_addBottomLineWithColor:color leading:leading trailing:trailing height:kHGCDefaultLineHeight];
}

- (void)hgc_addBottomLineWithColor:(UIColor *)color
                           leading:(CGFloat)leading
                          trailing:(CGFloat)trailing
                            height:(CGFloat)height
{
    UIView *line = [UIView new];
    line.backgroundColor = color;
    line.tag = kHGCBottomLineTag;
    [self addSubview:line];
    [HGCMas view:line leftMargin:leading rightMargin:trailing to:self];
    [HGCMas view:line bottomAligntTo:self];
    [HGCMas view:line height:height];
}

@end
