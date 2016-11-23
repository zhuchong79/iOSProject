//
//  ViewController.m
//  WebViewLearn
//
//  Created by hxl on 16/4/13.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mywebview;//=_mywebview;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",NSUserName());
   // mywebview.delegate=self;
    //[mywebview addTarget:self option:@selector(weakObjectsHashTable) forcontrolEvents:UIWebViewNavigationTypeLinkClicked];
    NSURL *url = [[NSURL alloc]initWithString:@"http://www.baidu.com"];
    [mywebview loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"webViewDidStartLoad");
}
- (void)webViewDidFinishLoad:(UIWebView *)web{
    NSLog(@"webViewDidFinishLoad");
}
-(void)webView:(UIWebView*)webView  DidFailLoadWithError:(NSError*)error{
    NSLog(@"DidFailLoadWithError");
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType

{
    //NSLog(@"shouldStartLoadWithRequest:%d",(int)navigationType);
    if( navigationType == UIWebViewNavigationTypeLinkClicked )
    {
        NSLog(@"%@",request.URL);
        if( [request.URL isEqual:@"http://baidu.com"]){NSLog(@"baidu");}
        [[UIApplication sharedApplication] openURL:[request URL]];
        return NO;
    }
    return YES;
    
}
- (IBAction)btnaction:(id)sender {
}
@end
