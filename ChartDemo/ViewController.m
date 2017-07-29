//
//  ViewController.m
//  ChartDemo
//
//  Created by 利施科技 on 2017/7/29.
//  Copyright © 2017年 lishiscience. All rights reserved.
//

#import "ViewController.h"
#import "CustomChart.h"

@interface ViewController ()
@property (nonatomic ,strong)CustomChart *chartView;
// 画表
@property (nonatomic, strong) NSMutableArray *showDataArray;
@end

@implementation ViewController
- (NSMutableArray *)showDataArray{
    if (_showDataArray == nil) {
        _showDataArray = [NSMutableArray array];
    }
    return _showDataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 两行
    for (int i = 0; i < 7; i ++) {
        NSMutableArray *array = [NSMutableArray array];
        
        [array addObject:[NSString stringWithFormat:@"星期%d",i + 1]];
        for (int j = 1 ;j < 2; j++) {
            [array addObject:[NSString stringWithFormat:@"%d",j * 10]];
        }
        [self.showDataArray addObject:array];
        
    }
     
    //三行
//    for (int i = 0; i < 7; i ++) {
//        NSMutableArray *array = [NSMutableArray array];
//        
//        [array addObject:[NSString stringWithFormat:@"星期%d",i + 1]];
//        for (int j = 1 ;j < 3; j++) {
//            [array addObject:[NSString stringWithFormat:@"%d",j * 10]];
//        }
//        [self.showDataArray addObject:array];
//        
//    }
    
    [self createChartView];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)createChartView
{
    self.chartView = [[CustomChart alloc] initWithFrame:CGRectMake(0, 200, WIDTH, HEIGHT - 200 - 50)];
    
     //两行
     NSArray *headerArr = @[@"星期", @"人数"];
     NSArray *aWeifhtArr = @[@(0.3),@(0.7)];
     
    
    //三行
//    NSArray *headerArr = @[@"星期", @"人数",@"第三列"];
//    NSArray *aWeifhtArr = @[@(0.3),@(0.3),@(0.4)];
    
    NSDictionary *option = @{
                             CHART_OPTION_CELL_BACKGROUND : [UIColor clearColor],
                             CHART_OPTION_CELL_BOARDCOLOR : [UIColor clearColor],
                             CHART_OPTION_CELL_BOARDWIDTH : @(0),
                             CHART_OPTION_CELL_COLOR : UIColorFromRGB(0x333333, 1.0),
                             CHART_OPTION_CELL_FONT : @(14),
                             CHART_OPTION_CHARTHEADER_BACKGROUND : UIColorFromRGB(0xefefef, 1.0),
                             CHART_OPTION_CHARTHEADER_COLOR : UIColorFromRGB(0x333333, 1.0),
                             CHART_OPTION_CHARTHEADER_FONT : @(12),
                             CHART_OPTION_CHARTHEADER_HEIGHT : @(40),
                             CHART_OPTION_CELL_HEIGHT :  @(40),
                             CHART_OPTION_ODDNUM_BACKGROUND : UIColorFromRGB(0xf6f6f6, 1.0),
                             CHART_OPTION_EVENNUM_BACKGROUND : [UIColor whiteColor],
                             CHART_OPTION_TABLEVIEW_BACKGROUND : DEFAULT_BackgroundView_COLOR
                             };
    
    [self.chartView setHeater:headerArr WithWeight:aWeifhtArr WithOption:option WithShowData:self.showDataArray];
    
    self.chartView.layer.borderWidth = KSeparatorLineHeight;
    self.chartView.layer.borderColor = LineColor.CGColor;
    
    [self.view addSubview:self.chartView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
