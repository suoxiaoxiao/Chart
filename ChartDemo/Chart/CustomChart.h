//
//  CustomChart.h
//  ChartDome
//
//  Created by 索晓晓 on 15/12/7.
//  Copyright © 2015年 索晓晓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChartPublicGlobalKeys.h"

@interface CustomChart : UIView


@property (nonatomic ,strong)UITableView *tableView;

//要展示的数据
@property (nonatomic ,strong)NSMutableArray *showDataArr;

/**
 *
 * @param headerArr 表格头部数据  要展示的数据的key
 * @param aWeight 表格宽度分配
 * @param aOption 表格数据设置
 * @param showDataArr 表格内部展示的数据 是一个字典数组
 *
 */
- (void)setHeater:(NSArray *)headerArr WithWeight:(NSArray *)aWeight WithOption:(NSDictionary *)aOpeion WithShowData:(NSArray *)showDataArr;

@end
