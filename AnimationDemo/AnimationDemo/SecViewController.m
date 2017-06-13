//
//  SecViewController.m
//  AnimationDemo
//
//  Created by 崔冰 on 2017/6/9.
//  Copyright © 2017年 崔冰. All rights reserved.
//

#import "SecViewController.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"CAKeyframeAnimation";
    
    [self createCAKeyAni];
    
    [self createKeyAniWithValues];
    
    [self createAniGroup];
}

- (void)createCAKeyAni
{
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 280, 380)];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:tempView.frame];
    
    UIView *aniView = [[UIView alloc] initWithFrame:CGRectMake(20, 50, 50, 50)];
    aniView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:aniView];
    
    CAKeyframeAnimation *keyAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAni.duration = 5;
    keyAni.path = bezierPath.CGPath;
    keyAni.rotationMode = kCAAnimationRotateAutoReverse;
    keyAni.repeatCount = MAXFLOAT;
    keyAni.calculationMode = kCAAnimationPaced;
    [aniView.layer addAnimation:keyAni forKey:nil];
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 1;
    shapeLayer.path = bezierPath.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
}

- (void)createKeyAniWithValues
{
//    NSValue *p1 = [NSValue valueWithCGPoint:CGPointMake(30, 100)];
//    NSValue *p2 = [NSValue valueWithCGPoint:CGPointMake(30, 250)];
//    NSValue *p3 = [NSValue valueWithCGPoint:CGPointMake(100, 250)];
//    NSValue *p4 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    CGPoint po1 = CGPointMake(30, 100);
    CGPoint po2 = CGPointMake(30, 250);
    CGPoint po3 = CGPointMake(100,250);
    CGPoint po4 = CGPointMake(100,100);
    CGPoint po5 = CGPointMake(30, 100);

    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:po1];
    [bezierPath addLineToPoint:po2];
    [bezierPath addLineToPoint:po3];
    [bezierPath addLineToPoint:po4];
    [bezierPath addLineToPoint:po5];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 20, 20)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    CAKeyframeAnimation *keyAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    keyAni.values = @[p1,p2,p3,p4];
    keyAni.path = bezierPath.CGPath;
    keyAni.duration = 5;
    keyAni.repeatCount = MAXFLOAT;
    keyAni.calculationMode = kCAAnimationPaced;
    keyAni.rotationMode = kCAAnimationRotateAutoReverse;
    [view.layer addAnimation:keyAni forKey:nil];
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 1;
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shapeLayer];
}

- (void)createAniGroup
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 50, 50)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"position.y"];
    positionAnima.fromValue = @(view.center.y);
    positionAnima.toValue = @(100);
    
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    transformAnima.fromValue = @(0);
    transformAnima.toValue = @(M_PI);
    
    CAAnimationGroup *animaGroup = [CAAnimationGroup animation];
    animaGroup.duration = 10;
    animaGroup.fillMode = kCAFillModeForwards;
    animaGroup.removedOnCompletion = NO;
    animaGroup.animations = @[positionAnima,transformAnima];
    animaGroup.repeatCount = 5;

    [view.layer addAnimation:animaGroup forKey:nil];
}
@end
