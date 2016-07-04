//
//  mineViewController.m
//  天气预报
//
//  Created by wanhe31 on 15/10/21.
//  Copyright © 2015年 wanhe31. All rights reserved.
//

#import "mineViewController.h"
#import <UIKit/UIKit.h>
#import "OTCover.h"
#import "chuanyiViewController.h"




#import "shejiaoViewController.h"
#import "shezhiqitaViewController.h"

@interface mineViewController ()
<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>{
    UIButton *btn;
    UILabel *lab;
    
}



@end

@implementation mineViewController{
    mineViewController *mineViewController;
    chuanyiViewController *chuanyiViewController;
   
  
  
    shejiaoViewController *shejiaoViewController;
    shezhiqitaViewController *shezhiqitaViewController;
}

- (void)viewDidLoad {
  //加载视图
    [super viewDidLoad];

    [self tableviewaaa];
    
}
//视图即将可用的时候 调用这个方法
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
      [self.tabBarController.tabBar setHidden:NO];
}
//视图即将消失的时候 调用这个方法
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
//-(void)scrollviewaaa{
//    //设置滚动范围
//    self.scrollview.contentSize=CGSizeMake(480, 190);
//    
//    //self.scrollview.contentInset=UIEdgeInsetsMake(10, 10, 10, 10);
//    //self.scrollview.contentOffset=CGPointMake(-50, -50);
//    
//    
//    self.scrollview.showsHorizontalScrollIndicator=NO;
//    self.scrollview.showsVerticalScrollIndicator=NO;
//}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;//需要几节返回几
}
//决定每节 的行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) return 2;
    if (section==1) return 1;
     
    return 0;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    
//    [[cell textLabel] setText:[[dataArray objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]];//获取信息
    
    UITableViewCell *cell=[[UITableViewCell alloc]init];
  
    if (indexPath.section==0) {
        //第一组
        if (indexPath.row==0) {
            //第一组 第一行
            cell.textLabel.text=@"穿衣助手";
            cell.imageView.image=[UIImage imageNamed:@"profile_dresshelper_icon@2x.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row==1){
            //第一组 第三行
            cell.textLabel.text=@"新闻频道";
            cell.imageView.image=[UIImage imageNamed:@"profile_third_party_ad_icon3@2x.png"];
             cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
    }else if (indexPath.section==1){
        //第二组
        if (indexPath.row==0) {
            //第二组 第一行
            cell.textLabel.text=@"设置";
            cell.imageView.image=[UIImage imageNamed:@"profile_settings_icon@2x.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            
        }    }    return cell;


}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 

    if (indexPath.section==0) {
        if (indexPath.row==0) {
           chuanyiViewController *aa=[self.storyboard instantiateViewControllerWithIdentifier:@"aac"];
            [self.navigationController pushViewController:aa animated:YES];
        }else if (indexPath.row==1){
            NSString *strxinwen = [NSString stringWithFormat:@"http://www.sina.com.cn"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strxinwen]];
        }
    }else if (indexPath.section==1){
        if (indexPath.row==0) {
            shezhiqitaViewController *shezhiqita=[self.storyboard instantiateViewControllerWithIdentifier:@"shezhiqita"];
            [self.navigationController pushViewController:shezhiqita animated:YES];
        }
    
    }

}

-(void)tableviewaaa{
    
    OTCover *test = [[OTCover alloc] initWithTableViewWithHeaderImage:[UIImage imageNamed:@"235098-13042420510992.jpg"] withOTCoverHeight:180];
    test.tableView.delegate = self;
    test.tableView.dataSource = self;
    [self.view addSubview:test];
    
    btn=[[UIButton alloc]initWithFrame:CGRectMake(147.5, 40, 80, 80)];
    btn.alpha=0.5;
    btn.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"headIcon_placeholder.png"]];
    [test.headerImageView addSubview:btn];
    lab=[[UILabel alloc]initWithFrame:CGRectMake(163, 130, 80, 20)];
    lab.text=@"登    陆";
    
    lab.alpha=0.5;
    [test.headerImageView addSubview:lab];
    
 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//开始滚动的时候
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    btn.hidden=YES;
    lab.hidden=YES;
}
//结束的时候
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
  
    btn.hidden=NO;
    lab.hidden=NO;
}

//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
