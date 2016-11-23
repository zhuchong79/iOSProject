//
//  MyWebViewController.m
//  UrlLabel
//
//  Created by hxl on 16/8/11.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "MyWebViewController.h"
@interface MyWebViewController () <UIWebViewDelegate>
{
    UIWebView *webView;
}
@end

@implementation MyWebViewController
-(void)viewWillAppear:(BOOL)animated
{
    webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    webView.delegate =self;
    
    self.navigationController.toolbarHidden =NO;
    [self.view  addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
}

-(instancetype)initWithUrl:(NSString*)url
{
    if(self = [super init])
    {
        self.url = url;
    }
    return self;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    NSLog(@"error:%@",error);
}
@end
