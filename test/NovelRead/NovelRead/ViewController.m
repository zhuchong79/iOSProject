//
//  ViewController.m
//  NovelRead
//
//  Created by hxl on 2016/11/2.
//  Copyright © 2016年 com.hxl.novelread. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
//#import <UIKit+AFNetworking.h>//里面有异步加载图片的方法

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\n %s:%d   %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__, [[[NSString alloc] initWithData:[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] dataUsingEncoding:NSUTF8StringEncoding] encoding:NSNonLossyASCIIStringEncoding] UTF8String]);
#else
#define NSLog(...)
#endif
@interface ViewController ()
    @property (weak, nonatomic) IBOutlet UIButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    @weakify(self);
//    [self.testBtn.rac_command.executionSignals subscribeNext:^(id x) {
//        @strongify(self);
//        [self obtainData];
//    } error:^(NSError *error) {
//        
//    }];
    [[self.testBtn
      rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         @strongify(self);
         [self getwebContent];
     }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)obtainData
    {
        // 启动系统风火轮
        //[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        
        //前面写服务器给的域名,后面拼接上需要提交的参数，假如参数是key＝1
        //NSString *domainStr = @"http://120.25.226.186:32812/login?username=520it&pwd=520it&type=JSON";
        NSString *domainStr = @"http://www.biqule.com/book_2/";
        
        //增加这几行代码；
        AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
        [securityPolicy setAllowInvalidCertificates:YES];
        
        AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
        //manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        [manager setSecurityPolicy:securityPolicy];
        //manager.responseSerializer = [AFJSONResponseSerializer serializer];
        //manager.requestSerializer = [AFJSONRequestSerializer serializer];
 
        //[manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        //[manager.requestSerializer setValue:@"application/text" forHTTPHeaderField:@"Content-Type"];
        [manager.requestSerializer setValue:@"Mozilla/5.0 (Windows NT 6.2) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.12 Safari/535.11" forHTTPHeaderField:@"User-Agent"];
        [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        [manager GET:domainStr
              parameters:nil
                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                     NSLog(@"%@",responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }
         ];
    }
-(void)func1
{
    //    1.设置请求路径
    NSString *urlStr=[NSString stringWithFormat:@"http://www.baidu.com"];;
    NSURL *url=[NSURL URLWithString:urlStr];
     //    2.创建请求对象
         NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
     //    3.发送请求
}
-(void)get1
{
        //对请求路径的说明
        //http://120.25.226.186:32812/login?username=520it&pwd=520&type=JSON
        //协议头+主机地址+接口名称+？+参数1&参数2&参数3
        //协议头(http://)+主机地址(120.25.226.186:32812)+接口名称(login)+？+参数1(username=520it)&参数2(pwd=520)&参数3(type=JSON)
        //GET请求，直接把请求参数跟在URL的后面以？隔开，多个参数之间以&符号拼接
        
        //1.确定请求路径
        NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=520it&pwd=520it&type=JSON"];
        
        //2.创建请求对象
        //请求对象内部默认已经包含了请求头和请求方法（GET）
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        //3.获得会话对象
        NSURLSession *session = [NSURLSession sharedSession];
        
        //4.根据会话对象创建一个Task(发送请求）
        /*
         第一个参数：请求对象
         第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
         data：响应体信息（期望的数据）
         response：响应头信息，主要是对服务器端的描述
         error：错误信息，如果请求失败，则error有值
         */
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if (error == nil) {
                //6.解析服务器返回的数据
                //说明：（此处返回的数据是JSON格式的，因此使用NSJSONSerialization进行反序列化处理）
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                
                NSLog(@"%@",[dict description]);
            }
        }];
        
        //5.执行任务
        [dataTask resume];
}
-(void)getwebContent
    {
        NSURL *url = [NSURL URLWithString:@"http://www.biqule.com/book_2/"];
        NSError *err = nil;
        NSString *str = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&err];
        if (err == nil)
        {
            NSLog(@"%@",str);
        }
        else
        {
            NSLog(@"读取失败");
            NSLog(@"%@",err.localizedDescription);
        }
    }
@end
