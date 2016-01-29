//
//  CellDetailViewController.h
//  微信精选
//
//  Created by kai on 16/1/26.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellDetailViewController : UIViewController

@property (nonatomic,strong) NSURL *articalUrl;
@property (nonatomic,strong) NSString *subTitle;


- (instancetype)initWithUrl:(NSURL *)url andSubTitle:(NSString *)subtitle;

@end
