//
//  XBaseViewController.m
//  startWild
//
//  Created by dev on 15/7/29.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "XBaseViewController.h"

#import "XNavigationView.h"
#import "ProgressHUD.h"
#import "XToolsMacro.h"

@interface XBaseViewController ()
{
    UIView *_hudMaskBgView; // hud的遮挡背景
}
@end



@implementation XBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _hudMaskBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _hudMaskBgView.userInteractionEnabled = NO;
    _hudMaskBgView.backgroundColor = [UIColor clearColor];
    
    [self.navigationView setTitle:@""];
    
    [self addNotificationEvents];
}

#pragma mark - system event
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


#pragma mark - public method

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addNotificationEvents
{
    
}

#pragma mark - navigationView

- (XNavigationView *)navigationView
{
    if (_navigationView == nil) {
        _navigationView = [[XNavigationView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, HEIGHT_OF_X_NAVIGATION_VIEW)];
        [_navigationView.leftButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_navigationView];
    }
    if ([self.view.subviews indexOfObject:_navigationView] == NSNotFound) {
        [_navigationView removeFromSuperview];
        [self.view addSubview:_navigationView];
    }
    return _navigationView;
}


#pragma mark - navigation push pop
- (void)pushViewControllerClassName:(NSString *)className
{
    [self pushViewControllerClassName:className preData:nil];
}

- (void)pushViewControllerClassName:(NSString *)className preData:(id)preData
{
    Class viewControllerClass = NSClassFromString(className);
    XBaseViewController *viewController = (XBaseViewController *)[[viewControllerClass alloc] init];
    viewController.preData = preData;
    if (viewController) {
        [self.navigationController pushViewController:viewController animated:YES];
    }
}



#pragma mark - Progress Hud
- (void)HudDismiss
{
    [_hudMaskBgView removeFromSuperview];
    [ProgressHUD dismiss];
}

- (void)HudShow:(NSString *)status
{
    [self.view addSubview:_hudMaskBgView];
    [ProgressHUD show:status];
}

- (void)HudShowSuccess:(NSString *)status
{
    [self.view addSubview:_hudMaskBgView];
    [ProgressHUD showSuccess:status];
}

- (void)HudShowError:(NSString *)status
{
    [self.view addSubview:_hudMaskBgView];
    [ProgressHUD showError:status];
}

@end
