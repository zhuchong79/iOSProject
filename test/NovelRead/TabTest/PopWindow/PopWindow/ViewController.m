//
//  ViewController.m
//  PopWindow
//
//  Created by hxl on 2016/11/22.
//  Copyright © 2016年 com.hxl.ctp. All rights reserved.
//

#import "ViewController.h"
#import "MarketCloseViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *popBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *bar=[[UIBarButtonItem alloc]initWithTitle:@"adsfa" style:UIBarButtonItemStylePlain target:self action:nil];
    //UIBarButtonItem *bar=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(alert)];
    self.navigationItem.rightBarButtonItem=bar;
    
    [_popBtn addTarget:self action:@selector(tt) forControlEvents:UIControlEventTouchUpInside];
}
-(void) alert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"warning" message:@"asdsaf" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            NSLog(@"点击了取消按钮");
        }]];
    [self presentViewController:alert animated:YES completion:nil ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tt{
    MarketCloseViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AlertViewController"];

    [viewController presentTransparentModalViewController:self animated:YES withAlpha:1];
}
-(void)hitTest
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"警告" message:@"你的操作非法" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)show1
{
    UIAlertController*alert=[UIAlertController alertControllerWithTitle:@"警告" message:@"你的操作非法" preferredStyle:UIAlertControllerStyleAlert];
    
//    __weak typeof(alert) weakAlert = alert;
//    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
//        NSLog(@"点击了确定按钮--%@-%@", [weakAlert.textFields.firstObject text], [weakAlert.textFields.lastObject text]);
//    }]];
//    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//        NSLog(@"点击了取消按钮");
//    }]];
//    
//    [alert addAction:[UIAlertAction actionWithTitle:@"其它" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        NSLog(@"点击了其它按钮");
//    }]];
    
    // 添加文本框
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.textColor = [UIColor redColor];
        textField.text = @"123";
        [textField addTarget:self action:@selector(usernameDidChange:) forControlEvents:UIControlEventEditingChanged];
        //        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(usernameDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.secureTextEntry = YES;
        textField.text = @"123";
    }];
    NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"TestView" owner:nil options:nil];
    
    UIView *view=[arr firstObject];
    view.frame = CGRectMake(0,0,alert.view.frame.size.width,alert.view.frame.size.height);
    NSLog(@"width:%lf,%lf",alert.view.frame.size.width,alert.view.frame.size.height);
//    UIImageView *imgview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"market_close_btn"]];
//    imgview.frame = CGRectMake(alert.view.frame.size.width-50,50,30,30);
    [alert.view addSubview:view];
//    UIViewController*subViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"AlertViewController"];
//    [alert addChildViewController:subViewController];
//    
//    [alert transitionFromViewController:self.parentViewController toViewController:subViewController duration:0 options:UIViewAnimationOptionLayoutSubviews animations:nil completion:nil];
    
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)usernameDidChange:(UITextField *)username
{
    NSLog(@"%@", username.text);
}
@end
