//
//  IrregularImageView.m
//  IrregularImageView
//
//  Created by 惠上科技 on 2018/12/12.
//  Copyright © 2018 惠上科技. All rights reserved.
//

#import "IrregularImageView.h"
@interface IrregularImageView()

/**
 遮罩
 */
@property (nonatomic, strong) CAShapeLayer *maskLayer;

/**
 路径
 */
@property (nonatomic, strong) UIBezierPath *borderPath;

@end

@implementation IrregularImageView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 初始化遮罩
        self.maskLayer = [CAShapeLayer layer];
        // 设置遮罩
        [self.layer setMask:self.maskLayer];
        // 初始化路径
        self.borderPath = [UIBezierPath bezierPath];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    // 遮罩层frame
    self.maskLayer.frame = self.bounds;
    
    // 设置path 起点
    [self.borderPath moveToPoint:CGPointMake(0, 10)];
    // 左上角的圆角
    [self.borderPath addQuadCurveToPoint:CGPointMake(10, 0) controlPoint:CGPointMake(0, 0)];
    
    // 直线，到右上角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width  - 10, 0)];
    // 右上角的圆角
    [self.borderPath addQuadCurveToPoint:CGPointMake(self.bounds.size.width, 10) controlPoint:CGPointMake(self.bounds.size.width, 0)];
    
    // 直线，到右下角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height - 10 - 5)];
    // 右下角的圆角
    [self.borderPath addQuadCurveToPoint:CGPointMake(self.bounds.size.width - 10, self.bounds.size.height - 5) controlPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height - 5)];
    
    // 底部倒立的小三角
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width/2 + 5, self.bounds.size.height - 5)];
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height)];
    [self.borderPath addLineToPoint:CGPointMake(self.bounds.size.width/2 - 5, self.bounds.size.height - 5)];
    
    // 直线，到左下角
    [self.borderPath addLineToPoint:CGPointMake(10, self.bounds.size.height - 5)];
    // 左下角的圆角
    [self.borderPath addQuadCurveToPoint:CGPointMake(0, self.bounds.size.height - 10 - 5) controlPoint:CGPointMake(0, self.bounds.size.height - 5)];
    
    // 直线，回到起点
    [self.borderPath addLineToPoint:CGPointMake(0, 10)];
    
    // 将这个path赋值给maskLayer的path
    self.maskLayer.path = self.borderPath.CGPath;
}


@end
