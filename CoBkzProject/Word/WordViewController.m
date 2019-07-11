//
//  WordViewController.m
//  CoBkzProject
//
//  Created by leo on 2018/6/20.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "WordViewController.h"
#import "SVProgressHUD.h"
#import "AFHTTPRequestOperation.h"
#import "DownWordObject.h"
#import "WordCollectionViewCell.h"
#import "WordListViewController.h"

@interface WordViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, retain) AFURLConnectionOperation *operation;
@property (nonatomic, retain) UIView *downloadView;
@property (nonatomic,retain)UICollectionView *wodeCollectionView;

@end

@implementation WordViewController{
    
    int gorupPerNum;
    DownWordObject *downObject;
    NSArray *dataSourceArray;
}

- (id)init{
    
    if (self = [super init]) {
        
        self.hidesBottomBarWhenPushed = YES;
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"记单词";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
  
    self.wodeCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    
    //设置代理
    self.wodeCollectionView.delegate = self;
    self.wodeCollectionView.dataSource = self;
    self.wodeCollectionView.backgroundColor = [UIColor whiteColor];
    self.wodeCollectionView.alwaysBounceVertical = YES;
    self.wodeCollectionView.alwaysBounceHorizontal = NO;
    [self.view addSubview:self.wodeCollectionView];
    
    //注册cell和ReusableView（相当于头部）
    [self.wodeCollectionView registerClass:[WordCollectionViewCell class] forCellWithReuseIdentifier:@"muCell"];
    
    [self setupDownloadView];

    gorupPerNum = 50;
    downObject = [DownWordObject singleDownObject];
    __block WordViewController *blockSelf = self;
    [downObject setDownWordSuccess:^(NSArray *wordArray) {
        
        [blockSelf sucess:wordArray];
    }];
    [downObject setDownWordFaile:^{
        
        [blockSelf faile];
    }];
    [downObject checkDBFile];
}

- (void)sucess:(NSArray*)array{
    
    _downloadView.hidden = YES;
    dataSourceArray = array;
    [self.wodeCollectionView reloadData];
}

- (void)faile{
    
    _downloadView.hidden = NO;
}

-(void)setupDownloadView{
    
    [SVProgressHUD dismiss];
    
    _downloadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _downloadView.backgroundColor = [UIColor whiteColor];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, self.view.frame.size.width - 40, 88)];
    lable.font = [UIFont systemFontOfSize:15.0f];
    lable.textColor = [UIColor blackColor];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.numberOfLines = 0;
    lable.text = @"我们需要下载单词数据库，这样会消耗您的流量。继续么？";
    
    UIButton *downloadButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 190/2, lable.frame.size.height+lable.frame.origin.y+30, 190, 44)];
    [downloadButton.layer setMasksToBounds:YES];
    [downloadButton.layer setBorderWidth:1.0f];
    [downloadButton.layer setBorderColor:[UIColor redColor].CGColor];
    [downloadButton.layer setCornerRadius:22.0];
    downloadButton.backgroundColor = [UIColor clearColor];
    [downloadButton setTitle:@"下载" forState:UIControlStateNormal];
    [downloadButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    downloadButton.titleLabel.font = [UIFont systemFontOfSize:19.0];
    [downloadButton addTarget:self action:@selector(startDownload:) forControlEvents:UIControlEventTouchUpInside];
    
    [_downloadView addSubview:lable];
    [_downloadView addSubview:downloadButton];
    _downloadView.hidden = YES;
    
    [self.view addSubview:_downloadView];
}

-(void)startDownload:(id)sender{
    
    [downObject downWordAction];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSInteger number = 0;

    if (dataSourceArray) {
        if (dataSourceArray.count %gorupPerNum != 0)
            number = dataSourceArray.count/gorupPerNum +1;
        else
            number = dataSourceArray.count/gorupPerNum;
    }
    
    return number;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identify = @"muCell";
    WordCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    
    cell.grouplabel.text = [NSString stringWithFormat:@"第%d组",(int)indexPath.row+1];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize collectSize = CGSizeMake(self.view.frame.size.width/4, self.view.frame.size.width/24*7);
    return collectSize;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (dataSourceArray) {
        
        NSRange range;
        NSInteger number = (indexPath.row)*gorupPerNum +dataSourceArray.count%gorupPerNum;
        if (number != dataSourceArray.count) {
            
            range = NSMakeRange(indexPath.row*gorupPerNum, gorupPerNum);
            
        }else{
            
            range = NSMakeRange(indexPath.row*gorupPerNum, dataSourceArray.count%gorupPerNum);
        }
        
        WordListViewController *listVC = [[WordListViewController alloc]init];
        listVC.dataSource = [dataSourceArray subarrayWithRange:range];
        listVC.index = indexPath.row+1;
        [self.navigationController pushViewController:listVC animated:YES];
        
    }
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
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
