//
//  SVandTVViewController.m
//  CopySource
//
//  Created by zhengwenming on 2018/3/6.
//  Copyright © 2018年 zhengwenming. All rights reserved.
//

#import "SVandTVViewController.h"
#import "AutoRowHightCell.h"
#import "TitleScrollView.h"
#import "UIView+Extension.h"

@interface SVandTVViewController ()<UITableViewDelegate,UITableViewDataSource,TitleIndexDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic,strong)  TitleScrollView *titleSV;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation SVandTVViewController
-(NSMutableArray *)dataSource{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray arrayWithObjects:
                       @{@"title":@"家庭医生",@"desc":@"拥有家庭医生，您可以随时就全家的健康问题进行在线咨询。",@"index":@"0"}
         ,@{@"title":@"专家问诊",@"desc":@"您可以免费或以折扣价格向爱心医疗专家进行在线问诊。您可以免费或以折扣价格向爱心医疗专家进行在线问诊。您可以免费或以折扣价格向爱心医疗专家进行在线问诊。您可以免费或以折扣价格向爱心医疗专家进行在线问诊。您可以免费或以折扣价格向爱心医疗专家进行在线问诊。您可以免费或以折扣价格向爱心医疗专家进行在线问诊。",@"index":@"1"}
         ,@{@"title":@"健康档案",@"desc":@"免费为全家人创建健康档案，爱心云健康帮您记录医疗信息。",@"index":@"2"}
         ,@{@"title":@"健康直播",@"desc":@"各路知名医疗大神手把手传授您健康诀窍。",@"index":@"3"}
         ,@{@"title":@"报告解读",@"desc":@"免费或以折扣价格为您解读检验报告单并提供专业医疗建议。免费或以折扣价格为您解读检验报告单并提供专业医疗建议。",@"index":@"4"}
         ,@{@"title":@"医院转诊",@"desc":@"您可以免费或以折扣价格向爱心医疗专家进行在线问诊。您可以免费或以折扣价格向爱心医疗专家进行在线问诊。您可以免费或以折扣价格向爱心医疗专家进行在线问诊。",@"index":@"5"}
         ,@{@"title":@"海外就医",@"desc":@"联合全球顶级优质医疗机构，为您提供最专业医学意见。",@"index":@"6"}
         ,@{@"title":@"住院手术",@"desc":@"当确定手术需求时，为您安排顶级医院的手术治疗方案。当确定手术需求时，为您安排顶级医院的手术治疗方案。当确定手术需求时，为您安排顶级医院的手术治疗方案。当确定手术需求时，为您安排顶级医院的手术治疗方案。当确定手术需求时，为您安排顶级医院的手术治疗方案。",@"index":@"7"},nil];
    }
    return _dataSource;
}
-(void)onSelected:(TitleScrollView *)titleSV index:(NSInteger)index{
    [self.myTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView==self.myTableView) {
        CGPoint gjPoint  = CGPointMake(100, kNavbarHeight+self.titleSV.frame.size.height+1);//+1很重要，+1确保关键的点在需要的位置
        CGPoint p_intable =   [self.view convertPoint:gjPoint toView:self.myTableView];
        NSIndexPath *indexPath =  [self.myTableView indexPathForRowAtPoint:p_intable];
        NSDictionary *dic = self.dataSource[indexPath.row];
        NSInteger bottomIndex = [dic[@"index"] integerValue];
        if (bottomIndex!=self.titleSV.seletcedBtn.tag-100) {
            [self.titleSV setContentOffset:CGPointMake(85*bottomIndex, 0) animated:YES];            
            [self.titleSV setIndexSelected:bottomIndex];
        }
    }
}
-(TitleScrollView *)titleSV{
    if (_titleSV==nil) {
        _titleSV = [[TitleScrollView alloc] initWithFrame:CGRectMake(0, kNavbarHeight, kScreenWidth, 85) titleArray:@[@{@"title":@"家庭医生",@"sImage":@"index0_s",@"uImage":@"index0_u",@"indexId":@"0"},@{@"title":@"专家问诊",@"sImage":@"index1_s",@"uImage":@"index1_u",@"indexId":@"1"},@{@"title":@"健康档案",@"sImage":@"index2_s",@"uImage":@"index2_u",@"indexId":@"2"},@{@"title":@"健康直播",@"sImage":@"index3_s",@"uImage":@"index3_u",@"indexId":@"3"},@{@"title":@"报告解读",@"sImage":@"index4_s",@"uImage":@"index4_u",@"indexId":@"4"},@{@"title":@"医院转诊",@"sImage":@"index5_s",@"uImage":@"index5_u",@"indexId":@"5"},@{@"title":@"海外就医",@"sImage":@"index6_s",@"uImage":@"index6_u",@"indexId":@"6"},@{@"title":@"住院手术",@"sImage":@"index7_s",@"uImage":@"index7_u",@"indexId":@"7"}]];
        _titleSV.delegate= self;
    }
    return _titleSV;
}
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar wm_setBackgroundColor:[UIColor redColor]];
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar wm_reset];
    [super viewWillDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"联动效果";
    [self.view addSubview:self.titleSV];
    self.myTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavbarHeight+self.titleSV.frame.size.height, kScreenWidth, kScreenHeight - kNavbarHeight-self.titleSV.frame.size.height) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView registerNib:[UINib nibWithNibName:@"AutoRowHightCell" bundle:nil] forCellReuseIdentifier:@"AutoRowHightCell"];
    self.myTableView.estimatedRowHeight = 50;
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    self.myTableView.tableFooterView = [UIView new];
    self.myTableView.tableHeaderView = [UIView new];
    self.myTableView.rowHeight = 45.f;
    if (iPhoneX) {
        self.myTableView.contentInset = UIEdgeInsetsMake(0, 0, kScreenHeight-self.titleSV.frame.size.height-kNavbarHeight-kBottomSafeHeight-kNavbarHeight, 0);
    }else{
        self.myTableView.contentInset = UIEdgeInsetsMake(0, 0, kScreenHeight-self.titleSV.frame.size.height-kNavbarHeight-kNavbarHeight, 0);
    }
    [self.view addSubview:self.myTableView ];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AutoRowHightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutoRowHightCell"];
    NSDictionary *eachDic = self.dataSource[indexPath.row];
    cell.titleLabel.text = eachDic[@"title"];
    cell.descLabel.text = eachDic[@"desc"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
