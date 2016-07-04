//
//  shejiaoViewController.m
//  天气预报
//
//  Created by wanhe31 on 15/10/22.
//  Copyright © 2015年 wanhe31. All rights reserved.
//

#import "shejiaoViewController.h"

@interface shejiaoViewController ()

@end

@implementation shejiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      [self.navigationController.navigationBar setHidden:NO];
     [self.tabBarController.tabBar setHidden:YES];
    // Do any additional setup after loading the view.
}
- (IBAction)weibo:(id)sender {
    NSString *xinlang = [NSString stringWithFormat:@"http://weibo.com"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:xinlang]];
}
- (IBAction)weixin:(id)sender {
    NSString *tengxun = [NSString stringWithFormat:@"http://t.qq.com"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:tengxun]];
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
