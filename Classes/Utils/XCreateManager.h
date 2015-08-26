//
//  XCreateManager.h
//  startWild
//
//  Created by dev on 15/7/29.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XCreateManager : NSObject

// 根据颜色返回图片
//+ (UIImage *)imageWithUIColor:(UIColor*)color;

// 根据颜色返回图片
+ (UIImage *)imageWithUIColor:(UIColor*)color size:(CGSize)size;

// 创建 UIImageView 对象
+ (UIImageView *)createNormalImageViewWithImageName:(NSString *)imageName;

// 创建 分割线
+ (UIView *)createSeperateLineWithFrame:(CGRect)frame;

// 创建 button 对象 (图片背景)
+ (UIButton *)createNormalButtonWithNormalImageName:(NSString*)normal highlightName:(NSString*)highlight title:(NSString*)title target:(id)target selector:(SEL)selector;

// 创建 button 对象 (颜色背景)
+ (UIButton *)createColorButtonWithFrame:(CGRect)frame normalColor:(UIColor*)normal highlightColor:(UIColor*)highlight title:(NSString*)title target:(id)target selector:(SEL)selector;

// 创建 button 对象 (颜色背景,无selector)
+ (UIButton *)createColorButtonWithFrame:(CGRect)frame normalColor:(UIColor*)normal highlightColor:(UIColor*)highlight title:(NSString*)title;

// 创建 纯文字 按钮
+ (UIButton *)createTextButtonWithFrame:(CGRect)frame text:(NSString*)text target:(id)target selector:(SEL)selector;

// 创建 纯文字 按钮（不带 selector）
+ (UIButton *)createTextButtonWithFrame:(CGRect)frame text:(NSString*)text;

// 创建 导航栏 右键（纯文字）
+ (UIButton *)createNavigationRightButtonWithText:(NSString *)text target:(id)target selector:(SEL)selector;

// 创建 Label
+ (UILabel *)createNormalLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font alignment:(NSTextAlignment)alignment;

// 创建 普通 label
+ (UILabel *)createSizeFitLabelWithText:(NSString *)text;


#pragma mark - 生成字符串
// 生成唯一标示符
+ (NSString *)createUniqueString;

// 生成随机字符串
+ (NSString *)createRandomString:(NSInteger)length;



@end
