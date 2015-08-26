//
//  XNavigationView.h
//  startWild
//
//  Created by Chensh on 15/7/29.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

// 导航栏

#import <UIKit/UIKit.h>

@interface XNavigationView : UIView

@property (nonatomic, strong) UIButton *leftButton;

@property (nonatomic, strong) UIButton *rightButton;

- (void)setTitle:(NSString*)title;

@end
