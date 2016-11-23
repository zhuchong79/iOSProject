//
//  ViewController.m
//  UrlLabel
//
//  Created by hxl on 16/8/8.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"
#import "TTTAttributedLabel.h"
#import "EFSTextView.h"
#import "MyWebViewController.h"
@interface ViewController () <UITextViewDelegate,UIWebViewDelegate>
{
    MyWebViewController *WebViewController;
}
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *label2;


@end

@implementation ViewController
- (IBAction)test:(id)sender {
    
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];

    [self.navigationController pushViewController:WebViewController animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WebViewController = [[MyWebViewController alloc]initWithUrl:@"http://www.baidu.com"];
    
    _urlLabel.text = @" www.sina.com 你好打发打发的说法 阿的说法看了就离开  阿的弗雷斯科肌肤 www.baidu.com";
    
    
    _label2.delegate = self;
    _label2.enabledTextCheckingTypes = NSTextCheckingTypeLink;
    _label2.numberOfLines = 0;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:@"www.sina.com你好，客服目前不在哦，为您带来的不便深感抱歉，您可以留言，我们会尽快给您回复的打法发大发大说法http://www.baidu.com"];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.minimumLineHeight = 22.5;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, attributedString.length)];
    _label2.text =attributedString;
   /*
    NSString*text=@"www.sina.com你好，客服目前不在哦，为您带来的不便深感抱歉，您可以留言，我们会尽快给您回复的打法发大发大发阿的说法http://www.baidu.com";
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSError *error;
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:text options:0 range:NSMakeRange(0, text.length)];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches)
    {
        NSString* substringForMatch = [text substringWithRange:match.range];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:match.range];
        //[_urlContent addObject:substringForMatch];
        [attributedString1 addAttribute:NSLinkAttributeName
                                  value:substringForMatch
                                  range:match.range];//[[attributedString1 string] rangeOfString:substringForMatch]];
        //[_urlRange addObject:match.range];
        NSLog(@"substringForMatch %@",substringForMatch);
    }
   
    
    
    NSDictionary *linkAttributes = @{NSForegroundColorAttributeName: [UIColor greenColor],
                                     NSUnderlineColorAttributeName: [UIColor redColor],
                                     NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
    
    // assume that textView is a UITextView previously created (either by code or Interface Builder)
    _mytextView.attributedText = attributedString1;
    _mytextView.linkTextAttributes = linkAttributes; // customizes the appearance of links
    [_mytextView sizeToFit];
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)attributedLabel:(TTTAttributedLabel *)label
   didSelectLinkWithURL:(NSURL *)url{
    //这里可以对点击的url进行操作
//    UIWebView *callWebView = [[UIWebView alloc] init];
//    [callWebView loadRequest:[NSURLRequest requestWithURL:url]];
//    [self.view addSubview:callWebView];
    
     [[UIApplication sharedApplication] openURL:url];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if (![URL scheme]) {
    }

    //__block MyWebViewController *viewController = [[MyWebViewController alloc]initWithUrl:[URL absoluteURL]];

    WebViewController.url=[URL absoluteString];
    [self.navigationController pushViewController:WebViewController animated:YES];
    NSLog(@"%@",[URL scheme]);
    //[[UIApplication sharedApplication] openURL:URL];
    if ([[URL scheme] isEqualToString:@"username"]) {
        NSString *username = [URL host];
        // do something with this username
        // ...
        
        return NO;
    }
    return NO; // let the system open this URL
}

@end
