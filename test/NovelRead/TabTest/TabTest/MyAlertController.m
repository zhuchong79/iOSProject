//
//  MyAlertController.m
//  TabTest
//
//  Created by hxl on 2016/11/22.
//  Copyright © 2016年 com.hxl.ctp. All rights reserved.
//

#import "MyAlertController.h"

@implementation UIAlertController (MyAlertController)
+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    return self;
}

- (instancetype)initWithTitle:(NSString*)title message:(NSString*)msg
{

    __weak typeof(self) weakAlert = self;
    
    [self addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"点击了确定按钮--%@-%@", [weakAlert.textFields.firstObject text], [weakAlert.textFields.lastObject text]);
    }]];
    [self addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"点击了取消按钮");
    }]];
    
    [self addAction:[UIAlertAction actionWithTitle:@"其它" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"点击了其它按钮");
    }]];
    
    // 添加文本框
    [self addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.textColor = [UIColor redColor];
        textField.text = @"123";
        [textField addTarget:self action:@selector(usernameDidChange:) forControlEvents:UIControlEventEditingChanged];
        //        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(usernameDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
    }];
    [self addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.secureTextEntry = YES;
        textField.text = @"123";
    }];

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.preferredStyle = UIAlertControllerStyleAlert;
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
