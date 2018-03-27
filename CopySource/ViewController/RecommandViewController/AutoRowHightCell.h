//
//  AutoRowHightCell.h
//  CopySource
//
//  Created by zhengwenming on 2018/3/6.
//  Copyright © 2018年 zhengwenming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoRowHightCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property(nonatomic,strong)NSDictionary *infoDic;
@end
