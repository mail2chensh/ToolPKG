//
//  XMobileVerifyFieldView.h
//  startWild
//
//  Created by Chensh on 15/7/29.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMobileVerifyFieldView : UIView

@property (nonatomic, strong) UIButton *zoneButton;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIButton *verifyButton;

@property (nonatomic, copy) NSString *zoneString;

// 检测是否需要计数器继续计数
- (void)checkVerifyCountingContinue;

@end
