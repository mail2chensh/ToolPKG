//
//  XBaseViewController.h
//  startWild
//
//  Created by dev on 15/7/29.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XNavigationView;


@interface XBaseViewController : UIViewController

@property (nonatomic, strong) XNavigationView *navigationView; // 导航栏

@property (nonatomic, strong) id preData; // 预数据



- (void)back;

- (void)addNotificationEvents;

- (void)pushViewControllerClassName:(NSString *)className;

- (void)pushViewControllerClassName:(NSString *)className preData:(id)preData;




#pragma mark - HUD
- (void)HudDismiss;
- (void)HudShow:(NSString *)status;
- (void)HudShowSuccess:(NSString *)status;
- (void)HudShowError:(NSString *)status;

@end
