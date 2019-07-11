//
//  WordListViewController.m
//  CoBkzProject
//
//  Created by leo on 2018/6/25.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "WordListViewController.h"
#import "WordListTableViewCell.h"
#import "MyWordViewController.h"

@interface WordListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain)UITableView *wodeTableView;

@end

@implementation WordListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"第%ld组",_index];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _wodeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _wodeTableView.dataSource = self;
    _wodeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _wodeTableView.delegate = self;
    _wodeTableView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_wodeTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%ld",(long)[indexPath row]];//以indexPath来唯一确定cell
    WordListTableViewCell *cell = (WordListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[WordListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *wordDict = _dataSource[indexPath.row];
    cell.dict = wordDict;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyWordViewController *myViewVC = [[MyWordViewController alloc]init];
    myViewVC.dataSourceArray = _dataSource;
    myViewVC.index = indexPath.row;
    myViewVC.number = _index;
    [self.navigationController pushViewController:myViewVC animated:YES];    
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
