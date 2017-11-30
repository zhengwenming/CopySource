//
//  UIBarButtonItem+addition.m
//  TongXueBao
//
//  Created by 郑文明 on 16/10/19.
//  Copyright © 2016年 郑文明. All rights reserved.
//
#import "UIView+Extension.h"

@implementation ItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    UINavigationBar *navBar = nil;
    UIView *aView = self.superview;
    while (aView) {
        if ([aView isKindOfClass:[UINavigationBar class]]) {
            navBar = (UINavigationBar *)aView;
            break;
        }
        aView = aView.superview;
    }
    UINavigationItem * navItem =   (UINavigationItem *)navBar.items.lastObject;
    UIBarButtonItem *leftItem = navItem.leftBarButtonItem;
    UIBarButtonItem *rightItem = navItem.rightBarButtonItem;

    ///左边按钮中的btn一般不需要重新布局
    if (leftItem) {//左边按钮
        ItemView *leftItemView = leftItem.customView;
        if ([leftItemView isKindOfClass:self.class]) {
            //如果开发者需要修改左边的item布局，可以在此添加代码，修复btn的frame
        }
    }
    ///针对右边的item，在此重新布局一次，
    if (rightItem) {//右边按钮
        ItemView *rightItemView = rightItem.customView;
        if ([rightItemView isKindOfClass:self.class]) {
            rightItemView.btn.x = rightItemView.width -rightItemView.btn.width-0;
        }
    }
   
}



@end

#import "UIBarButtonItem+addition.h"

@implementation UIBarButtonItem (addition)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon
                         highIcon:(NSString *)highIcon
                           target:(id)target
                           action:(SEL)action {
    return  [self.class itemWithIcon:icon highIcon:highIcon title:nil target:target action:action];
}

+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon
                         highIcon:(NSString *)highIcon
                            title:(NSString *)title
                           target:(id)target
                           action:(SEL)action {
    ItemView *customView = [[ItemView alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [customView addGestureRecognizer:tap];
    customView.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    customView.btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    if (icon) {
        [customView.btn setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    }
    if (highIcon) {
        [customView.btn setBackgroundImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    }
    customView.btn.frame = CGRectMake(0, 0, customView.btn.currentBackgroundImage.size.width, customView.btn.currentBackgroundImage.size.height);
    customView.btn.centerY = customView.centerY;
    [customView.btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:customView.btn];
    if (title.length) {
        customView.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(customView.btn.frame) + 5, CGRectGetMinY(customView.btn.frame), 80, 44)];
        customView.titleLabel.centerY = customView.btn.centerY;
        customView.titleLabel.text = title;
        customView.titleLabel.textColor = [UIColor whiteColor];
        customView.titleLabel.userInteractionEnabled = YES;
        [customView.titleLabel addGestureRecognizer:tap];
        [customView addSubview:customView.titleLabel];
    }
    
    return  [[UIBarButtonItem alloc] initWithCustomView:customView];
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title
                            target:(id)target
                            action:(SEL)action {
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [btn setTitleColor:kTintColor forState:UIControlStateNormal];
    [btn setTitleColor:kTintColor forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -15);
    btn.frame = CGRectMake(0, 0, title.length * 18, 30);
    return  [[UIBarButtonItem alloc] initWithCustomView:btn];
}


@end
