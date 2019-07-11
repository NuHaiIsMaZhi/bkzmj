//
//  GroupViewController.m
//  CoBkzProject
//
//  Created by leo on 2018/8/9.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "GroupViewController.h"
#import "GroupTableViewCell.h"

@interface GroupViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation GroupViewController{
    
    UITableView *myTableView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"讨论组";
    
    self.view.backgroundColor = [UIColor greenColor];
    
    [self buildTableView];
}

- (void)buildTableView{
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    myTableView.sd_layout.
    topSpaceToView(self.view, 0).
    bottomSpaceToView(self.view, 0).
    leftSpaceToView(self.view, 0).
    rightSpaceToView(self.view, 0);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 210;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifiStr = @"identifiStr";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifiStr];
    
    if (cell == nil) {
        
        cell = [[GroupTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifiStr];
        cell.selectionStyle = 0;
    }
    
    cell.backgroundColor = UIColor.whiteColor;
    
    return cell;
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
