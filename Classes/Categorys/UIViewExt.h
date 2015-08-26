/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)
@property CGPoint origin;     //设置x,y轴坐标
@property CGSize size;        //宽，高

@property (readonly) CGPoint bottomLeft;   //view的底左边界
@property (readonly) CGPoint bottomRight;  //view的底右边界
@property (readonly) CGPoint topRight;     //view上右边界

@property CGFloat height;     //高
@property CGFloat width;      //宽

@property CGFloat top;        //顶部y
@property CGFloat left;       //左部x

@property CGFloat bottom;     //底下y
@property CGFloat right;      //右边x

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;
@end