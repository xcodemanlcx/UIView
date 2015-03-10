//
//  ViewController1.m
//  TextView
//
//  Created by hx_leichunxiang on 14-10-27.
//  Copyright (c) 2014年 lcx. All rights reserved.
//  功能描述： 子视图超过父视图的部分，不响应事件

#import "ViewController1.h"

@interface ViewController1 ()<UITextViewDelegate>
{
    UIView *bgView;
    UITextView *_textView;
    UIView *_tapView;
}
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1-父视图
    bgView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    _textView.backgroundColor = [UIColor redColor];
    _textView.delegate = self;
    [bgView addSubview:_textView];
    

}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([_textView isFirstResponder])
    {
        //2-子视图：添加手势事件
        _tapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2000, 2000)];
        _tapView.backgroundColor = [UIColor purpleColor];
        [bgView addSubview:_tapView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnAction:)];
        [_tapView addGestureRecognizer:tap];
        
    }
}

- (void)btnAction:(UIGestureRecognizer *)sender
{
    if ([_textView isFirstResponder])
    {
        [_textView resignFirstResponder];
        [_tapView removeFromSuperview];
    }
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
