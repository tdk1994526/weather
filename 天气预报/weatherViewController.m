//
//  weatherViewController.m
//  天气预报
//
//  Created by wanhe31 on 15/10/20.
//  Copyright © 2015年 wanhe31. All rights reserved.
//

#import "weatherViewController.h"
#import "UMSocial.h"
#import "AFNetworking.h"
#import "RESideMenu.h"
#import "AppDelegate.h"
#import "CWeatherView.h"
#import "UIViewController+RESideMenu.h"
#import "leftViewController.h"

@interface weatherViewController ()<UMSocialUIDelegate,UIScrollViewDelegate,UIScrollViewAccessibilityDelegate>{
    
}
@property(nonatomic,strong)UIScrollView *scrollView;

- (IBAction)shareButton:(id)sender;

@end

@implementation weatherViewController


- (void)viewDidLoad {
    [super viewDidLoad];
        

   self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"t01a16203f1ce9a450f.jpg"]];
    
   //  _scrollview.separatorStyle = NO;
    [self.tabBarController.tabBar setBarStyle: UIBarStyleDefault ];
    [self.tabBarController.tabBar setTranslucent:YES];
    
    
    leftViewController * viewC = self.sideMenuViewController.leftMenuViewController;
    
    viewC.delegate = self;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    _scrollView.delegate = self;
    //_scrollView.backgroundColor = [UIColor clearColor];
    // 是否支持滑动最顶端
     _scrollView.scrollsToTop = NO;
    //_scrollView.showsHorizontalScrollIndicator = NO;
   //上下滑动条隐藏
    _scrollView.showsVerticalScrollIndicator = NO;
    //    _scrollView.delegate = self;
    // 设置内容大小
    _scrollView.contentSize = CGSizeMake(375 , 667*1.5);
    // 是否反弹
        _scrollView.bounces = YES;

    // 是否分页
   _scrollView.pagingEnabled = YES;
    // 是否滚动
    //    scrollView.scrollEnabled = NO;
    [self.view addSubview:_scrollView];
    
    [self weatherData];
    
    self.currentPage = 0;
    
    // Do any additional setup after loading the view.
}

- (void) didRemoveCell:(NSInteger)tag {
    [self weatherData];
//    NSArray * subviews = [self.scrollView subviews];
//    CWeatherView * weatherview = subviews[tag];
//    [weatherview removeFromSuperview];
//    AppDelegate * app = [UIApplication sharedApplication].delegate;
//    _scrollView.contentSize = CGSizeMake(375*app.weatherSource.count , 667*1.5);
    
//    UICollectionViewController;
}


-(void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:NO];
    [self.navigationController.navigationBar setHidden:NO];
    
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    //view本事的视图 等于 天气的总个数 减去一  就是最新添加的天气预报
    self.currentPage = app.currentPage;
    //跳转到指定内容的坐标
    [self.scrollView setContentOffset:CGPointMake(375*self.currentPage , 0) animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//分享按钮
- (IBAction)shareButton:(id)sender {
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5624b724e0f55af7db00240f"
                                      shareText:@"你要分享的文字"
                                     shareImage:[UIImage imageNamed:@"right_button_share_blue_press@2x.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToQzone,UMShareToSms,UMShareToEmail,UMShareToFacebook,UMShareToTwitter,UMShareToWechatSession,UMShareToWechatTimeline,nil]
                                       delegate:self];
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToQQ,UMShareToQzone,UMShareToWechatSession,UMShareToWechatTimeline]];
}


-(void)weatherData{
    NSArray * subviews = [self.scrollView subviews];
    for (UIView * view in subviews) {
        if ([view isKindOfClass: [CWeatherView class] ]) {
            [view removeFromSuperview];
        }
    }
//通过遍历添加view
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    int i = 0;
    for (_cityName in app.weatherSource) {
        CWeatherView * viewa = [[CWeatherView alloc] initWithFrame:CGRectMake(i*375, 0,375 , 667*1.5)];
        [viewa setBackgroundColor: [UIColor clearColor] ];
        [viewa loadCityWeather:_cityName];
        [self.scrollView addSubview:viewa];
        i++;
        
    }
    _scrollView.contentSize = CGSizeMake(375*app.weatherSource.count , 667*1.5);
    
}
//通过缓慢滑动触发事件
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int page = scrollView.contentOffset.x/375;
    NSArray * subviews = [self.scrollView subviews];
    CWeatherView * weatherview = subviews[page];
    if (weatherview!=nil&&[weatherview isKindOfClass:[CWeatherView class] ]) {
            self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:weatherview.bgName]];
    }
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
