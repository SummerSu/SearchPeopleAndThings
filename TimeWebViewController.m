//
//  TimeWebViewController.m
//  SearchPeopleAndThings
//
//  Created by 孙苏 on 2017/11/28.
//  Copyright © 2017年 sunsu. All rights reserved.
//


#import "TimeWebViewController.h"

#define link @"http://www.thn21.com/help/6396.html"
//#define link @"http://www.baidu.com"

@interface TimeWebViewController ()
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation TimeWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"获取日时";
    [self addWebView];
}


-(void)addWebView{
    // 1.创建webview，并设置大小，"20"为状态栏高度
    CGFloat y = 64;
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height -y ;
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, y , width, height)];
    // 2.创建URL
    NSURL *url = [NSURL URLWithString:link];
    // 3.创建Request
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    // 4.加载网页
    [webView loadRequest:request];
    // 5.最后将webView添加到界面
    [self.view addSubview:webView];
    self.webView = webView;
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
