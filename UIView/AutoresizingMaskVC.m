//
//  UIViewViewController.m
//  searchbar
//
//  Created by hx_leichunxiang on 14-8-13.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  功能描述：自动布局属性 autoresizingMask 

#import "AutoresizingMaskVC.h"

@interface UIViewViewController ()
{
    UIView *view1;
    UIView *view1SubView1;
    CGFloat _rate;
}
@end

@implementation UIViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    bgView.backgroundColor = [UIColor grayColor];
    bgView.userInteractionEnabled = YES;
    
    //YES :自动布局才有效
    bgView.autoresizesSubviews = YES;
    
    [self.view addSubview:bgView];
    
    NSArray *btnTitleArr = @[@"下移",@"上移",@"高度+",@"高度-",@"宽度+",@"宽度-"];
    
    for (int i = 0; i<btnTitleArr.count; i++) {
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame = CGRectMake(40*i+10, 0, 40, 20);
        btn1.titleLabel.font = [UIFont systemFontOfSize:12];
        btn1.tag = 100+i;
        [btn1 setTitle:btnTitleArr[i] forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [bgView addSubview:btn1];
    }
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(40, 20, 200, 150)];
    view1.backgroundColor = [UIColor redColor];
    view1.autoresizesSubviews = YES;
    [bgView addSubview:view1];
    
    view1SubView1 = [[UIView alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
    view1SubView1.backgroundColor = [UIColor blueColor];
    view1SubView1.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [view1 addSubview:view1SubView1];
    
    UIView *view1SubView2 = [[UIView alloc] initWithFrame:CGRectMake(10, view1.frame.size.height-1, view1.frame.size.width-20, 1)];
    view1SubView2.backgroundColor = [UIColor greenColor];
    view1SubView2.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [view1 addSubview:view1SubView2];
    
    _rate= view1.frame.size.height/view1SubView1.frame.size.height;
}
/*
 UIViewAutoresizingNone                 = 0,
 UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
 UIViewAutoresizingFlexibleWidth        = 1 << 1,
 UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
 UIViewAutoresizingFlexibleTopMargin    相对父视图, 不变：宽高都不变，距离底部距离；跟随变化：顶部距离。
 UIViewAutoresizingFlexibleHeight       高度：父视图高度增加多少,子视图高度增加多少。
 UIViewAutoresizingFlexibleBottomMargin 相对父视图，不变：宽高都不变，距离顶部距离；跟随变化：顶部距离。
 */
-(void)btnAction:(UIButton *)sender
{
    switch (sender.tag) {
        case 100:
        {//view1 下移
            CGRect rect = view1.frame;
            rect.origin.y = rect.origin.y+50;
            view1.frame = rect;
        }
            break;
        case 101:
        {//view1 上移
            CGRect rect = view1.frame;
            rect.origin.y = rect.origin.y-50;
            view1.frame = rect;
        }
            break;
        case 102:
        {//view1 height+
            CGRect rect = view1.frame;
            rect.size.height = rect.size.height+50;
            view1.frame = rect;
        }
            break;
        case 103:
        {//view1 height-
            CGRect rect = view1.frame;
            rect.size.height = rect.size.height-50;
            view1.frame = rect;
        }
        case 104:
        {
            CGRect rect = view1.frame;
            rect.size.height = rect.size.height+50;
            view1.frame = rect;
        }
            break;
        case 105:
        {
            CGRect rect = view1.frame;
            rect.size.height = rect.size.height-50;
            view1.frame = rect;
        }

    }
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
