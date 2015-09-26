//
//  TableViewCell.m
//  TestTableViewWithMasonry
//
//  Created by ShangHai on 15/9/12.
//  Copyright (c) 2015年 yy. All rights reserved.
//

#import "TableViewCell.h"
#import <Masonry/Masonry.h>
@interface TableViewCell()



@end
@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    
    if ( self ) {
        

    }
 return self;
}
- (void)awakeFromNib {
    // Initialization code
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width - 10 * 2;
    
        self.contentLabel.numberOfLines = 0;
    self.contentLabel.preferredMaxLayoutWidth = maxWidth;
    
    self.contentLabel.backgroundColor = [UIColor lightGrayColor];
    self.contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
//    self.contentLabel.text = randomString;
    
    [self.contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(20);
        make.left.equalTo(self.contentView).with.offset(10);
        make.right.equalTo(self.contentView).with.offset(-10);
        make.bottom.equalTo(self.contentView).offset(-20);
    }];

}
//- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize {
//    CGSize size = [super systemLayoutSizeFittingSize:targetSize];
////    self.lastHeight = size.height;
//    //NSLog(@"systemLayoutSizeFittingSize(%@) = height:%f",NSStringFromCGSize(targetSize), self.lastHeight);
//    return size;
//}
@end
