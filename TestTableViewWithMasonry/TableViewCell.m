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
    
    NSMutableString *randomString = [[NSMutableString alloc]init];
     int value = (arc4random() % 6) + 1;
    for (int i =0; i< value ;i++) {
        [randomString appendString:@"重复的文字===='主要是UILabel的高度会有变化，所以这里主要是说说label变化时如何处理'"];
    }
    //@"主要是UILabel的高度会有变化，所以这里主要是说说label变化时如何处理，设置UILabel的时候注意要设置preferredMaxLayoutWidth这个宽度，还有ContentHuggingPriority为UILayoutPriorityRequried"
    self.contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.contentLabel.text = randomString;
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.preferredMaxLayoutWidth = maxWidth;
    
    self.contentLabel.backgroundColor = [UIColor redColor];
    
    
    [self.contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)configCell{
   
    self.cellHeight = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
//    [self.contentLabel sizeToFit];
//    self.cellHeight = self.contentLabel.frame.size.height;

}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(20);
        make.left.equalTo(self.contentView).with.offset(10);
        make.right.equalTo(self.contentView).with.offset(-10);
        make.bottom.equalTo(self.contentView).offset(-20);
        
        //        make.edges.lessThanOrEqualTo(self.view).insets(UIEdgeInsetsMake(80, 10, -10, 0));
        
        
    }];

    [super layoutSubviews];
//    
//    [self setNeedsUpdateConstraints];
//    [self updateConstraintsIfNeeded];
}

// If you are not using auto layout, override this method
//- (CGSize)sizeThatFits:(CGSize)size
//{
//    CGFloat totalHeight = 0;
//    totalHeight += [self.contentLabel sizeThatFits:size].height;
////    totalHeight += [self.contentLabel sizeThatFits:size].height;
////    totalHeight += [self.contentImageView sizeThatFits:size].height;
////    totalHeight += [self.usernameLabel sizeThatFits:size].height;
////    totalHeight += 40; // margins
//    return CGSizeMake(size.width, totalHeight);
//}

@end
