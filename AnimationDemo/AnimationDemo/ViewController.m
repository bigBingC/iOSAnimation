//
//  ViewController.m
//  AnimationDemo
//
//  Created by 崔冰 on 2017/6/9.
//  Copyright © 2017年 崔冰. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *arrAnimationSection1;
@property (strong, nonatomic) NSMutableArray *arrAnimationSection2;

@end

@implementation ViewController

- (NSMutableArray *)arrAnimationSection1
{
    if (!_arrAnimationSection1) {
        _arrAnimationSection1 = [NSMutableArray arrayWithObjects:@"CABasicAnimation基础动画",@"CAKeyframeAnimation基础动画",@"画线动画",@"CASpringAnimation弹簧动画", nil];
    }
    return _arrAnimationSection1;
}

- (NSMutableArray *)arrAnimationSection2
{
    if (!_arrAnimationSection2) {
        _arrAnimationSection2 = [NSMutableArray arrayWithObjects:@"水波纹效果",@"粒子动画-火苗效果", nil];
    }
    return _arrAnimationSection2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"动画";
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.arrAnimationSection1.count;
    }else{
        return self.arrAnimationSection2.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = self.arrAnimationSection1[indexPath.row];
    }else{
        cell.textLabel.text = self.arrAnimationSection2[indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"动画基础示例";
    }else{
        return @"动画常见经典案例";
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                FirstViewController *vc1 = [[FirstViewController alloc] init];
                [self.navigationController pushViewController:vc1 animated:YES];
            }break;
            case 1:
            {
                SecViewController *vc2 = [SecViewController new];
                [self.navigationController pushViewController:vc2 animated:YES];
            }break;
            case 2:
            {
                ThirdViewController *vc3 = [ThirdViewController new];
                [self.navigationController pushViewController:vc3 animated:YES];
            }break;
            case 3:
            {
                FourViewController *vc4 = [FourViewController new];
                [self.navigationController pushViewController:vc4 animated:YES];
            }break;
            default:
                break;
        }
    }else{
        if (indexPath.row == 0) {
            FiveViewController *vc5 = [FiveViewController new];
            [self.navigationController pushViewController:vc5 animated:YES];
        }else{
            SixViewController *vc6 = [SixViewController new];
            [self.navigationController pushViewController:vc6 animated:YES];
        }
    }
}
@end
