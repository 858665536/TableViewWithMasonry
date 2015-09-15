//
//  ViewController.m
//  TestTableViewWithMasonry
//
//  Created by ShangHai on 15/9/12.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import <Masonry/Masonry.h>
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (assign, nonatomic) CGFloat cellHeight; //缓存高度
@property (strong, nonatomic)  TableViewCell *myCell;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.myTableView.rowHeight = UITableViewAutomaticDimension;
//    self.myTableView.estimatedRowHeight = 80; //减少第一次计算量，iOS7后支持
    // Do any additional setup after loading the view, typically from a nib.
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  self.myCell =  [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    [cell configCell];
//    self.cellHeight = cell.cellHeight;
    return self.myCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    
    TableViewCell *cell = self.myCell;
    
//    [self setupCell:cell AtIndexPath:indexPath];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), 1000);
    
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize].height;
    
    return height + 1;
//     model.cellHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
//    return self.cellHeight;
//    return UITableViewAutomaticDimension;
}
@end
