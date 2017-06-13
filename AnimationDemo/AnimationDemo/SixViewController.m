//
//  SixViewController.m
//  AnimationDemo
//
//  Created by 崔冰 on 2017/6/9.
//  Copyright © 2017年 崔冰. All rights reserved.
//

#import "SixViewController.h"

@interface SixViewController ()

@end

@implementation SixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"火苗效果";
    [self createFireAni];
}

- (void)createFireAni
{
//    self.view.backgroundColor = [UIColor blackColor];
    CAEmitterLayer *layer = [CAEmitterLayer layer];
    layer.frame = self.view.bounds;
    layer.emitterPosition = self.view.center;
    //发射源的形状
    layer.emitterShape = kCAEmitterLayerCircle;
    //发射器渲染模式
    layer.renderMode = kCAEmitterLayerAdditive;
    // 发射器的发射模式
    layer.emitterMode = kCAEmitterLayerOutline;
    [self.view.layer addSublayer:layer];

    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    //粒子的创建速率
    cell.birthRate = 200;
    //粒子的存活时间
    cell.lifetime = 0.2;
    //粒子生存范围
    cell.lifetimeRange = 0.5;
    //粒子颜色
    cell.color = [UIColor orangeColor].CGColor;
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"DazFire"].CGImage);
    //速度
    cell.velocity = 35;
    cell.velocityRange = 10;
    //粒子在xy平面上的发射角度
    cell.emissionLongitude = M_PI + M_PI_2;
    //粒子发射角度容差
    cell.emissionRange = M_PI_2;
    //缩放速度
    cell.scaleSpeed = 0.3;
    layer.emitterCells = @[cell];
}
@end
