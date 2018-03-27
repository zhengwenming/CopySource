//
//  TitleScrollView.m
//  CopySource
//
//  Created by zhengwenming on 2018/3/6.
//  Copyright © 2018年 zhengwenming. All rights reserved.
//

#import "TitleScrollView.h"
@interface TitleScrollView()<UIScrollViewDelegate>

@end
@implementation TitleScrollView


-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray{
    if (self=[super initWithFrame:frame]) {
        for (NSDictionary *eachDic in titleArray) {
            NSInteger index = [titleArray indexOfObject:eachDic];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(20+index*85, 0, 85, 85);
            btn.tag = 100+index;
            btn.titleLabel.font = [UIFont systemFontOfSize:9];
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -78, -60, 0)];
            [btn setTitle:eachDic[@"title"] forState:UIControlStateNormal];
            [btn setTitle:eachDic[@"title"] forState:UIControlStateSelected];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
            [btn setImage:[UIImage imageNamed:eachDic[@"uImage"]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:eachDic[@"sImage"]] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(didSeletcedBtnIndex:) forControlEvents:UIControlEventTouchUpInside];
            if (index==0) {
                btn.selected = YES;
                self.seletcedBtn = btn;
            }
            self.backgroundColor = [UIColor lightGrayColor];
            [self addSubview:btn];
        }
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.contentSize = CGSizeMake(85*(titleArray.count), frame.size.height);
    }
    return self;
}
-(void)didSeletcedBtnIndex:(UIButton *)sender{
    if (self.seletcedBtn==sender) {
        return;
    }else{
        self.seletcedBtn.selected= NO;
        sender.selected = YES;
        self.seletcedBtn = sender;
    }
    if (self.delegate&&[self.delegate respondsToSelector:@selector(onSelected:index:)]) {
        [self.delegate onSelected:self index:(self.seletcedBtn.tag-100)];
    }
}
-(void)setIndexSelected:(NSInteger )selectedIndex{
    UIButton * sbtn = (UIButton *)[self viewWithTag:selectedIndex+100];
        if (self.seletcedBtn==sbtn) {
            return;
        }else{
            self.seletcedBtn.selected= NO;
            sbtn.selected = YES;
            self.seletcedBtn = sbtn;
        }
}

@end
