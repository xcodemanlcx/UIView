//
//  UIViewViewController.m
//  searchbar
//
//  Created by hx_leichunxiang on 14-8-13.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  功能描述：自动布局属性 autoresizingMask 1、单个部位；2、等比例缩放；3、 相对宽高比例适配。

#import "AutoresizingMaskVC.h"

#define Iphone5Height 568
#define kScreenHeight [UIScreen mainScreen].applicationFrame.size.height
#define kScaleHeight(a) (kScreenHeight>568?(kScreenHeight/Iphone5Height)*a:a)
//#define kScaleHeight(a) ((568.0/568)*a)

//([UIScreen mainScreen].applicationFrame.size.height)

#define kAutoresizingMaskAllScale (UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth| UIViewAutoresizingFlexibleRightMargin)
@interface AutoresizingMaskVC ()
{
    UIView *view1;
    UIView *view1SubView1;
    UIImageView *iconSubImg;
    CGFloat _rate;
}

@property (nonatomic, assign) CGFloat scaleHeight;
@end

@implementation AutoresizingMaskVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (CGFloat)scaleHeight:(CGFloat)height
{
    if (self.view.frame.size.height > Iphone5Height) {
        _scaleHeight = (self.view.frame.size.height/Iphone5Height)*height;
    }else{
        _scaleHeight = height;
    }
    return _scaleHeight;
}

- (void)setScaleHeight:(CGFloat)scaleHeight
{
    _scaleHeight = scaleHeight;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //背景灰
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
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];        [bgView addSubview:btn1];
    }
    
    //父视图
    view1 = [[UIView alloc] initWithFrame:CGRectMake(40, 20, 200, kScaleHeight(150))];
    view1.backgroundColor = [UIColor redColor];
    [bgView addSubview:view1];
    NSLog(@"view1Height == %f,kScreenHeight == %f",[UIScreen mainScreen].applicationFrame.size.height,kScaleHeight(150));
    
    //子视图
    view1SubView1 = [[UIView alloc] initWithFrame:CGRectMake(20, 10, 100, kScaleHeight(30))];
    view1SubView1.backgroundColor = [UIColor blueColor];
    view1SubView1.autoresizingMask = kAutoresizingMaskAllScale;
    [view1 addSubview:view1SubView1];
    
    iconSubImg = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 80, kScaleHeight(20))];
    iconSubImg.image = [UIImage imageNamed:@"icon_Image"];
    iconSubImg.autoresizingMask = kAutoresizingMaskAllScale;
    [view1SubView1 addSubview:iconSubImg];
    
    //线条
    UIView *view1SubView2 = [[UIView alloc] initWithFrame:CGRectMake(10, view1.frame.size.height-1, view1.frame.size.width-20, 0.5)];
    view1SubView2.backgroundColor = [UIColor greenColor];
    view1SubView2.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [view1 addSubview:view1SubView2];
    
    _rate= view1.frame.size.height/view1SubView1.frame.size.height;
}

/*子视图属性：
 1、父视图增加多少，子视图的某个长或高跟随就增加多少；
 2、底部距离、高度、顶部距离都设置，表示子视图等比例缩放：UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleTopMargin；
 UIViewAutoresizingNone                 = 0,
 UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
 UIViewAutoresizingFlexibleWidth        = 1 << 1,
 UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
 UIViewAutoresizingFlexibleTopMargin    顶部距离
 UIViewAutoresizingFlexibleHeight       高度
 UIViewAutoresizingFlexibleBottomMargin 底部距离
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
            rect.size.width = rect.size.height+5;

            view1.frame = rect;
        }
            break;
        case 103:
        {//view1 height-
            CGRect rect = view1.frame;
            rect.size.height = rect.size.height-50;
            rect.size.width = rect.size.height-5;
            view1.frame = rect;
        }
            break;
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
            break;

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
