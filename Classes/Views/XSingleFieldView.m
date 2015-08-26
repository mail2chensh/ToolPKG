//
//  XSingleTextFiledView.m
//  startWild
//
//  Created by dev on 15/7/29.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "XSingleFieldView.h"
#import "XCreateManager.h"
#import "XToolsMacro.h"
#import "UIViewExt.h"

@interface XSingleFieldView ()
{
    NSString *_title;
    NSString *_value;
}
@end


@implementation XSingleFieldView


static float LeftMarginOfTitleLabel = 80.0f;

- (id)initWithFrame:(CGRect)frame viewType:(XSingleFieldViewType)type title:(NSString*)title value:(NSString*)value
{
    self = [super initWithFrame:frame];
    if (self) {
        _type = type;
        _title = title;
        _value = value;
        [self createSubviews];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}


- (void)createSubviews
{
    //
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = _title ? _title : @"";
    _titleLabel.font = [UIFont systemFontOfSize:GLOBAL_FONT_SIZE_NORMAL];
    _titleLabel.textColor = [UIColor grayColor];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_titleLabel];
    
    //
    _infoLabel = [[UILabel alloc] init];
    _infoLabel.text = _value ? _value : @"";
    _infoLabel.font = [UIFont systemFontOfSize:GLOBAL_FONT_SIZE_NORMAL];
    _infoLabel.textColor = [UIColor grayColor];
    _infoLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:_infoLabel];
    
    //
    _textField = [[UITextField alloc] init];
    _textField.placeholder = _value;
    _textField.textColor = [UIColor grayColor];
    _textField.font = [UIFont systemFontOfSize:GLOBAL_FONT_SIZE_NORMAL];
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    if (_type == XSingleFieldViewType_Password) {
        _textField.secureTextEntry = YES;
    }
    [self addSubview:_textField];
    
    //
    _arrowImageView = [XCreateManager createNormalImageViewWithImageName:@"x_arrow"];
    [self addSubview:_arrowImageView];
    
    //
    switch (_type) {
        case XSingleFieldViewType_Label: // 带Label显示
            _textField.hidden = YES;
            _arrowImageView.hidden = YES;
            
            [_titleLabel sizeToFit];
            _titleLabel.frame = CGRectMake(GLOBAL_LEFT_PADDING_NORMAL, (self.height - _titleLabel.height) / 2, _titleLabel.width, _titleLabel.height);
            
            [_infoLabel sizeToFit];
            _infoLabel.frame = CGRectMake(LeftMarginOfTitleLabel, (self.height - _infoLabel.height) / 2, self.width - LeftMarginOfTitleLabel - GLOBAL_LEFT_PADDING_NORMAL, _infoLabel.height);
            break;
            
            
        case XSingleFieldViewType_LabelWithArrow: // 带箭头图标的label
            _textField.hidden = YES;
            
            [_titleLabel sizeToFit];
            _titleLabel.frame = CGRectMake(GLOBAL_LEFT_PADDING_NORMAL, (self.height - _titleLabel.height) / 2, _titleLabel.width, _titleLabel.height);
            
            [_infoLabel sizeToFit];
            _infoLabel.frame = CGRectMake(LeftMarginOfTitleLabel, (self.height - _infoLabel.height) / 2, self.width - LeftMarginOfTitleLabel - GLOBAL_LEFT_PADDING_NORMAL * 2 - _arrowImageView.width, _infoLabel.height);
            
            _arrowImageView.frame = CGRectMake(_infoLabel.right + GLOBAL_LEFT_PADDING_NORMAL, (self.height - _arrowImageView.height) / 2, _arrowImageView.width, _arrowImageView.height);
            break;
            
            
        case XSingleFieldViewType_TextField: // 普通文本输入
        case XSingleFieldViewType_Password: // 密码输入
            _infoLabel.hidden = YES;
            _arrowImageView.hidden = YES;

            [_titleLabel sizeToFit];
            _titleLabel.frame = CGRectMake(GLOBAL_LEFT_PADDING_NORMAL, (self.height - _titleLabel.height) / 2, _titleLabel.width, _titleLabel.height);
            
            _textField.frame = CGRectMake(LeftMarginOfTitleLabel, 0, self.width - LeftMarginOfTitleLabel - GLOBAL_LEFT_PADDING_NORMAL, self.height);
            
            
            break;
            
        case XSingleFieldViewType_SingleTextField: // 单个输入框，左侧无TitleLabel
            _titleLabel.hidden = YES;
            _infoLabel.hidden = YES;
            _arrowImageView.hidden = YES;
            
             _textField.frame = CGRectMake(GLOBAL_LEFT_PADDING_NORMAL, 0, self.width - GLOBAL_LEFT_PADDING_NORMAL * 2, self.height);
            
            break;
    }
}



@end
