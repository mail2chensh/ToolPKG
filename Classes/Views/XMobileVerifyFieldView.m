//
//  XMobileVerifyFieldView.m
//  startWild
//
//  Created by Chensh on 15/7/29.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "XMobileVerifyFieldView.h"
#import "UIView+UIScreenDisplaying.h"
#import "XCreateManager.h"
#import "UIViewExt.h"
#import "XToolsMacro.h"


@interface XMobileVerifyFieldView ()
{
    NSTimer *_timer;
}
@end

@implementation XMobileVerifyFieldView

static float WidthOfVerifyButton = 80.0f;
static float WidthOfZoneButton = 60.0f;
static int MobileVerifyCounting = 0;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _zoneString = @"86";
        self.backgroundColor = [UIColor whiteColor];
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews
{
    _zoneButton = [XCreateManager createTextButtonWithFrame:CGRectMake(0, 0, WidthOfZoneButton, GLOBAL_CELL_HEIGHT_NORMAL) text:[self zoneButtonTitleString]];
    [self addSubview:_zoneButton];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(WidthOfZoneButton, 0, self.width - GLOBAL_LEFT_PADDING_NORMAL - WidthOfVerifyButton - WidthOfZoneButton, GLOBAL_CELL_HEIGHT_NORMAL)];
    _textField.textColor = [UIColor grayColor];
    _textField.font = [UIFont systemFontOfSize:GLOBAL_FONT_SIZE_NORMAL];
    _textField.placeholder = NSLocalizedString(@"verify.inputMobile", nil);
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _textField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:_textField];
    
    _verifyButton = [XCreateManager createTextButtonWithFrame:CGRectMake(self.width - WidthOfVerifyButton, 0, WidthOfVerifyButton, GLOBAL_CELL_HEIGHT_NORMAL) text:NSLocalizedString(@"verify.getVerify", nil) target:self selector:@selector(verifyButtonDidTouch:)];
    [self addSubview:_verifyButton];
}

- (void)dealloc
{
    [self stopTimer];
}

#pragma mark - button action
- (void)verifyButtonDidTouch:(UIButton *)sender
{
    MobileVerifyCounting = 10;
    [_verifyButton setEnabled:NO];
    [self startTimer];
}

#pragma mark -
- (void)checkVerifyCountingContinue
{
    if (MobileVerifyCounting != 0) {
        [_verifyButton setEnabled:NO];
        [self startTimer];
    }
}

#pragma mark - timer handler
- (void)startTimer
{
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerHandler) userInfo:nil repeats:YES];
    }
    [_timer fire];
}

- (void)stopTimer
{
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
}

- (void)timerHandler
{
    if (![self isDisplayedInScreen]) {
        [self stopTimer];
    }
    
    if (MobileVerifyCounting <= 1) {
        [self stopTimer];
        MobileVerifyCounting = 0;
        [_verifyButton setEnabled:YES];
        [_verifyButton setTitle:NSLocalizedString(@"verify.getVerify", nil) forState:UIControlStateNormal];
    } else {
        MobileVerifyCounting --;
        [_verifyButton setTitle:[NSString stringWithFormat:@"%@ %d",NSLocalizedString(@"verify.waitVerify", nil), MobileVerifyCounting] forState:UIControlStateNormal];
    }
}


#pragma mark - 

- (NSString *)zoneButtonTitleString
{
    return [NSString stringWithFormat:@"+%@", self.zoneString];
}

- (void)setZoneString:(NSString *)zoneString
{
    _zoneString = zoneString;
    [self.zoneButton setTitle:[self zoneButtonTitleString] forState:UIControlStateNormal];
}

@end
