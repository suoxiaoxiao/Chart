//
//  ChartTableViewCell.h
//  ChartDome
//
//  Created by 索晓晓 on 15/12/7.
//  Copyright © 2015年 索晓晓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChartPublicGlobalKeys.h"

typedef enum{
    
    ChartTableViewCellTypeHeaderChart,
    ChartTableViewCellTypeSubChart,
    
}ChartTableViewCellType;

@interface ChartTableViewCell : UITableViewCell

- (void)setModelArr:(NSArray *)array WithOption:(NSDictionary *)option WithWeightArray:(NSArray *)weightArr WithType:(ChartTableViewCellType)type;

@end
