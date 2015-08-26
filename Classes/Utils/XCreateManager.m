//
//  XCreateManager.m
//  startWild
//
//  Created by dev on 15/7/29.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "XCreateManager.h"
#import "XToolsMacro.h"
#import "UIViewExt.h"

@implementation XCreateManager

//// 根据颜色返回图片
//+ (UIImage *)imageWithUIColor:(UIColor*)color
//{
//    CIImage *ciImg = [[CIImage alloc] initWithColor:color.CIColor];
//    return [[UIImage alloc] initWithCIImage:ciImg];
//}

// 根据颜色返回图片
+ (UIImage *)imageWithUIColor:(UIColor*)color size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

// 创建 UIImageView 对象
+ (UIImageView *)createNormalImageViewWithImageName:(NSString *)imageName
{
    UIImage *img = [UIImage imageNamed:imageName];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, img.size.width, img.size.height)];
    imgView.image = img;
    return imgView;
}

// 创建 分割线
+ (UIView *)createSeperateLineWithFrame:(CGRect)frame
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor blackColor];
    return view;
}

// 创建 button 对象 （图片背景）
+ (UIButton *)createNormalButtonWithNormalImageName:(NSString*)normal highlightName:(NSString*)highlight title:(NSString*)title target:(id)target selector:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (isStringNotEmpty(normal)) {
        UIImage *normalImage = [UIImage imageNamed:normal];
        [button setImage:normalImage forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    }
    
    if (isStringNotEmpty(highlight)) {
        [button setImage:[UIImage imageNamed:highlight] forState:UIControlStateHighlighted];
    }
    
    if (isStringNotEmpty(title)) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

// 创建 button 对象 (颜色背景)
+ (UIButton *)createColorButtonWithFrame:(CGRect)frame normalColor:(UIColor*)normal highlightColor:(UIColor*)highlight title:(NSString*)title target:(id)target selector:(SEL)selector
{
    UIButton *button = [XCreateManager createColorButtonWithFrame:frame normalColor:normal highlightColor:highlight title:title];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

// 创建 button 对象 (颜色背景,无selector)
+ (UIButton *)createColorButtonWithFrame:(CGRect)frame normalColor:(UIColor*)normal highlightColor:(UIColor*)highlight title:(NSString*)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    [button setBackgroundImage:[XCreateManager imageWithUIColor:normal size:frame.size] forState:UIControlStateNormal];
    [button setBackgroundImage:[XCreateManager imageWithUIColor:highlight size:frame.size] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[XCreateManager imageWithUIColor:[UIColor grayColor] size:frame.size] forState:UIControlStateDisabled];
    
    if (isStringNotEmpty(title)) {
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    }
    
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5.0f;
    
    return button;
}

// 创建 纯文字 按钮
+ (UIButton *)createTextButtonWithFrame:(CGRect)frame text:(NSString*)text target:(id)target selector:(SEL)selector
{
    UIButton *button = [XCreateManager createTextButtonWithFrame:frame text:text];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}

// 创建 纯文字 按钮（不带 selector）
+ (UIButton *)createTextButtonWithFrame:(CGRect)frame text:(NSString*)text
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    
    button.titleLabel.font = [UIFont systemFontOfSize:GLOBAL_FONT_SIZE_NORMAL];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    
    return button;
}



// 创建 导航栏 右键（纯文字）
+ (UIButton *)createNavigationRightButtonWithText:(NSString *)text target:(id)target selector:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(ScreenWidth - GLOBAL_LEFT_PADDING_SMALL - 60.0f, HEIGHT_OF_STATUS_BAR, 60.0f, HEIGHT_OF_NAVIGATION_BAR);
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];

    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    button.titleLabel.font = [UIFont systemFontOfSize:GLOBAL_FONT_SIZE_LARG];
    [button.titleLabel sizeToFit];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, button.width - button.titleLabel.width, 0, 0)];
    
    return button;
}


// 创建 Label
+ (UILabel *)createNormalLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font alignment:(NSTextAlignment)alignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = textColor;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = font;
    label.backgroundColor = [UIColor clearColor];
    return label;
}

// 创建 普通 label
+ (UILabel *)createSizeFitLabelWithText:(NSString *)text
{
    UILabel *label = [XCreateManager createNormalLabelWithFrame:CGRectZero text:text textColor:[UIColor grayColor] font:[UIFont systemFontOfSize:GLOBAL_FONT_SIZE_NORMAL] alignment:NSTextAlignmentLeft];
    [label sizeToFit];
    return label;
}




#pragma mark - 生成字符串
// 生成唯一标示符
+ (NSString *)createUniqueString
{
    NSString *unique = @"";
    unique = [self createRandomString:32];
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970] * 1000;
    unique = [NSString stringWithFormat:@"%@%.f", unique, timeInterval];
    unique = [NSString stringWithFormat:@"%@%@", unique, [self createRandomString:19]];
    return unique;
}

// 生成随机字符串
+ (NSString *)createRandomString:(NSInteger)length
{
    NSString *random = @"";
    for (int i = 0; i < length; i++) {
        random = [NSString stringWithFormat:@"%@%c", random, (char)('A' + (arc4random_uniform(26)))];
    }
    return random;
}



@end
