//
//  ViewController.m
//  TabTest
//
//  Created by hxl on 2016/11/11.
//  Copyright © 2016年 com.hxl.ctp. All rights reserved.
//

#import "ViewController.h"
#import <XFDialogBuilder/XFDialogBuilder.h>
//#import "MyAlertController.h"
@interface ViewController ()
@property(strong,nonatomic)UIButton*btn;
@property(strong,nonatomic)UIButton*btn1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _btn =[[UIButton alloc]initWithFrame:CGRectMake(100, 110.0, 200.0f, 50.0f)];
    [_btn setTitle:@"test" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(show1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    _btn1 =[[UIButton alloc]initWithFrame:CGRectMake(100, 300.0, 200.0f, 50.0f)];
    [_btn1 setTitle:@"show alert controller" forState:UIControlStateNormal];
    [_btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_btn1 addTarget:self action:@selector(show1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn1];

}
- (IBAction)test:(id)sender {
}
- (IBAction)poptest:(id)sender {
}
- (IBAction)popaction:(id)sender {
}
-(void)show
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"警告" message:@"你的操作非法" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)show1
{
    UIAlertController*alert=[UIAlertController alertControllerWithTitle:@"警告" message:@"你的操作非法" preferredStyle:UIAlertControllerStyleAlert];
    
    __weak typeof(alert) weakAlert = alert;
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        //NSLog(@"点击了确定按钮--%@-%@", [weakAlert.textFields.firstObject text], [weakAlert.textFields.lastObject text]);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"点击了取消按钮");
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"其它" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"点击了其它按钮");
    }]];
    
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
    
    [self presentViewController:alert animated:YES completion:nil];
    
}


// UIAlertControllerStyleActionSheet的使用注意
// 1.不能有文本框
// 2.在iPad中,必须使用popover的形式展示

// Text fields can only be added to an alert controller of style UIAlertControllerStyleAlert
// 只能在UIAlertControllerStyleAlert样式的view上添加文本框
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"你的操作时非法的，您要继续吗" preferredStyle:UIAlertControllerStyleActionSheet];
    // 设置popover指向的item
    alert.popoverPresentationController.barButtonItem = self.navigationItem.leftBarButtonItem;
    
    // 添加按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"点击了确定按钮");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"点击了取消按钮");
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)usernameDidChange:(UITextField *)username
{
    NSLog(@"%@", username.text);
}
-(void)test
{
    XFDialogInput *view = [XFDialogInput dialogWithTitle:@"test" attrs:@{XFDialogTitleColor:[UIColor redColor],XFDialogTitleViewBackgroundColor:[UIColor greenColor]} commitCallBack:^(NSString *inputText) {
    }];
    [view showWithAnimationBlock:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
