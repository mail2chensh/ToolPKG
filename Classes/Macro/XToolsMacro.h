//
//  XToolsMacro.h
//  XToolsDemo
//
//  Created by dev on 15/8/20.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#ifndef XToolsDemo_XToolsMacro_h
#define XToolsDemo_XToolsMacro_h

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define WEAKSELF typeof(self) __weak weakSelf = self;

#define RGBMAKE(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define isStringNotEmpty(X) ((X) != nil && ![(X) isEqualToString:@""])

#define AppDelegateInstance ((AppDelegate*)[UIApplication sharedApplication].delegate)




#define HEIGHT_OF_STATUS_BAR 20.0f
#define HEIGHT_OF_NAVIGATION_BAR 44.0f
#define HEIGHT_OF_X_NAVIGATION_VIEW 64.0f
#define HEIGHT_OF_SEARCH_BAR 44.0f

#define GLOBAL_LEFT_PADDING_SMALL 10.0f
#define GLOBAL_LEFT_PADDING_NORMAL 13.0f
#define GLOBAL_LEFT_PADDING_LARG 15.0f


//#define GLOBAL_FONT_SIZE_SMALL 13.0f
#define GLOBAL_FONT_SIZE_NORMAL 15.0f
#define GLOBAL_FONT_SIZE_LARG 16.0f

#define GLOBAL_FONT_COLOR_DEEP RGBMAKE(0x33, 0x33, 0x33, 1)


#define GLOBAL_CELL_HEIGHT_NORMAL 42.0f


// =============
#pragma mark - 长度值
// =============

#define LENGHT_OF_PASSWORD_MIN 6
#define LENGHT_OF_PASSWORD_MAX 16



typedef NS_ENUM(NSInteger, XSingleFieldViewType) {
    XSingleFieldViewType_SingleTextField, // 单个输入框，左侧无TitleLabel
    XSingleFieldViewType_Label, // 带Label显示
    XSingleFieldViewType_LabelWithArrow, // 带箭头图标的label
    XSingleFieldViewType_TextField, // 普通文本输入
    XSingleFieldViewType_Password // 密码输入
};

#endif
