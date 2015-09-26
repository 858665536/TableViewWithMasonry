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
@property (strong, nonatomic)  NSMutableArray *strArr;




@end

@implementation ViewController

- (void)viewDidLoad {
//    [super viewDidLoad];
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    self.myTableView.estimatedRowHeight = 80; //减少第一次计算量，iOS7后支持
    // Do any additional setup after loading the view, typically from a nib.
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    for (int i =0; i< 20 ;i++) {
        NSMutableString *randomString = [[NSMutableString alloc]init];
        int value = (arc4random() % 3) + 1;
        for (int i =0; i< value ;i++) {
            [randomString appendString:@"重复的文字,👿😂主要是UILabel的高度会有变化😂😂😂，所以这里主要是说说😂😂label变化时👿👿👿如何处理'"];
            
        }
        NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:randomString];
        NSRange range=NSMakeRange(0, 4);
        
        [attriString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:49] range:range];
        [self.strArr addObject:attriString];
        
    }


    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"%ld,row--%ld",(long)height+1,indexPath.row);

    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  self.myCell =  [tableView dequeueReusableCellWithIdentifier:@"cell"];
  
    //@"主要是UILabel的高度会有变化，所以这里主要是说说label变化时如何处理，设置UILabel的时候注意要设置preferredMaxLayoutWidth这个宽度，还有ContentHuggingPriority为UILayoutPriorityRequried"


    self.myCell.contentLabel.attributedText = self.strArr[indexPath.row];
    NSLog(@"cell row--%ld",indexPath.row);

    return self.myCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = self.myCell;
//    [cell setNeedsUpdateConstraints];
//    [cell updateConstraintsIfNeeded];
//    
//    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), 1000);
    
//    [cell setNeedsLayout];
//    [cell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
   
    NSLog(@"%ld,row--%ld",(long)height+1,indexPath.row);
    return height + 1;

}

-(NSMutableArray *)strArr{
    if (!_strArr) {
        _strArr = [[NSMutableArray alloc]init];
    }
    return _strArr;
}
@end
