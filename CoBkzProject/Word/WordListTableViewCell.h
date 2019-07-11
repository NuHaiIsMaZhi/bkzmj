//
//  WordListTableViewCell.h
//  CoBkzProject
//
//  Created by leo on 2018/6/25.
//  Copyright © 2018年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordListTableViewCell : UITableViewCell

@property(nonatomic,retain)NSDictionary *dict;
@property(nonatomic,retain)UILabel *oneLabel;
@property(nonatomic,retain)UILabel* twoLabel;
@property(nonatomic,retain)UIView* lineView;

@end
