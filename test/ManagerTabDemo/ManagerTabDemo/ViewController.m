//
//  ViewController.m
//  ManagerTabDemo
//
//  Created by hxl on 16/6/3.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"
@interface ViewController () <UIWebViewDelegate>
//@property(strong,nonatomic) UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIButton *goBtn;
@property (strong, nonatomic) IBOutlet UITextField *urlTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.navigationController.navigationItem.title=@"dsfasdf";
    self.navigationItem.title=@"dsafa";
    //self.view.backgroundColor=[UIColor blueColor];
    [_webView setDelegate:self];
    [_webView loadRequest:[[NSURLRequest alloc]initWithURL:[[NSURL alloc]initWithString:@"http://www.baidu.com"]]];
    //_webView.scalesPageToFit = YES;
    //[_goBtn performSelector:@selector(goUrl) withObject:self];
    
}
-(void)viewWillAppear:(BOOL)animated
{
  /*  self.webView.scrollView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        NSLog(@"refresh");
    }];
   */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) userLogin
{
    [_webView loadRequest:[[NSURLRequest alloc]initWithURL:[[NSURL alloc]initWithString:_urlTextField.text]]];
}
#pragma mark -- function
-(void)goUrl
{

}

#pragma mark -- deletegate
/*
- (BOOL)webView:(UIWebView *)awebView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString* scheme = [[request URL] scheme];
    NSLog(@"scheme = %@",scheme);
    //判断是不是https
    if ([scheme isEqualToString:@"HTTPS"]) {
        //如果是https:的话，那么就用NSURLConnection来重发请求。从而在请求的过程当中吧要请求的URL做信任处理。
        if (!self.webView.isAuthed) {
            originRequest = request;
            NSURLConnection* conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
            [conn start];
            [awebView stopLoading];
            return NO;
        }
    }
    
    [self reflashButtonState];
    [self freshLoadingView:YES];
    
    NSURL *theUrl = [request URL];
    self.currenURL = theUrl;
    return YES;
}*/
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSLog(@"webViewDidStartLoad");
    
}

- (void)webViewDidFinishLoad:(UIWebView *)web{
    
    NSLog(@"webViewDidFinishLoad");
    self.title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
}

-(void)webView:(UIWebView*)webView  DidFailLoadWithError:(NSError*)error{
    
    NSLog(@"DidFailLoadWithError");
    
}
@end
