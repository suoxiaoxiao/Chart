//
//  ChartTableViewCell.m
//  ChartDome
//
//  Created by 索晓晓 on 15/12/7.
//  Copyright © 2015年 索晓晓. All rights reserved.
//

#import "ChartTableViewCell.h"
#import "ChartLabel.h"

#define DefaultTitleColor [UIColor blackColor]
#define DefaultBackGroupColor [UIColor whiteColor]
#define DefaultTitleFont (14)
#define DefaultBorderColor [UIColor grayColor]
#define DefaultBorderWeight (1)
#define DefauleFirstTitleColor [UIColor grayColor]


@interface ChartTableViewCell ()

@property (nonatomic ,strong)NSMutableArray *weightArray;

@property (nonatomic ,strong)NSMutableArray *labelArray;

@property (nonatomic , assign)CGFloat borderHeight;

@property (nonatomic , assign)ChartTableViewCellType type;

@end

@implementation ChartTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.weightArray = [NSMutableArray array];
        
        self.labelArray = [NSMutableArray array];
    }
    return self;
}

- (void)setModelArr:(NSArray *)array WithOption:(NSDictionary *)option WithWeightArray:(NSArray *)weightArr WithType:(ChartTableViewCellType)type
{
    self.weightArray = [NSMutableArray arrayWithArray:weightArr];
    
    if (self.labelArray && self.labelArray.count) {
        
        [self.labelArray removeAllObjects];
    }
    self.type = type;
    
    BOOL isSubCell = type == ChartTableViewCellTypeSubChart;//如果是cell视图所需要的表格
    
    for (UIView *subView in self.contentView.subviews) {
        
        if ([subView isKindOfClass:[ChartLabel class]]) {
            
            ChartLabel *label = (ChartLabel *)subView;
            
            [label removeFromSuperview];
        }
    }
    
    for (int i = 0; i < array.count; i++) {
        
        //创建数据
        //cell 的文字颜色
        UIColor *cellTitleColor;
        cellTitleColor= [option objectForKey:isSubCell ? CHART_OPTION_CELL_COLOR : CHART_OPTION_CHARTHEADER_COLOR];
        
        if (cellTitleColor == nil || [cellTitleColor isKindOfClass:[NSNull class]] ) {
            
            cellTitleColor = DefaultTitleColor;
        }
       
        
        UIColor *firstCellTitleColor;
        firstCellTitleColor= [option objectForKey:isSubCell ? CHART_OPTION_FIRST_CELL_COLOT : CHART_OPTION_CHARTHEADER_COLOR];
        
        if (firstCellTitleColor == nil || [firstCellTitleColor isKindOfClass:[NSNull class]] ) {
            
            firstCellTitleColor = cellTitleColor;
        }
        
        
        //cell 的文字大小
        UIFont *titleFont;
        CGFloat titleSize = 0;
        
        titleSize = [[option objectForKey:isSubCell ? CHART_OPTION_CELL_FONT : CHART_OPTION_CHARTHEADER_FONT] integerValue];
        
        if (titleSize == 0) {
            titleFont = [UIFont systemFontOfSize:DefaultTitleFont];
        }else{
            titleFont = [UIFont systemFontOfSize:titleSize];
        }
        
        //cell 的背景颜色
        UIColor *backgroupColor;
        backgroupColor = [option objectForKey: isSubCell ? CHART_OPTION_CELL_BACKGROUND : CHART_OPTION_CHARTHEADER_BACKGROUND];
        if (backgroupColor == nil || [backgroupColor isKindOfClass:[NSNull class]]) {
            backgroupColor = DefaultBackGroupColor;
            
        }
        //cell 的边框颜色
        UIColor *borderColor;
        borderColor = [option objectForKey:CHART_OPTION_CELL_BOARDCOLOR];
        if (borderColor == nil || [borderColor isKindOfClass:[NSNull class]]) {
            borderColor = DefaultBorderColor;
        }
        
        //cell 的边框宽度
        CGFloat borderSize = 0;
        borderSize = [[option objectForKey:CHART_OPTION_CELL_BOARDWIDTH] floatValue];
        if (borderSize == 0 ) {
            
            borderSize = DefaultBorderWeight;
            
        }
        self.borderHeight = borderSize;
        
        ChartLabel *label = [[ChartLabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = backgroupColor;
        label.font = titleFont;
        label.textColor = i == 0 ? firstCellTitleColor : cellTitleColor;
        label.text = array[i];
        label.numberOfLines = 1;
        label.adjustsFontSizeToFitWidth = YES;
        label.layer.borderColor = borderColor.CGColor;
        label.layer.borderWidth = borderSize;
        
        [self.contentView addSubview:label];
        
        [self.labelArray addObject:label];
    }
    
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    CGFloat labelX = 0;
    
    for (int i = 0; i < self.labelArray.count; i++) {
        
        ChartLabel *label = self.labelArray[i];
        
        CGFloat width = [self.weightArray[i] floatValue] * (self.frame.size.width + self.borderHeight * (self.labelArray.count - 1));
        
        label.frame = CGRectMake(labelX, self.type == ChartTableViewCellTypeHeaderChart ? 0 : 0, width, self.frame.size.height + 1 * self.borderHeight);
        
        labelX += width - self.borderHeight;
    }
    [super layoutSubviews];
}

@end
