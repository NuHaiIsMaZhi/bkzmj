//
//  TestViewController.m
//  CoBkzProject
//
//  Created by leo on 2018/7/23.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "TestViewController.h"
#import "TestQuestionViewController.h"
#import "loginViewController.h"
#import "AppDelegate.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.nav setNavigationBarHidden:true];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight;
    
    self.navigationItem.title = @"测试课堂";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];

    UIScrollView *mysc = [UIScrollView new];
    mysc.alwaysBounceVertical = YES;
    [self.view addSubview:mysc];
    mysc.sd_layout.
    topSpaceToView(self.view, 0).
    leftSpaceToView(self.view, 0).
    rightSpaceToView(self.view, 0).
    bottomSpaceToView(self.view, 0);
    
    UIImageView *imagevew = [UIImageView new];
    imagevew.userInteractionEnabled = YES;
    imagevew.image = [UIImage imageNamed:@"WechatIMG3@2x.jpeg"];
    [mysc addSubview:imagevew];
    imagevew.sd_layout.
    topSpaceToView(mysc, 0).
    leftSpaceToView(mysc, 0).
    rightSpaceToView(mysc, 0).
    bottomSpaceToView(mysc, 0);
    
    UIView *base = [UIView new];
    base.userInteractionEnabled = YES;
    base.backgroundColor = UIColor.whiteColor;
    base.layer.cornerRadius = 6;
    [imagevew addSubview:base];
    base.sd_layout.
    topSpaceToView(imagevew, 64+0).
    heightIs(160).
    leftSpaceToView(imagevew, 15).
    rightSpaceToView(imagevew, 15);
    
    UILabel *middonlabel = [UILabel new];
    middonlabel.textAlignment = NSTextAlignmentCenter;
    middonlabel.backgroundColor = RGB2UIColor(105, 195, 173);
    middonlabel.text = @"ABC";
    middonlabel.textColor = UIColor.whiteColor;
    middonlabel.font = [UIFont boldSystemFontOfSize:25];
    [base addSubview:middonlabel];
    middonlabel.sd_layout.
    centerYEqualToView(base).
    widthIs(160).
    leftSpaceToView(base, 45).
    heightIs(40);
    middonlabel.sd_cornerRadiusFromHeightRatio = @0.5;
    
    UILabel *topLabel = [UILabel new];
    topLabel.backgroundColor = RGB2UIColor(225, 225, 225);
    [base addSubview:topLabel];
    topLabel.sd_layout.
    topSpaceToView(base, 31).
    centerXEqualToView(middonlabel).
    widthIs(110).
    heightIs(23);
    topLabel.sd_cornerRadiusFromHeightRatio = @0.5;

    UILabel *bottomLabel = [UILabel new];
    bottomLabel.backgroundColor = RGB2UIColor(225, 225, 225);
    [base addSubview:bottomLabel];
    bottomLabel.sd_layout.
    topSpaceToView(middonlabel, 5).
    centerXEqualToView(middonlabel).
    widthIs(110).
    heightIs(23);
    bottomLabel.sd_cornerRadiusFromHeightRatio = @0.5;
    
    UILabel *textlabel = [UILabel new];
    textlabel.textAlignment = NSTextAlignmentCenter;
    textlabel.text = @"单词测试";
    textlabel.textColor = RGB2UIColor(105, 195, 173);
    textlabel.font = [UIFont boldSystemFontOfSize:27];
    [base addSubview:textlabel];
    textlabel.sd_layout.
    centerYEqualToView(base).
    leftSpaceToView(middonlabel, 20).
    autoHeightRatio(0);
    textlabel.sd_maxWidth = @320;
    
    UILabel *remindText = [UILabel new];
    remindText.textAlignment = NSTextAlignmentCenter;
    remindText.text = @"———  更多复习功能，即将上线!  ———";
    remindText.textColor = RGB2UIColor(225, 225, 225);
    remindText.font = [UIFont systemFontOfSize:16];
    [imagevew addSubview:remindText];
    remindText.sd_layout.
    topSpaceToView(base, 20).
    centerXEqualToView(base).
    autoHeightRatio(0);
    remindText.sd_maxWidth = @320;
    
    UITapGestureRecognizer *pan = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(testSelectAciton)];
    [base addGestureRecognizer:pan];
    
    UIButton *singoutbtn = [UIButton new];
    [singoutbtn setTitle:@"退出" forState:UIControlStateNormal];
    [singoutbtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    singoutbtn.titleLabel.font = [UIFont systemFontOfSize:16];
    singoutbtn.backgroundColor = RGB2UIColor(255, 91, 96);
    [self.view addSubview:singoutbtn];
    singoutbtn.sd_layout.
    bottomSpaceToView(self.view, 20).
    heightIs(55).
    leftSpaceToView(self.view, 20).
    rightSpaceToView(self.view, 30);
    singoutbtn.sd_cornerRadius = @4;
    [singoutbtn addTarget:self action:@selector(singoutaction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)testSelectAciton{
    
    TestQuestionViewController *queVC = [TestQuestionViewController new];
    [self.navigationController pushViewController:queVC animated:YES];    
}

- (void)singoutaction{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.nav pushViewController:[[loginViewController alloc]init] animated:YES];
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
