//
//  UINavigationBar+alpha.m
//  IHK
//
//  Created by 郑文明 on 15/7/23.
//  Copyright (c) 2015年 郑文明. All rights reserved.
//

#import "UINavigationBar+alpha.h"
#import <objc/runtime.h>

static char overlayKey;
static char emptyImageKey;
static char lineKey;

@implementation UINavigationBar (alpha)

- (UIView *)overlay
{
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)emptyImage
{
    return objc_getAssociatedObject(self, &emptyImageKey);
}

- (void)setEmptyImage:(UIImage *)image
{
    objc_setAssociatedObject(self, &emptyImageKey, image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)line{
    return objc_getAssociatedObject(self, &lineKey);
}
- (void)setLine:(UIView *)line{
    objc_setAssociatedObject(self, &lineKey, line, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIColor *)wm_getBackgroundColor{
    if (self.overlay) {
        return self.overlay.backgroundColor;
    }
    return nil;
}
- (void)wm_setBackgroundColor:(UIColor *)backgroundColor
{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kNavbarHeight)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.layer.zPosition = 999;
        [self.subviews.firstObject addSubview:self.overlay];
    }
    if (backgroundColor==[UIColor clearColor]) {
        //判断如果是设置clearColor，说明想让导航栏透明，那么直接去除底部黑线
        [self setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[[UIImage alloc] init]];
    }else{
        [self setShadowImage:nil];
//        [self wm_reset];
    }
    self.overlay.backgroundColor = backgroundColor;
}

- (void)wm_setTranslationY:(CGFloat)translationY
{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (void)wm_setContentAlpha:(CGFloat)alpha
{
    if (!self.overlay) {
        [self wm_setBackgroundColor:self.barTintColor];
    }
    [self setAlpha:alpha forSubviewsOfView:self];
    if (alpha == 1) {
        if (!self.emptyImage) {
            self.emptyImage = [UIImage new];
        }
        self.backIndicatorImage = self.emptyImage;
    }
}

- (void)setAlpha:(CGFloat)alpha forSubviewsOfView:(UIView *)view
{
    for (UIView *subview in view.subviews) {
        if (subview == self.overlay) {
            continue;
        }
        subview.alpha = alpha;
        [self setAlpha:alpha forSubviewsOfView:subview];
    }
}

- (void)wm_reset
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self setShadowImage:nil];
    [self.overlay removeFromSuperview];
    self.overlay = nil;
}

@end

