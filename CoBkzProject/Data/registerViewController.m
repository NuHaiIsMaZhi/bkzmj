//
//  registerViewController.m
//  CoBkzProject
//
//  Created by HSBC on 2019/7/18.
//  Copyright © 2019 leo. All rights reserved.
//

#import "registerViewController.h"
#import "SVProgressHUD.h"
#import "NetWorkRequest.h"

@interface registerViewController ()

@end

@implementation registerViewController{
 
    UIButton *yanbtn;
    NSTimer *verifyTime;
    int mTime;
}

- (void)viewWillDisappear:(BOOL)animated{
 
    [super viewWillDisappear:animated];
    [verifyTime invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.backgroundColor = UIColor.whiteColor;
    
    self.title = @"注册";
    
    [self creatVisulBg];
    
    self.textField1 = [[UITextField alloc]initWithFrame:CGRectMake(20, 64+49+30, self.view.frame.size.width-40, 45)];
    self.textField1.layer.cornerRadius = 5;
    self.textField1.layer.borderWidth = .5;
    self.textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField1.layer.borderColor = [UIColor whiteColor].CGColor;
    self.textField1.placeholder = @"请输入手机号";
    self.textField1.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetHeight(self.textField1.frame), CGRectGetHeight(self.textField1.frame))];
    self.textField1.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgUser = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 22, 22)];
    imgUser.image = [UIImage imageNamed:@"iconfont-user"];
    [self.textField1.leftView addSubview:imgUser];
    [self.view addSubview:self.textField1];
    [_textField1 setValue:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.7] forKeyPath:@"_placeholderLabel.textColor"];
    
    self.textField2 = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.textField1.frame), CGRectGetMaxY(self.textField1.frame)+20, CGRectGetWidth(self.textField1.frame), CGRectGetHeight(self.textField1.frame))];
    self.textField2.layer.cornerRadius = 5;
    self.textField2.layer.borderWidth = .5;
    self.textField2.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField2.layer.borderColor = [UIColor whiteColor].CGColor;
    self.textField2.placeholder = @"请输入验证码";
    self.textField2.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetHeight(self.textField2.frame), CGRectGetHeight(self.textField2.frame))];
    self.textField2.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgPwd = [[UIImageView alloc] initWithFrame:CGRectMake(6, 6, 28, 28)];
    imgPwd.image = [UIImage imageNamed:@"duanxinyanzhengma"];
    [self.textField2.leftView addSubview:imgPwd];
    [self.view addSubview:self.textField2];
    [_textField2 setValue:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.7] forKeyPath:@"_placeholderLabel.textColor"];
    
    yanbtn = [[UIButton alloc]init];
    [yanbtn addTarget:self action:@selector(sendVerityAction) forControlEvents:UIControlEventTouchUpInside];
    [yanbtn setTitle:@"获取 " forState:UIControlStateNormal];
    [yanbtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    yanbtn.titleLabel.font = [UIFont systemFontOfSize:14];
    yanbtn.backgroundColor = RGB2UIColor(255, 91, 96);
    [self.textField2 addSubview:yanbtn];
    yanbtn.sd_layout.
    centerYEqualToView(self.textField2).
    heightIs(28).
    widthIs(80).
    rightSpaceToView(self.textField2, 10);
    yanbtn.sd_cornerRadius = @3;
    
    
    self.textField3 = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.textField1.frame), CGRectGetMaxY(self.textField2.frame)+20, CGRectGetWidth(self.textField1.frame), CGRectGetHeight(self.textField1.frame))];
    self.textField3.layer.cornerRadius = 5;
    self.textField3.layer.borderWidth = .5;
    self.textField3.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField3.layer.borderColor = [UIColor whiteColor].CGColor;
    self.textField3.placeholder = @"请输入密码";
    self.textField3.secureTextEntry = YES;
    self.textField3.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetHeight(self.textField3.frame), CGRectGetHeight(self.textField3.frame))];
    self.textField3.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* imgPwd2 = [[UIImageView alloc] initWithFrame:CGRectMake(6, 6, 28, 28)];
    imgPwd2.image = [UIImage imageNamed:@"iconfont-password"];
    [self.textField3.leftView addSubview:imgPwd2];
    [self.view addSubview:self.textField3];
    [_textField3 setValue:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.7] forKeyPath:@"_placeholderLabel.textColor"];

    UIButton *registerbtn = [UIButton new];
    registerbtn.layer.masksToBounds = YES;
    registerbtn.layer.cornerRadius = 4;
    [registerbtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerbtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    registerbtn.titleLabel.font = [UIFont systemFontOfSize:18];
    registerbtn.backgroundColor = RGB2UIColor(255, 91, 96);
    registerbtn.frame = CGRectMake(CGRectGetMinX(self.textField1.frame), CGRectGetMaxY(self.textField3.frame)+35, CGRectGetWidth(self.textField1.frame), CGRectGetHeight(self.textField1.frame)+10);
    [self.view addSubview:registerbtn];
    [registerbtn addTarget:self action:@selector(sendaction) forControlEvents:UIControlEventTouchUpInside];

    self.view.backgroundColor = RGB2UIColor(200, 200, 200);
    
    // Do any additional setup after loading the view.
}

- (void)creatVisulBg {
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    
    imageview.image = [UIImage imageNamed:@"bg.jpeg"];
    imageview.contentMode = UIViewContentModeScaleToFill;
    imageview.userInteractionEnabled = YES;
    [self.view addSubview:imageview];
    
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectview.frame = CGRectMake(0, 0, imageview.frame.size.width, imageview.frame.size.height);
    [imageview addSubview:effectview];
}

- (void)timerAdvanced:(NSTimer *)timer
{
    mTime--;
    
    if (mTime == 0)
    {
        [verifyTime invalidate];
        [yanbtn setTitle:@"重新发送" forState:UIControlStateNormal];
        yanbtn.backgroundColor = RGB2UIColor(255, 91, 96);
        [yanbtn addTarget:self action:@selector(sendVerityAction) forControlEvents:UIControlEventTouchUpInside];
        yanbtn.enabled = YES;
    }
    else
    {
        NSString *timeStr = [NSString stringWithFormat:@"%d",mTime];
        [yanbtn setTitle:timeStr forState:UIControlStateNormal];
        yanbtn.backgroundColor = GrayUIColor(167);
        [yanbtn removeTarget:self action:@selector(sendVerityAction) forControlEvents:UIControlEventTouchUpInside];
        yanbtn.enabled = NO;
    }
}
- (void)sendVerityAction{
    
    [self hiddenkey];
    if (_textField1.text.length == 0) {
        
        return  [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
    }
    
    NSMutableDictionary *postDict = [[NSMutableDictionary alloc]init];
    [postDict setObject:_textField1.text forKey:@"mobile"];
    [postDict setObject:@"reg" forKey:@"type"];

    NSString *url = @"https://v6.beikaozu.com/users/mobilecode/send/v2?";
    [NetWorkRequest postataShowHUD:YES withUrl:url parameter:postDict andResponse:^(NSInteger code, id contentData, NSDictionary *exData) {
        
        self->verifyTime = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAdvanced:) userInfo:nil repeats:YES];
        self->mTime = 60;
        [SVProgressHUD showSuccessWithStatus:@"验证码已经发送"];
    }];

}

- (void)sendaction{
 
    [self hiddenkey];
    
    if (_textField1.text.length == 0) {
        
        return  [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
    }
    if (_textField2.text.length == 0) {
        
        return  [SVProgressHUD showErrorWithStatus:@"请输入验证码"];
    }
    if (_textField3.text.length == 0) {
        
        return  [SVProgressHUD showErrorWithStatus:@"请输入密码"];
    }

    NSMutableDictionary* paratDict = [[NSMutableDictionary alloc] init];
    [paratDict setObject:_textField1.text forKey:@"mobile"];
    [paratDict setObject:_textField2.text forKey:@"mcode"];
    [paratDict setObject:_textField3.text forKey:@"password"];
    [paratDict setObject:@"appstore" forKey:@"channel"];

    NSString *pathStr = @"https://v6.beikaozu.com/users/reg/bymobile?";

    [NetWorkRequest postataShowHUD:YES withUrl:pathStr parameter:paratDict andResponse:^(NSInteger code, id contentData, NSDictionary *exData) {
       
        [SVProgressHUD showSuccessWithStatus:@"注册成功"];
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

- (void)hiddenkey{
 
    [_textField1 resignFirstResponder];
    [_textField2 resignFirstResponder];
    [_textField3 resignFirstResponder];
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
