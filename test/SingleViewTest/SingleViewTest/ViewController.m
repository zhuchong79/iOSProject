//
//  ViewController.m
//  SingleViewTest
//
//  Created by hxl on 16/7/18.
//  Copyright © 2016年 hxl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *text;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _text.delegate =self;
//    [_text addTarget:self action:@selector(<#selector#>) forControlEvents:<#(UIControlEvents)#>]
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTextField) name:UITextFieldTextDidChangeNotification object:nil];
    
    _label.backgroundColor = [UIColor orangeColor];
    _label.numberOfLines = 0;

    [_btn addTarget:self action:@selector(btnaction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    
//    return YES;
//}
-(void)changeTextField
{
    _label.text = _text.text;
    [_label sizeToFit];

}
-(void)btnaction
{
    //_label.text = _text.text;
    [_label sizeToFit];
    
}
@end
