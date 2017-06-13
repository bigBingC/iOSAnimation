//
//  ThirdViewController.m
//  AnimationDemo
//
//  Created by 崔冰 on 2017/6/9.
//  Copyright © 2017年 崔冰. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()<CAAnimationDelegate>
@property (strong, nonatomic) CAShapeLayer *shapeLayer;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"画线动画";
    
    [self createLineAni];
}

- (void)createLineAni
{
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:tempView.frame];
    
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //开始时间
//    ani.beginTime = CACurrentMediaTime() + 5;
    ani.duration = 5;
    ani.fromValue = @(0);
    ani.toValue = @(1);
    ani.autoreverses = true;
    ani.fillMode = kCAFillModeForwards;
    ani.repeatCount = 2;
    //不可逆转
    ani.autoreverses = false;
    //获取动画结束事件必须遵循代理
    ani.delegate = self;
    
    _shapeLayer = [[CAShapeLayer alloc] init];
    _shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.lineWidth = 4;
    _shapeLayer.path = path.CGPath;
    [_shapeLayer addAnimation:ani forKey:nil];
    [self.view.layer addSublayer:_shapeLayer];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [_shapeLayer removeFromSuperlayer];
}

@end
