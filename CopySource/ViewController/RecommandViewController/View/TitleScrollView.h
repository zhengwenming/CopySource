//
//  TitleScrollView.h
//  CopySource
//
//  Created by zhengwenming on 2018/3/6.
//  Copyright © 2018年 zhengwenming. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TitleScrollView;
@protocol TitleIndexDelegate <NSObject>

- (void)onSelected:(TitleScrollView *)titleSV index:(NSInteger )index;

@end
@interface TitleScrollView : UIScrollView
@property(nonatomic,weak) id <TitleIndexDelegate> delegate;
-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;
@property(nonatomic,strong)UIButton *seletcedBtn;
-(void)setIndexSelected:(NSInteger )selectedIndex;
@end
