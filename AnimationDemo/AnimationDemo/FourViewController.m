//
//  FourViewController.m
//  AnimationDemo
//
//  Created by 崔冰 on 2017/6/9.
//  Copyright © 2017年 崔冰. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"CASpringAnimation弹簧动画";
    [self createSpringView];
}

- (void)createSpringView
{
    UILabel *springLbl = ({
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
        lbl.backgroundColor = [UIColor greenColor];
        lbl;
    });
    [self.view addSubview:springLbl];
    
    CASpringAnimation *ani = [CASpringAnimation animationWithKeyPath:@"position.x"];
    //mass 质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
    ani.mass      = 1;
    //刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
    ani.stiffness = 100;
    //阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
    ani.damping   = 5;
    //初始速率，动画视图的初始速度大小 速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
    ani.initialVelocity = 10;
    //结算时间 返回弹簧动画到停止时的估算时间，根据当前的动画参数估算 通常弹簧动画的时间使用结算时间比较准确
    ani.duration  = ani.settlingDuration;
    ani.fromValue = @(springLbl.center.x);
    ani.toValue   = @(springLbl.center.x + 50);
    ani.autoreverses = YES;
    ani.repeatCount  = HUGE_VAL;
    [springLbl.layer addAnimation:ani forKey:nil];
}
@end
