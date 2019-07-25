//
//  loginViewController.m
//  CoBkzProject
//
//  Created by HSBC on 2019/7/17.
//  Copyright © 2019 leo. All rights reserved.
//

#import "loginViewController.h"
#import "NetWorkRequest.h"
#import "AppDelegate.h"
#import "WSLoginView.h"
#import "registerViewController.h"
#import "SVProgressHUD.h"

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewWillAppear:(BOOL)animated{
 
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
 
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    WSLoginView *wsLoginV = [[WSLoginView alloc]initWithFrame:self.view.bounds];
    wsLoginV.titleLabel.text = @"Day day up~";
    wsLoginV.hideEyesType = AllEyesHide;
    [self.view addSubview:wsLoginV];
    
    
    [wsLoginV setClickBlock:^(NSString *textField1Text, NSString *textField2Text) {
        
        [self loginactionstr:textField1Text pass:textField2Text];
    }];
    [wsLoginV setRegisterblock:^{
       
        [self.navigationController pushViewController:[registerViewController new] animated:YES];
    }];
}

- (void)loginactionstr:(NSString*)str pass:(NSString*)str2{
    
    
    NSString *urlStr = @"https://v6.beikaozu.com/users/login/v2?platform=ios&version=4.4.3&terminal=student";
    NSMutableDictionary* postDict = [[NSMutableDictionary alloc] init];
    if (str.length == 0) {
        
        return [SVProgressHUD showErrorWithStatus:@"请输入账号"];
    }
    if (str2.length == 0) {
        
        return [SVProgressHUD showErrorWithStatus:@"请输入密码"];
    }
    [postDict setObject:str forKey:@"user"];
    [postDict setObject:str2 forKey:@"password"];

    [NetWorkRequest postataShowHUD:YES withUrl:urlStr parameter:postDict andResponse:^(NSInteger code, id contentData, NSDictionary *exData) {
        
        [self.navigationController popViewControllerAnimated:YES];
        [[NSUserDefaults standardUserDefaults] setObject:@"mjjjj" forKey:@"mjjjj"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }];
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
