//
//  FirstViewController.m
//  AnimationDemo
//
//  Created by 崔冰 on 2017/6/9.
//  Copyright © 2017年 崔冰. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"CABasicAnimation";
    
    [self createRoutionView];
    
    [self createMoveView];
    
    [self createColorView];
    
    [self createContentView];
    
    [self createCornerView];
    
    [self createAlphaView];
}

#pragma mark - 旋转动画
- (void)createRoutionView
{
    UIView *routionView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 70, 70)];
        view.backgroundColor = [UIColor redColor];
        view;
    });
    [self.view addSubview:routionView];
    
    __block NSString *keyPath = @"transform";
    [self p_createAni:keyPath view:routionView];
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [routionView.layer removeAnimationForKey:keyPath];
        keyPath = @"transform.rotation";
        [strongSelf p_createAni:keyPath view:routionView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [routionView.layer removeAnimationForKey:keyPath];
            keyPath = @"transform.rotation.y";
            [strongSelf p_createAni:keyPath view:routionView];
        });
    });
}

- (void)p_createAni:(NSString *)keyPath view:(UIView *)view
{
    CABasicAnimation *routionAni = [CABasicAnimation animationWithKeyPath:keyPath];
    routionAni.beginTime    = 0;
    routionAni.fromValue    = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1)];
    routionAni.toValue      = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    routionAni.duration     = 2;
    routionAni.repeatCount  = MAXFLOAT;
    routionAni.autoreverses = true;
    [view.layer addAnimation:routionAni forKey:nil];
}

#pragma mark - 移动动画
- (void)createMoveView
{
    UIView *moveView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(40, 240, 70, 70)];
        view.backgroundColor = [UIColor greenColor];
        view;
    });
    [self.view addSubview:moveView];
    
    [self p_createAni:moveView];
}

- (void)p_createAni:(UIView *)view
{
    CABasicAnimation *moveAni = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAni.toValue   = [NSValue valueWithCGPoint:CGPointMake(200, 240)];
    moveAni.duration  = 2;
    
    //是否逆转（设置下面两句就不要设置逆转）
//    moveAni.autoreverses = true;
    //动画结束停留在结束位置
    moveAni.removedOnCompletion = NO;
    moveAni.fillMode = kCAFillModeForwards;
    [view.layer addAnimation:moveAni forKey:nil];
}

#pragma mark - 背景颜色变化动画
- (void)createColorView
{
    UIView *colorView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 300, 70, 70)];
        view.backgroundColor = [UIColor grayColor];
        view;
    });
    [self.view addSubview:colorView];
    
    CABasicAnimation *colorAni = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAni.toValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    colorAni.duration = 2;
    colorAni.autoreverses = true;
    [colorView.layer addAnimation:colorAni forKey:nil];
}

#pragma mark - 内容变化
- (void)createContentView
{
    UIImageView *contentImgView = ({
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(150, 310, 70, 70)];
        imgV.image = [UIImage imageNamed:@"from"];
        imgV;
    });
    [self.view addSubview:contentImgView];
    
    CABasicAnimation *contentAni = [CABasicAnimation animationWithKeyPath:@"contents"];
    contentAni.toValue = (__bridge id _Nullable)([UIImage imageNamed:@"to"].CGImage);
    contentAni.duration = 1.5;
    contentAni.repeatCount = MAXFLOAT;
    contentAni.autoreverses = true;
    [contentImgView.layer addAnimation:contentAni forKey:nil];
}

#pragma mark - 圆角变化动画
- (void)createCornerView
{
    UIView *cornerView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(220, 100, 70, 70)];
        view.backgroundColor = [UIColor blueColor];
        view.layer.masksToBounds = YES;
        view;
    });
    [self.view addSubview:cornerView];
    
    CABasicAnimation *cornerAni = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    cornerAni.toValue = @(35);
    cornerAni.duration = 2;
    cornerAni.repeatCount = MAXFLOAT;
    cornerAni.autoreverses = true;
    [cornerView.layer addAnimation:cornerAni forKey:nil];
}

#pragma mark - 透明动画
- (void)createAlphaView
{
    UIView *alphaView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(40, 380, 70, 70)];
        view.backgroundColor = [UIColor brownColor];
        view;
    });
    [self.view addSubview:alphaView];
    
    CABasicAnimation *alphaAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAni.fromValue = @(0.3);
    alphaAni.toValue = @(0.8);
    alphaAni.duration = 2;
    alphaAni.autoreverses = YES;
    alphaAni.repeatCount = MAXFLOAT;
    [alphaView.layer addAnimation:alphaAni forKey:nil];
}
@end
