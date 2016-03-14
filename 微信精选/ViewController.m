//
//  ViewController.m
//  微信精选
//
//  Created by kai on 16/1/26.
//  Copyright © 2016年 K.K Studio. All rights reserved.
//

#import "ViewController.h"
#define URL @"http://v.juhe.cn/weixin/query?key=93ab1ba742f619da709ade4fc487ec20"
#import "CellDetailViewController.h"
#import "MyTableViewCell.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *myTable;
@property (nonatomic,strong) NSArray *micoDatas;

@end


@implementation ViewController

#pragma mark -----------InitDatas------------

- (NSArray *)micoDatas
{
    if (!_micoDatas) {
        NSURL *url = [NSURL URLWithString:URL];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        同步
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSDictionary *subDict = [rootDict valueForKey:@"result"];
        _micoDatas = [subDict valueForKey:@"list"];
    }
    return _micoDatas;
}



#pragma mark -----------UITableViewDataSource------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.micoDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellIdentifier";
    MyTableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!myCell) {
        myCell = [[MyTableViewCell alloc]init];
    }
    
    dispatch_queue_t gobalequeue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(gobalequeue, ^{
        NSString *firstImgStr = [self.micoDatas[indexPath.row] valueForKeyPath:@"firstImg"];
        UIImage *firstImg = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:firstImgStr]]];
        
        NSString *title =  [self.micoDatas[indexPath.row] valueForKeyPath:@"title"];
        
        NSString *source = [self.micoDatas[indexPath.row] valueForKeyPath:@"source"];
        
        NSString *idStrings = [self.micoDatas[indexPath.row]valueForKeyPath:@"id"];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            myCell.titleLabel.text = title;
            myCell.sourceLabel.text = source;
            myCell.headerImageView.image = firstImg;
            myCell.idLabel.text = idStrings;

        });
    });
    return myCell;
}

#pragma mark -----------UITableViewDelegate------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    CellDetailViewController *cdvc = [[CellDetailViewController alloc]initWithUrl:[NSURL URLWithString:[self.micoDatas[indexPath.row] valueForKeyPath:@"url"]]];

//    CellDetailViewController *cdvc = [[CellDetailViewController alloc]initWithUrl:[NSURL URLWithString:[self.micoDatas[indexPath.row] valueForKeyPath:@"url"]] andSubTitle:[[self.micoDatas][indexPath.row]valueForKeyPath:@"source"]];
    
    CellDetailViewController *cdvc = [[CellDetailViewController alloc]initWithUrl:[NSURL URLWithString:[self.micoDatas[indexPath.row]valueForKey:@"url"]] andSubTitle:[self.micoDatas[indexPath.row] valueForKeyPath:@"source"]];
    [self.navigationController pushViewController:cdvc animated:YES];
}

//  隐藏状态栏
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:self];
    [UIApplication sharedApplication].delegate.window.rootViewController = navi;
    self.title = @"微信热门";
    
    // 设置footerView
    self.myTable.tableFooterView = [[UIView alloc]init];
    // 设置颜色
    UIColor *color = [UIColor whiteColor];
    // 将颜色加入字典
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:UITextAttributeTextColor];
    // 设置应用
    self.navigationController.navigationBar.titleTextAttributes = dict;
    
//    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    
    // 设置bar颜色
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
//    [UIApplication sharedApplication]setStatusBarStyle:<#(UIStatusBarStyle)#>
    
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
//    NSURL *url = [NSURL URLWithString:URL];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    _micoDatas = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
