//
//  ViewController.m
//  CoBkzProject
//
//  Created by leo on 2018/6/19.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "ViewController.h"
#import "TodayTaskView.h"
#import "SDAutoLayout.h"
#import "TaskListView.h"
#import "EveryDayView.h"
#import "WordViewController.h"
#import "NetWorkRequest.h"
#import "TopView.h"
#import "ModelData.h"
#import "NSObject+JSONExtension.h"

#define RGB2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0)  alpha:1]

@interface ViewController ()

@end

@implementation ViewController{
    
    UIScrollView *baseScrollView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeRight;
    
    self.title = @"学习主页";
    
    baseScrollView = [UIScrollView new];
    baseScrollView.alwaysBounceVertical = YES;
    baseScrollView.alwaysBounceHorizontal = NO;
    baseScrollView.showsVerticalScrollIndicator = NO;
    baseScrollView.showsHorizontalScrollIndicator = NO;
    baseScrollView.backgroundColor = RGB2UIColor(246, 246, 246);
    [self.view addSubview:baseScrollView];
    
    baseScrollView.sd_layout.
    topSpaceToView(self.view, 0).
    leftSpaceToView(self.view, 0).
    rightSpaceToView(self.view, 0).
    bottomSpaceToView(self.view, 0);
    
    [self loadRequestion];
    
    int arrayName[4] = {10, 20, 30, 40};
    
    NSLog(@"%p %p", arrayName, arrayName + 1);
    NSLog(@"%p %p", &arrayName, &arrayName + 1);
    
    int *p = (int *)(&arrayName + 1);
    NSLog(@"%d", *(p - 1));//输出结果为 40
    
//    NSString *str1 = @"222";
//    NSString const *str2 = @"333";
//    NSLog(@"str1:%X  str2:%X",str1,str2);
//    str2 = str1;
//    NSLog(@"str1:%X  str2:%X",str1,str2);
    
//    NSMutableString *str = [@"string1" mutableCopy];
//    NSMutableString *str2 = str;
//    NSLog(@"str1:%X  str2:%X",str,str2);
    
    int x = 20;
//    int y = 150;
//    printf("%p\n",&x);
//    printf("%lu\n",&x);

//    *((int *)(&x)) = 22;
//    printf("(%d,%d)\n",x,y);
    
//    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(queue, ^{
//
//        [self asyncSerial];
//    });
    
//    [self demo2];
    
    NSDictionary *info = @{@"title": @"标题", @"name": @"dada", @"test": @"hello"};
    ModelData *model = [[ModelData alloc]initWithDictionary:info];
    NSLog(@"%@", model.title);     // 输出：标题
    NSLog(@"%@", model.name);     // 输出：dada
}

- (void)signel{
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
    
    long  w = dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"wwwwwwww:%ld",w);
    
    dispatch_semaphore_t signal = dispatch_semaphore_create(1);
    
    __block long x = 0;
    NSLog(@"0_x:%ld",x);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        NSLog(@"waiting");
        
        //此时信号量为0 对signal增加1 信号量变为1，
        x = dispatch_semaphore_signal(signal);
        NSLog(@"1_x:%ld",x);
        
        sleep(2);
        NSLog(@"waking");
        
        x = dispatch_semaphore_signal(signal);
        NSLog(@"2_x:%ld",x);
    });
    
    //此时信号量为1 所以执行下边，对signal减掉1，然后信号量为0
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    NSLog(@"3_x:%ld",x);
    
    //此时信号量为0，永远等待，在等待的时候执行block了，在等待block时候block内对信号量增加了1，然后开始执行下边，并且信号量再次减掉1 变为0
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    NSLog(@"wait 2");
    NSLog(@"4_x:%ld",x);
    
    //此时信号量为0，永远等待，在等待的时候执行block了，在等待block时候block内对信号量增加了1，然后开始执行下边，并且信号量再次减掉1 变为0
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    
    NSLog(@"wait 3");
    NSLog(@"5_x:%ld",x);
    
    sleep(2);
    
    x = dispatch_semaphore_signal(signal);
    NSLog(@"6_x:%ld",x);
}

- (void)asyncSerial {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    NSLog(@"asyncSerial---begin");
    dispatch_queue_t queue = dispatch_get_main_queue();

    dispatch_sync(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            NSLog(@"1---%@",[NSThread currentThread]); // 打印当前线程
        }
    });
    dispatch_sync(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            NSLog(@"2---%@",[NSThread currentThread]); // 打印当前线程
        }
    });
    dispatch_sync(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            NSLog(@"3---%@",[NSThread currentThread]); // 打印当前线程
        }
    });
    NSLog(@"asyncSerial---end");
}
- (void)loadRequestion{
    
    NSString *urlStr = @"https://tai.beikaozu.com/users/machine/memory/list?pageid=1&product=ielts&platform=ios&pagesize=20&terminal=student&version=1.1.0&token=3d60ad21457d7a981e7ba3a01712559b";
    [NetWorkRequest getDataShowHUD:YES withUrl:urlStr parameter:nil andResponse:^(NSInteger code, id contentData, NSDictionary *exData) {
        
        [self buildUI:contentData];        
    }];
}

- (void)buildUI:(NSArray *)listArray{
    
    TopView *topView = [[TopView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    topView.backgroundColor = [UIColor whiteColor];
    [baseScrollView addSubview:topView];
    topView.sd_layout.
    topSpaceToView(baseScrollView, 0).
    leftSpaceToView(baseScrollView, 0).
    rightSpaceToView(baseScrollView, 0);
    
    TodayTaskView *dayTaskView = [[TodayTaskView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    dayTaskView.vc = self;
    dayTaskView.backgroundColor = [UIColor whiteColor];
    [baseScrollView addSubview:dayTaskView];
    dayTaskView.sd_layout.
    topSpaceToView(topView, 10).
    leftSpaceToView(baseScrollView, 0).
    rightSpaceToView(baseScrollView, 0);
    
    UITapGestureRecognizer *pan = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gotoWordVC)];
    [dayTaskView addGestureRecognizer:pan];
    
    TaskListView *listView = [[TaskListView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)withArray:listArray withSuperView:self];
    listView.userInteractionEnabled = YES;
    listView.backgroundColor = [UIColor whiteColor];
    [baseScrollView addSubview:listView];
    listView.sd_layout.
    topSpaceToView(dayTaskView, 1).
    leftSpaceToView(baseScrollView, 0).
    rightSpaceToView(baseScrollView, 0);

    [baseScrollView setupAutoContentSizeWithBottomView:listView bottomMargin:20];

}

- (void)gotoWordVC{
    
    WordViewController *VC = [[WordViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
