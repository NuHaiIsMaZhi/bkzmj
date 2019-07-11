//
//  JIjiViewController.m
//  CoBkzProject
//
//  Created by leo on 2018/6/26.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "JIjiViewController.h"

@interface JIjiViewController ()

@end

@implementation JIjiViewController{
    
    UIWebView *_webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"机经练习";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 0)];
    [_webView setScalesPageToFit:YES];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
    _webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_webView];

    // Do any additional setup after loading the view.
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
