//
//  MyTableViewCell.h
//  微信精选
//
//  Created by kai on 16/1/27.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *headerImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *sourceLabel;
@property (strong, nonatomic) IBOutlet UILabel *idLabel;

- (instancetype)initWithHeaderImage :(UIImageView *)image andtitle :(UILabel *)title andsource:(UILabel *)source andidLabel:(UILabel *)idLabel;

@end
