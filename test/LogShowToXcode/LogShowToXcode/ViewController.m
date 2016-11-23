//
//  ViewController.m
//  LogShowToXcode
//
//  Created by hxl on 16/6/17.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *file = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
  //  [self.webView loadHTMLString:file baseURL:[[NSBundle mainBundle]bundleUrl]];
    //[self.webView loadRequest:<#(nonnull NSURLRequest *)#>]
     [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:file]]];
    [self.webView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView: (UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *requestString = [[[request URL] absoluteString] stringByReplacingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    //NSLog(requestString);
    if ([requestString hasPrefix:@"ios-log:"]) {
        NSString* logString = [[requestString componentsSeparatedByString:@":#iOS#"] objectAtIndex:1];
        NSLog(@"UIWebView console: %@", logString);
        return NO;
    }
    return YES;
}
@end
