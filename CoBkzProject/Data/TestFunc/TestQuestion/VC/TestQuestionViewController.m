//
//  TestQuestionViewController.m
//  CoBkzProject
//
//  Created by leo on 2018/8/9.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "TestQuestionViewController.h"
#import "QuestionRequestion.h"
#import "QuestionView.h"
#import "SaveObjeModel.h"

@interface TestQuestionViewController ()<UIScrollViewDelegate>

@end

@implementation TestQuestionViewController{
    
    UIScrollView *myScrollView;
    
    QuestionView *lastQuestionView;
    QuestionView *questionView;
    QuestionView *nextQuestionView;
    
    UILabel *firstView;
    UILabel *twoView;
    UILabel *thenView;
    
    NSInteger pageNumber;
    
    NSArray *dataSourceArray;
    NSMutableArray *modelArray;
}

- (id)init{
    
    if (self = [super init]) {
        
        self.hidesBottomBarWhenPushed = YES;
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout =  UIRectEdgeLeft | UIRectEdgeRight;
    
    myScrollView=[UIScrollView new];
    myScrollView.delegate = self;
    myScrollView.pagingEnabled = YES;
    myScrollView.showsHorizontalScrollIndicator = FALSE;
    myScrollView.showsVerticalScrollIndicator = FALSE;
    myScrollView.contentSize = CGSizeMake(UI_SCREEN_WIDTH*3, 0);
    [myScrollView setContentOffset:CGPointMake(UI_SCREEN_WIDTH, 0) animated:NO];
    [self.view addSubview:myScrollView];
    myScrollView.sd_layout.
    topSpaceToView(self.view, 0).
    leftSpaceToView(self.view, 0).
    rightSpaceToView(self.view, 0).
    bottomSpaceToView(self.view, 0);
    
    pageNumber = 0;
    modelArray = [[NSMutableArray alloc]init];
    
    [QuestionRequestion getQueStionData:^(NSDictionary *dict) {
       
        [self filtrationData:dict[@"words"]];
    }];    
}

- (void)filtrationData:(NSArray *)dataArray{
    
    NSMutableArray *tempArray = [NSMutableArray new];
    
    dispatch_queue_t queue = dispatch_queue_create("FINDOPTIONDATA", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        
        [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            if ([obj objectForKey:@"groups"] != nil && [obj objectForKey:@"groups"] != NULL && [[obj objectForKey:@"groups"] isKindOfClass:[NSArray class]]) {
             
                if (((NSArray*)[obj objectForKey:@"groups"]).count > 0) {
                    
                    [tempArray addObject:obj];
                    SaveObjeModel *model = [[SaveObjeModel alloc]init];
                    [self->modelArray addObject:model];
                }
            }
            
            if (idx == dataArray.count -1) {
                
                *stop = YES;
                NSLog(@"over");
                
                dispatch_sync(dispatch_get_main_queue(), ^{

                    self->dataSourceArray = tempArray;
                    [self buildControl];
                });
            }
        }];
    });
}

- (void)buildControl{
    
    UIColor *bgcolor = GrayUIColor(240);
    
    lastQuestionView = [[QuestionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    lastQuestionView.backgroundColor = bgcolor;
    [myScrollView addSubview:lastQuestionView];
    lastQuestionView.sd_layout.
    topSpaceToView(myScrollView, 0).
    leftSpaceToView(myScrollView, 0).
    widthIs(UI_SCREEN_WIDTH).
    bottomSpaceToView(myScrollView, 0);

    questionView = [[QuestionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    questionView.backgroundColor = bgcolor;
    [myScrollView addSubview:questionView];
    questionView.sd_layout.
    topSpaceToView(myScrollView, 0).
    leftSpaceToView(lastQuestionView, 0).
    widthIs(UI_SCREEN_WIDTH).
    bottomSpaceToView(myScrollView, 0);
    [questionView setSaveModelData:modelArray[0]];
    [questionView setDictWithData:dataSourceArray[0]];

    nextQuestionView = [[QuestionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    nextQuestionView.backgroundColor = bgcolor;
    [myScrollView addSubview:nextQuestionView];
    nextQuestionView.sd_layout.
    topSpaceToView(myScrollView, 0).
    leftSpaceToView(questionView, 0).
    widthIs(UI_SCREEN_WIDTH).
    bottomSpaceToView(myScrollView, 0);
    [nextQuestionView setSaveModelData:modelArray[1]];
    [nextQuestionView setDictWithData:dataSourceArray[1]];

    __weak typeof (self)WeakSelf = self;
    
    [lastQuestionView setNextBlock:^{
        
        [WeakSelf nextScrollViewScroll];
    }];

    [questionView setNextBlock:^{
        
        [WeakSelf nextScrollViewScroll];
    }];

    [nextQuestionView setNextBlock:^{
        
        [WeakSelf nextScrollViewScroll];
    }];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger current = scrollView.contentOffset.x/UI_SCREEN_WIDTH;
   
    NSLog(@"currentPage = %ld" ,(long)current);
    
    if (current == 2) {
        
        pageNumber++;
        
        [lastQuestionView setSaveModelData:modelArray[pageNumber -1]];
        [lastQuestionView setDictWithData:dataSourceArray[pageNumber-1]];
        
        [questionView setSaveModelData:modelArray[pageNumber]];
        [questionView setDictWithData:dataSourceArray[pageNumber]];
        
        [nextQuestionView setSaveModelData:modelArray[pageNumber +1]];
        [nextQuestionView setDictWithData:dataSourceArray[pageNumber+1]];
        
    }else if(current == 0){
        
        pageNumber--;
        if (pageNumber <= 0) {
            
            return;
        }
        
        [lastQuestionView setSaveModelData:modelArray[pageNumber -1]];
        [lastQuestionView setDictWithData:dataSourceArray[pageNumber-1]];

        [questionView setSaveModelData:modelArray[pageNumber]];
        [questionView setDictWithData:dataSourceArray[pageNumber]];
        
        [nextQuestionView setSaveModelData:modelArray[pageNumber +1]];
        [nextQuestionView setDictWithData:dataSourceArray[pageNumber+1]];

    }
    
    [myScrollView setContentOffset:CGPointMake(UI_SCREEN_WIDTH, 0) animated:NO];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if((pageNumber == 0 && scrollView.contentOffset.x < myScrollView.frame.size.width)){
        
        [myScrollView setContentOffset:CGPointMake(UI_SCREEN_WIDTH, 0) animated:NO];
    }
}

- (void)nextScrollViewScroll{
    
    [self scrollViewDidEndDecelerating:myScrollView];
    [myScrollView setContentOffset:CGPointMake(UI_SCREEN_WIDTH*2, 0) animated:YES];
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
