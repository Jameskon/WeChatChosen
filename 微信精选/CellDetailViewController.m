//
//  CellDetailViewController.m
//  微信精选
//
//  Created by kai on 16/1/26.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import "CellDetailViewController.h"
#import <WebKit/WebKit.h>

@interface CellDetailViewController ()
@property (nonatomic,strong) WKWebView *myWeb;

@end

@implementation CellDetailViewController


- (instancetype)initWithUrl:(NSURL *)url andSubTitle:(NSString *)subtitle
{
    if (self = [super init]) {
        _articalUrl = url;
        _subTitle = subtitle;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.subTitle;
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
    _myWeb = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:config];
    [_myWeb loadRequest:[NSURLRequest requestWithURL:self.articalUrl]];
    [self.view addSubview:self.myWeb];
    self.navigationItem.leftBarButtonItem.title = @"思佳啊";

}

//  隐藏状态栏
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

- (void)back:(id)sender
{
//    [self dismissViewControllerAnimated:YES completion:^{
//    }];
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
    } ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
