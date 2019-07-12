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

@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController{
    
    ViewController *vc;
    TestViewController *v2;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createTabControllers];
    
    [self createTabbar];
    
    self.view.backgroundColor = UIColor.whiteColor;
}

-(void)createTabControllers{
    
    vc = [[ViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc];

    v2 = [[TestViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:v2];
    
    NSMutableArray* viewControllers = [[NSMutableArray alloc] init];
    [viewControllers addObject:nav1];
    [viewControllers addObject:nav2];

    self.viewControllers = viewControllers;
}

- (void)createTabbar{
    
    UITabBarItem *exeItem = [self.tabBar.items objectAtIndex:0];
    [exeItem setTitle:@"首页"];
    [exeItem setImage: [UIImage imageNamed:@"shouye"]];
    [exeItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB2UIColor(150, 150, 150),NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [exeItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB2UIColor(255, 91, 96),NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    UITabBarItem *testItem = [self.tabBar.items objectAtIndex:1];
    [testItem setTitle:@"测试"];
    [testItem setImage: [UIImage imageNamed:@"ceshi"]];
    [testItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB2UIColor(150, 150, 150),NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [testItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:RGB2UIColor(255, 91, 96),NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
