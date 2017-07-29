//
//  ChartPublicGlobalKeys.h
//  ChartDome
//
//  Created by 索晓晓 on 15/12/7.
//  Copyright © 2015年 索晓晓. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UIColorFromRGB(rgbValue,alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

#define KSeparatorLineHeight ( 1/2.0f )
#define LineColor  UIColorFromRGB(0xd9d9d9, 1.0)
#define DEFAULT_BackgroundView_COLOR UIColorFromRGB(0xefefef, 1.0)


/**小表格的文字颜色*/
extern NSString *const CHART_OPTION_CELL_COLOR;
/**小表格的背景颜色*/
extern NSString *const CHART_OPTION_CELL_BACKGROUND;
/**小表格的边框颜色*/
extern NSString *const CHART_OPTION_CELL_BOARDCOLOR;
/**小表格的边框宽度*/
extern NSString *const CHART_OPTION_CELL_BOARDWIDTH;
/**小表格的文字大小*/
extern NSString *const CHART_OPTION_CELL_FONT;
/**cell 的高度*/
extern NSString *const CHART_OPTION_CELL_HEIGHT;
/**表格的头部文字大小*/
extern NSString *const CHART_OPTION_CHARTHEADER_FONT;
/**表格的头部文字颜色*/
extern NSString *const CHART_OPTION_CHARTHEADER_COLOR;
/**表格的头部视图的背景颜色*/
extern NSString *const CHART_OPTION_CHARTHEADER_BACKGROUND;
/**表格头部的高度*/
extern NSString *const CHART_OPTION_CHARTHEADER_HEIGHT;
/**cell 的点击颜色*/
extern NSString *const CHART_OPTION_CELL_SELECTEDCOLOR;
/** cell key*/
extern NSString *const  CHART_OPTION_TABLEVIEW_ID;
/** headerKey */
extern NSString *const  CHART_OPTION_TABLEVIEW_HEADER_ID;
/**cell 的第一列文字颜色*/
extern NSString *const  CHART_OPTION_FIRST_CELL_COLOT;
/**cell奇数行背景颜色隔行*/
extern NSString *const  CHART_OPTION_ODDNUM_BACKGROUND;
/**cell偶数行背景颜色隔行*/
extern NSString *const CHART_OPTION_EVENNUM_BACKGROUND;
/**tableView背景颜色*/
extern NSString *const CHART_OPTION_TABLEVIEW_BACKGROUND;

@interface ChartPublicGlobalKeys : NSObject

@end
