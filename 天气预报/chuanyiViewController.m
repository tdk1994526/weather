//
//  chuanyiViewController.m
//  天气预报
//
//  Created by wanhe31 on 15/10/22.
//  Copyright © 2015年 wanhe31. All rights reserved.
//

#import "chuanyiViewController.h"

@interface chuanyiViewController ()

@end

@implementation chuanyiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      [self.navigationController.navigationBar setHidden:NO];
    [self.tabBarController.tabBar setHidden:YES ];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"qwewq.jpg"]];
    
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
}

- (void)viewWillLayoutSubviews  {
    [super viewWillLayoutSubviews];
    CGRect frame = self.view.frame;
    
    //[self.view setFrame:CGRectMake(0, 0, frame.size.width , frame.size.height + 60)];
}

- (IBAction)dayu40:(id)sender {
    UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"天气高温，请停止户外露天作业，落实防暑降温措施" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [a show];

}
- (IBAction)dayu35:(id)sender {
    UIAlertView *b=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"天气炎热，不宜户外运动，适宜短袖短裤等夏季服装" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [b show];
}
- (IBAction)action2534:(id)sender {
    UIAlertView *c=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"天气微热，建议薄长袖，短衣短袖等夏季服装" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [c show];
}
- (IBAction)action1524:(id)sender {
    UIAlertView *d=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"天气暖和，适宜薄长袖，牛仔裤夹克等秋季服装" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [d show];
}
- (IBAction)action514:(id)sender {
    UIAlertView *e=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"天气微凉，建议外套，一到两件羊毛衫，大衣等春季服装" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [e show];
}
- (IBAction)action54:(id)sender {
    UIAlertView *f=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"天气较冷，建议羽绒服，秋衣秋裤大衣等冬季服装" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [f show];
}
- (IBAction)action5:(id)sender {
    UIAlertView *g=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"天气寒冷，建议厚棉袄，羽绒服毛衣多件冬季服装" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [g show];
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
