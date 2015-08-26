//
//  XSingleTextFiledView.h
//  startWild
//
//  Created by dev on 15/7/29.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

// 单条输入框

#import <UIKit/UIKit.h>
#import "XToolsMacro.h"


@interface XSingleFieldView : UIView

@property (nonatomic, assign) XSingleFieldViewType type;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *infoLabel;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIImageView *arrowImageView;


- (id)initWithFrame:(CGRect)frame viewType:(XSingleFieldViewType)type title:(NSString*)title value:(NSString*)value;


@end
