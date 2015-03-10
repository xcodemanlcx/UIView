//
//  TransformViewController.m
//  UIView
//
//  Created by hx_leichunxiang on 14-12-1.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  内容：UIView的简单仿射变换：缩放、旋转、移动

#import "TransformViewController.h"

@interface TransformViewController ()
{
    UIView *v;
    UIView *subV;
}
@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 100, 60);
    [btn addTarget:self action:@selector(scaleChange) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"scaleChange" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(101, 0, 100, 60);
    [btn1 addTarget:self action:@selector(rotateView) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:@"rotateView" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(202, 0, 100, 60);
    [btn2 addTarget:self action:@selector(translateView) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitle:@"translateView" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    
    v = [[UIView alloc] initWithFrame:CGRectMake(60, 100, 200, 200)];
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
    
    subV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    subV.backgroundColor = [UIColor orangeColor];
    [v addSubview:subV];
    
    
}

//尺寸比例：比例系数变化
- (void)scaleChange
{
    v.transform = CGAffineTransformScale(v.transform, 0.5, 0.5);
}

//旋转：角度变化
- (void)rotateView
{
    v.transform = CGAffineTransformRotate(v.transform, 0.5);
}

//移动：坐标增减
- (void)translateView
{
    v.transform = CGAffineTransformTranslate(v.transform, 60, 50);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
