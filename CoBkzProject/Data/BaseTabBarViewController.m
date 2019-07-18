//
//  BaseTabBarViewController.m
//  CoBkzProject
//
//  Created by leo on 2018/7/23.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "ViewController.h"
#import "TestViewController.h"
#import "GroupViewController.h"
#import "loginViewController.h"

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    BOOL islogin = NO;

    [self createTabControllers];
    
    [self createTabbar];
    
    self.view.backgroundColor = UIColor.whiteColor;    
}

-(void)createTabControllers{
    
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc];
    
    TestViewController *v2 = [[TestViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:v2];
    
    NSMutableArray* viewControllers = [[NSMutableArray alloc] init];
    [viewControllers addObject:nav1];
    [viewControllers addObject:nav2];
    
    self.viewControllers = viewControllers;
}

- (void)createTabbar{
    
    UITabBarItem *exeItem = [self.tabBar.items objectAtIndex:0];
    [exeItem setImage:[UIImage imageNamed:@"home"]];
    [exeItem setTitle:@"首页"];
    [exeItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB2UIColor(255, 92, 97),NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [exeItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB2UIColor(110, 110, 110),NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    UITabBarItem *testItem = [self.tabBar.items objectAtIndex:1];
    [testItem setTitle:@"测试"];
    [testItem setImage:[UIImage imageNamed:@"ceshi"]];
    [testItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB2UIColor(255, 92, 97),NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [testItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB2UIColor(110, 110, 110),NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];

//    UITabBarItem *groupItem = [self.tabBar.items objectAtIndex:2];
//    [groupItem setTitle:@"讨论组"];
//    [groupItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
//    [groupItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
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
