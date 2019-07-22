//
//  baseViewController.m
//  CoBkzProject
//
//  Created by HSBC on 2019/7/19.
//  Copyright © 2019 leo. All rights reserved.
//

#import "baseViewController.h"

@interface baseViewController ()

@end

@implementation baseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui@2x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
//    self.navigationItem.backBarButtonItem = backItem;
    
    // Do any additional setup after loading the view.
}

- (void)backAction{
    
    [self.navigationController popViewControllerAnimated:YES];
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
