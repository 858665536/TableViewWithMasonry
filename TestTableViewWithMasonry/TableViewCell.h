//
//  TableViewCell.h
//  TestTableViewWithMasonry
//
//  Created by ShangHai on 15/9/12.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property(copy,nonatomic)NSString *str;
@property (assign, nonatomic) CGFloat cellHeight; //缓存高度
-(void)configCell;
@end
