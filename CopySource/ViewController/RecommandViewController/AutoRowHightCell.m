//
//  AutoRowHightCell.m
//  CopySource
//
//  Created by zhengwenming on 2018/3/6.
//  Copyright © 2018年 zhengwenming. All rights reserved.
//

#import "AutoRowHightCell.h"

@implementation AutoRowHightCell
-(void)setInfoDic:(NSDictionary *)infoDic{
    _infoDic = infoDic;
    self.titleLabel.text = infoDic[@"title"];
    self.descLabel.text = infoDic[@"desc"];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
