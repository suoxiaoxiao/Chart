//
//  CustomChart.m
//  ChartDome
//
//  Created by 索晓晓 on 15/12/7.
//  Copyright © 2015年 索晓晓. All rights reserved.
//

#import "CustomChart.h"
#import "ChartTableViewCell.h"

@interface CustomChart ()<UITableViewDelegate , UITableViewDataSource>


//外界传过来的表头信息
@property (nonatomic ,strong)NSMutableArray *chartDataArr;


//宽度的数据
@property (nonatomic ,strong)NSMutableArray *weightArr;

//数据的设置
@property (nonatomic ,strong)NSDictionary *setOptionDict;



@property (nonatomic , assign)CGFloat headerHeight;

@end

@implementation CustomChart

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (NSMutableArray *)showDataArr
{
    if (_showDataArr == nil) {
        
        _showDataArr = [NSMutableArray array];
    }
    return  _showDataArr;
}

- (NSMutableArray *)chartDataArr
{
    if (_chartDataArr == nil) {
        
        _chartDataArr = [NSMutableArray array];
    }
    return _chartDataArr;
}

- (void)createTableVeiw
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [[self.setOptionDict objectForKey:CHART_OPTION_CHARTHEADER_HEIGHT] integerValue], self.frame.size.width, self.frame.size.height - [[self.setOptionDict objectForKey:CHART_OPTION_CHARTHEADER_HEIGHT] integerValue]) style:UITableViewStylePlain];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, [[self.setOptionDict objectForKey:CHART_OPTION_CELL_BOARDWIDTH] floatValue] * 1, 0);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [self.setOptionDict objectForKey:CHART_OPTION_TABLEVIEW_BACKGROUND] == nil ? [UIColor whiteColor] : [self.setOptionDict objectForKey:CHART_OPTION_TABLEVIEW_BACKGROUND] ;
    [self.tableView registerClass:[ChartTableViewCell class] forCellReuseIdentifier:CHART_OPTION_TABLEVIEW_ID];
    [self addSubview:self.tableView];
}

- (void)setHeater:(NSArray *)headerArr WithWeight:(NSArray *)aWeight WithOption:(NSDictionary *)aOpeion WithShowData:(NSArray *)showDataArr
{
    self.showDataArr = [NSMutableArray arrayWithArray:showDataArr];
    
    self.chartDataArr = [NSMutableArray arrayWithArray:headerArr];
    
    self.weightArr = [NSMutableArray arrayWithArray:aWeight];
    
    self.setOptionDict = [NSDictionary dictionaryWithDictionary:aOpeion];
    
    ChartTableViewCell *headerView = [[ChartTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CHART_OPTION_TABLEVIEW_HEADER_ID];
    
    [headerView setModelArr:self.chartDataArr WithOption:self.setOptionDict WithWeightArray:self.weightArr WithType:ChartTableViewCellTypeHeaderChart];
    
    headerView.frame = CGRectMake(0, 0, self.frame.size.width, [[self.setOptionDict objectForKey:CHART_OPTION_CHARTHEADER_HEIGHT] integerValue]);
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, headerView.frame.size.height - KSeparatorLineHeight, self.frame.size.width, KSeparatorLineHeight)];
    
    line.backgroundColor = LineColor;
    
    [headerView addSubview:line];
    
    [self addSubview:headerView];
    
    [self createTableVeiw];
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.showDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ChartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CHART_OPTION_TABLEVIEW_ID];
    
    [cell setModelArr:self.showDataArr[indexPath.row] WithOption:self.setOptionDict WithWeightArray:self.weightArr WithType:ChartTableViewCellTypeSubChart];
    
    UIView *selView = [[UIView alloc] initWithFrame:cell.bounds];
    
    UIColor *color = [self.setOptionDict objectForKey:CHART_OPTION_CELL_SELECTEDCOLOR];
    
    if (color == nil || [color isKindOfClass:[NSNull class]]) {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else{
        
        selView.backgroundColor = color;
        
        cell.selectedBackgroundView = selView;
    }
    
    if (indexPath.row % 2) {//奇数
        
        cell.backgroundColor = [self.setOptionDict objectForKey:CHART_OPTION_ODDNUM_BACKGROUND];
        
    }else{//偶数
        
        cell.backgroundColor = [self.setOptionDict objectForKey:CHART_OPTION_EVENNUM_BACKGROUND];
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[self.setOptionDict objectForKey:CHART_OPTION_CELL_HEIGHT] integerValue];
}


@end
