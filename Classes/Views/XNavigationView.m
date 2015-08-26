//
//  XNavigationView.m
//  startWild
//
//  Created by Chensh on 15/7/29.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "XNavigationView.h"
#import "XToolsMacro.h"
#import "UIViewExt.h"

@interface XNavigationView ()
{
//    UIImageView *_bgImageView;
    UIView *_bgView;
}

@property (nonatomic, strong) UILabel *titleLabel;


@end

@implementation XNavigationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews
{
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    _bgView.backgroundColor = [UIColor greenColor];
    [self addSubview:_bgView];
    
    
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftButton.frame = CGRectMake(0, HEIGHT_OF_STATUS_BAR, 60.0f, HEIGHT_OF_NAVIGATION_BAR);
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"x_navigation_back"]];
    backImageView.left = 0;
    backImageView.top = (_leftButton.height - backImageView.height) / 2;
    [_leftButton addSubview:backImageView];
    [self addSubview:_leftButton];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    _titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:_titleLabel];
}

- (void)setTitle:(NSString*)title
{
    _titleLabel.text = title;
    [_titleLabel sizeToFit];
    _titleLabel.frame = CGRectMake((self.width - _titleLabel.width) / 2, self.height - _titleLabel.height - 10.0f, _titleLabel.width, _titleLabel.height);
}

- (void)setRightButton:(UIButton *)rightButton
{
    _rightButton = rightButton;
    [self addSubview:rightButton];
}

@end
