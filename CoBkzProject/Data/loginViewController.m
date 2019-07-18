//
//  loginViewController.m
//  CoBkzProject
//
//  Created by HSBC on 2019/7/17.
//  Copyright © 2019 leo. All rights reserved.
//

#import "loginViewController.h"
#import "AppDelegate.h"
#import "WSLoginView.h"
#import "registerViewController.h"

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
        
        
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [wsLoginV setRegisterblock:^{
       
        [self.navigationController pushViewController:[registerViewController new] animated:YES];
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
