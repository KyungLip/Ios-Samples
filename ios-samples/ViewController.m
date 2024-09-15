//
//  ViewController.m
//  ios-samples
//
//  Created by didi on 2024/9/10.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(50,50,100,100);
    btn.backgroundColor=[UIColor blueColor];
    btn.tintColor=[UIColor whiteColor];
    [btn setTitle:@"百度" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(requestFromNet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void) requestFromNet{
    NSLog(@"被点击了!");
    //创建一个Session配置
    NSURLSessionConfiguration *sessionConfig=[NSURLSessionConfiguration defaultSessionConfiguration];
    //    NSURLSession *session=[NSURLSession sharedSession];
    //创建Session会话
    NSURLSession *session=[NSURLSession sessionWithConfiguration:sessionConfig];
    NSString *strUrl=@"https://www.baidu.com/";
    NSURL *url=[NSURL URLWithString:strUrl];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    
    NSURLSessionTask *task=[session dataTaskWithRequest:request completionHandler:
                            ^(NSData *data,NSURLResponse *response,NSError *error){
        NSString *res=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"网络请求返回值：%@",res);
    }];
    NSLog(@"Task 状态：%lo",task.state);
    [task resume];
    NSLog(@"Task 状态：%lo",task.state);
}



-(void) afRequestFromNet{
    
    
}
@end
