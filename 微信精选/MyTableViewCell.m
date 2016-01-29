//
//  MyTableViewCell.m
//  微信精选
//
//  Created by kai on 16/1/27.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithHeaderImage :(UIImageView *)image andtitle :(UILabel *)title andsource:(UILabel *)source andidLabel:(UILabel *)idLabel
{
    if (self = [super init]) {
        _headerImageView = image;
        _titleLabel.text = title.text;
        _sourceLabel.text = source.text;
        _idLabel.text = idLabel.text;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
