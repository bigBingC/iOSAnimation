//
//  FiveViewController.m
//  AnimationDemo
//
//  Created by 崔冰 on 2017/6/9.
//  Copyright © 2017年 崔冰. All rights reserved.
//

#import "FiveViewController.h"

@interface FiveViewController ()
//水纹周期
@property (assign, nonatomic) CGFloat waveCy;
//位移
@property (assign, nonatomic) CGFloat offsetX;
//水纹振幅
@property (assign, nonatomic) CGFloat waveA;
//水纹速度
@property (assign, nonatomic) CGFloat waveSpeed;
//当前波浪高度
@property (assign, nonatomic) CGFloat waveH;
//水纹路宽度
@property (assign, nonatomic) CGFloat waveW;

@property (strong, nonatomic) CAShapeLayer *layer;

@property (strong, nonatomic) CADisplayLink *waveLink;

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"水波纹效果";
    
    [self createWaveView];
}

- (void)createWaveView
{
    UIView *waveView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 200, self.view.bounds.size.width, 200)];
        view.backgroundColor = [UIColor clearColor];
        view;
    });
    [self.view addSubview:waveView];
    /** y=Asin（ωx+φ）+h*/
    [self setupUI:waveView];
}

- (void)setupUI:(UIView *)view
{
    _waveA     = 20;
    _offsetX   = 0;
    _waveSpeed = 0.07;
    _waveW     = view.bounds.size.width;
    _waveH     = 2 * M_PI / _waveW;
    /** 一个波峰、一个波谷，如果我们想在0到2π这个距离显示2个完整的波曲线，那么周期就是π。
      * 我们这里设置波的宽度是容器的宽度_waveWidth，希望能展示2个波曲线，周期就是_waveWidth／2。
      * 那么ω常量就可以这样计算：2*M_PI/_waveWidth。
     */
    _waveCy    = 2 * M_PI / view.bounds.size.width;
    _layer     = [[CAShapeLayer alloc] init];
    _layer.fillColor = [UIColor greenColor].CGColor;
    [view.layer addSublayer:_layer];
    
    _waveLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(doAni)];
    [_waveLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)doAni
{
    _offsetX += _waveSpeed;
    CGFloat y = _waveH;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, y);
    
    for (int i = 0.0; i < _waveW; i ++) {
        y = _waveA * sinf(_waveCy * i + _offsetX) + _waveH;
        CGPathAddLineToPoint(path, NULL, (float)i, y);
    }
    CGPathAddLineToPoint(path, NULL, _waveW, 100);
    CGPathAddLineToPoint(path, NULL, 0, 100);
    CGPathCloseSubpath(path);
    _layer.path = path;
}

- (void)dealloc
{
    [_waveLink invalidate];
}
@end
