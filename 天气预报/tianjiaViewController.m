//
//  tianjiaViewController.m
//  天气预报
//
//  Created by wanhe31 on 15/11/11.
//  Copyright © 2015年 wanhe31. All rights reserved.
//

#import "tianjiaViewController.h"
#import "leftViewController.h"
#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>
#import "CWeatherView.h"
#import "AFNetworking/AFNetworking.h"
#import "weatherViewController.h"
@interface tianjiaViewController ()<CLLocationManagerDelegate>{
    AppDelegate *app;
   AFHTTPRequestOperationManager *mgr;
    CWeatherView  *cweather;
      CLLocationManager *locManager;
    NSString *jiekouUrl;
    NSMutableDictionary *mutableDictionary;
    CLLocationDegrees lat;
    CLLocationDegrees longi;
    CLGeocoder *geocoder;
}

@property (strong, nonatomic) IBOutlet UITextField *chengshiText;
@property (strong, nonatomic) IBOutlet UIImageView *image;

@end

@implementation tianjiaViewController
- (IBAction)tianjiaButton:(id)sender {
    //weatherViewController *wea=[[weatherViewController alloc]init];
    
    //self.chengshiText.text=wea.self.cityName;
    if(self.chengshiText.text.length ==0){
        UIAlertView *b=[[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入城市名！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [b show];
    }else{
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    leftViewController *fanhui=[story instantiateViewControllerWithIdentifier:@"fanhui"];
    //跳转到输入的城市
    [app.self.weatherSource addObject:self.chengshiText.text];

   
    
    [self presentViewController:fanhui animated:YES completion:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
     locManager=[[CLLocationManager alloc]init];
    app=[UIApplication sharedApplication].delegate;
    self.view.backgroundColor=[UIColor whiteColor];
   
    cweather =[[CWeatherView alloc]init];
    geocoder=[[CLGeocoder alloc]init];
    // Do any additional setup after loading the view.
}




- (IBAction)guanbi:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    leftViewController *fanhui=[story instantiateViewControllerWithIdentifier:@"fanhui"];
    [self presentViewController:fanhui animated:YES completion:nil];

}

- (IBAction)dingwei:(id)sender {
    //判断定位服务是否可以用
    if ([CLLocationManager locationServicesEnabled]) {
        
        NSLog(@"开始定位");

        //设置定位的质量
        locManager.desiredAccuracy=kCLLocationAccuracyBest;
        
        //设置委托代理
        locManager.delegate=self;
        locManager.distanceFilter = 500;
        [locManager requestWhenInUseAuthorization];
        //开始定位
        [locManager startUpdatingLocation];
        
    }else{
        NSLog(@"无法使用定位结果");
    }

    

}
//成功获取定位数据将会通知改方法  //需要在plist 文件中加上一个函数
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    NSLog(@"获取定位信息");
    
    CLLocation *location=[locations lastObject];
    //获取经纬度
    CLLocationCoordinate2D coord=location.coordinate;
    //纬度信息
    lat=coord.latitude;
    //经度信息
   longi=coord.longitude;
    NSLog(@"经度   %f ,纬度    %f",longi,lat);
    //通过经纬度获取城市
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemark,NSError *error)
     {
         CLPlacemark *mark=[placemark objectAtIndex:0];

         NSString * place = mark.locality;
         //直接显示在text上面
         self.chengshiText.text = place;
         

     } ];
    
}

//定位失败通知这个方法
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"定位失败%@",error);
}
//判断 如果有城市了 就返回no  没有救创建
- (BOOL) findDupCity:(NSString*)city {
    for (NSString * cityName in app.self.weatherSource) {
        if ([cityName isEqualToString:city]) {
            return YES;
        }
    }
    
    return NO;
}

- (IBAction)shanghai:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    leftViewController *fanhui=[story instantiateViewControllerWithIdentifier:@"fanhui"];
    
    if ([self findDupCity:@"上海"]) {
       
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已添加上海市天气预报！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [a show];
    }
    else {
        [app.weatherSource addObject:@"上海"];
        app.currentPage = app.weatherSource.count-1;
        [self presentViewController:fanhui animated:YES completion:nil];

    }

}
- (IBAction)dalian:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    leftViewController *fanhui=[story instantiateViewControllerWithIdentifier:@"fanhui"];
    if ([self findDupCity:@"大连"]) {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已添加大连市天气预报！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [a show];
    }
    else {
        [app.self.weatherSource addObject:@"大连"];
        app.currentPage = app.weatherSource.count-1;
        [self presentViewController:fanhui animated:YES completion:nil];
        
    }

  

}
- (IBAction)wuhan:(id)sender {
    
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    leftViewController *fanhui=[story instantiateViewControllerWithIdentifier:@"fanhui"];
    if ([self findDupCity:@"武汉"]) {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已添加武汉市天气预报！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [a show];
    }
    else {
        [app.self.weatherSource addObject:@"武汉"];
        app.currentPage = app.weatherSource.count-1;
        [self presentViewController:fanhui animated:YES completion:nil];
        
    }
    
}
- (IBAction)chengdu:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    leftViewController *fanhui=[story instantiateViewControllerWithIdentifier:@"fanhui"];
    if ([self findDupCity:@"成都"]) {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已添加成都市天气预报！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [a show];    }
    else {
        [app.self.weatherSource addObject:@"成都"];
        app.currentPage = app.weatherSource.count-1;
        [self presentViewController:fanhui animated:YES completion:nil];
        
    }
    
}
- (IBAction)chongqing:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    leftViewController *fanhui=[story instantiateViewControllerWithIdentifier:@"fanhui"];
    if ([self findDupCity:@"重庆"]) {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已添加重庆市天气预报！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [a show];
    }
    else {
        [app.self.weatherSource addObject:@"重庆"];
        app.currentPage = app.weatherSource.count-1;
        [self presentViewController:fanhui animated:YES completion:nil];
        
    }
}
- (IBAction)nanjing:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    leftViewController *fanhui=[story instantiateViewControllerWithIdentifier:@"fanhui"];
    if ([self findDupCity:@"南京"]) {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已添加南京市天气预报！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [a show];    }
    else {
        [app.self.weatherSource addObject:@"南京"];
        app.currentPage = app.weatherSource.count-1;
        [self presentViewController:fanhui animated:YES completion:nil];
        
    }

   }
- (IBAction)zhengzhou:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    leftViewController *fanhui=[story instantiateViewControllerWithIdentifier:@"fanhui"];
    if ([self findDupCity:@"郑州"]) {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已添加郑州市天气预报！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [a show];
    }
    else {
        [app.self.weatherSource addObject:@"郑州"];
        app.currentPage = app.weatherSource.count-1;
        [self presentViewController:fanhui animated:YES completion:nil];
        
    }
}
- (IBAction)tianjing:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    leftViewController *fanhui=[story instantiateViewControllerWithIdentifier:@"fanhui"];
    if ([self findDupCity:@"天津"]) {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已添加天津市天气预报！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [a show];
    }
    else {
        [app.self.weatherSource addObject:@"天津"];
        app.currentPage = app.weatherSource.count-1;
        [self presentViewController:fanhui animated:YES completion:nil];
        
    }
}
- (IBAction)shengyang:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    leftViewController *fanhui=[story instantiateViewControllerWithIdentifier:@"fanhui"];
    if ([self findDupCity:@"沈阳"]) {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已添加沈阳市天气预报！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [a show];
    }
    else {
        [app.self.weatherSource addObject:@"沈阳"];
        app.currentPage = app.weatherSource.count-1;
        [self presentViewController:fanhui animated:YES completion:nil];
        
    }

   }
- (IBAction)guangzhou:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    leftViewController *fanhui=[story instantiateViewControllerWithIdentifier:@"fanhui"];
    if ([self findDupCity:@"广州"]) {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已添加广州市天气预报！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [a show];
    }
    else {
        [app.self.weatherSource addObject:@"广州"];
        app.currentPage = app.weatherSource.count-1;
        [self presentViewController:fanhui animated:YES completion:nil];
        
    }
}
- (IBAction)haerbing:(id)sender {
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    leftViewController *fanhui=[story instantiateViewControllerWithIdentifier:@"fanhui"];
    if ([self findDupCity:@"哈尔滨"]) {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已添加哈尔滨市天气预报！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [a show];
    }
    else {
        [app.self.weatherSource addObject:@"哈尔滨"];
        app.currentPage = app.weatherSource.count-1;
        [self presentViewController:fanhui animated:YES completion:nil];
        
    }



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
