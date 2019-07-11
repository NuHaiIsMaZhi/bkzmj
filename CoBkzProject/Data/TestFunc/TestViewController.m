//
//  TestViewController.m
//  CoBkzProject
//
//  Created by leo on 2018/7/23.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "TestViewController.h"
#import "TestQuestionViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    AddTestBtn(self)
    
}

- (void)testSelectAciton{
    
    TestQuestionViewController *queVC = [TestQuestionViewController new];
    [self.navigationController pushViewController:queVC animated:YES];    
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
