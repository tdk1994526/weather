//
//  CWeatherView.m
//  天气预报
//
//  Created by wanhe31 on 15/11/12.
//  Copyright © 2015年 wanhe31. All rights reserved.
//

#import "CWeatherView.h"
#import "AFNetworking/AFNetworking.h"
#import "weatherViewController.h"
@implementation CWeatherView {
    
  
    NSString *city;
    NSString *time;
    NSString *temp;
    NSString *wind_direction;
    NSString *wind_strength;
    NSString *humidity;
    NSString *temperature;
    NSString *weather;
    NSString *weather_id;
    NSString *dressing_index;
    NSString *dressing_advice;
    NSString *comfort_index;
    NSString *uv_index;
    NSString *wash_index;
    NSString *exercise_index;
    NSString *drying_index;
    UILabel *future1data;
    NSString  *date_y;
    NSString *week;
    //未来几天的
    NSString *date1;
    NSString *week1;
    NSString *weather1;
    NSString *temperature1;
    
    NSMutableArray *arr1;
    NSMutableArray *arr2;
    NSMutableArray *arr3;
    NSMutableArray *arr4;
    AFHTTPRequestOperationManager *mgr;
    NSString *jiekouUrl;
    NSMutableDictionary *mutableDictionary;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void) loadCityWeather:(NSString*)cityName {
  

    
    
    //定义个链接地址
    jiekouUrl=@"http://v.juhe.cn/weather/index";
    //创建请求管理者
    mgr=[AFHTTPRequestOperationManager manager];
    mutableDictionary=[NSMutableDictionary dictionary];
//    mutableDictionary[@"lon"]=@(longi);
//    mutableDictionary[@"lat"]=@(lat);
    
    mutableDictionary[@"cityname"]=cityName;
    mutableDictionary[@"format"]=@1;
    mutableDictionary[@"dtype"]=@"json";
    mutableDictionary[@"key"]=@"78617338e732310a2b64d5eacaebfd1f";
    //67fb6bfb0b6f901042da9338a112ecb6
    [self aa];
}
-(void)aa{
    [mgr GET:jiekouUrl parameters:mutableDictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSMutableDictionary *data=[responseObject mutableCopy];
        NSMutableDictionary *result = [data objectForKey:@"result"];
        
        NSInteger errorCode = [[data valueForKey:@"error_code"] integerValue];
        if (errorCode != 0) {
//            UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"提示" message:@"输入有错！重新输入！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
//            [a show];
//            
            return ;
        }
        
        NSMutableDictionary *sk = [result objectForKey:@"sk"];
        time=[sk objectForKey:@"time"];
        temp=[sk objectForKey:@"temp"];
        humidity=[sk objectForKey:@"humidity"];
        wind_direction=[sk objectForKey:@"wind_direction"];
        wind_strength=[sk objectForKey:@"wind_strength"];
        NSMutableDictionary *today = [result objectForKey:@"today"];
        city = [today objectForKey:@"city"];
        weatherViewController *wea=[[weatherViewController alloc]init];
        wea.navigationItem.title=@"aa";
        temperature=[today objectForKey:@"temperature"];
        weather=[today objectForKey:@"weather"];
        dressing_index=[today objectForKey:@"dressing_index"];
        dressing_advice=[today objectForKey:@"dressing_advice"];
        uv_index=[today objectForKey:@"uv_index"];
        comfort_index=[today objectForKey:@"comfort_index"];
        wash_index=[today objectForKey:@"wash_index"];
        exercise_index=[today objectForKey:@"exercise_index"];
        week=[today objectForKey:@"week"];
        date_y=[today objectForKey:@"date_y"];
        NSMutableDictionary *biaoshifu=[today objectForKey:@"weather_id"];
        _biaoshi=[[biaoshifu objectForKey:@"fa"] integerValue];
        
        
        
        if (self.biaoshi==00 ) {   //晴

            self.bgName = @"t01a16203f1ce9a450f.jpg";
        }else if (self.biaoshi==53){   //雾霾

            self.bgName = @"28845542_1500.jpg";
        }else if (self.biaoshi==01) {  //多云
            self.bgName = @"C01b003.jpg";
        }else if (self.biaoshi==13){ //阵雪
            self.bgName = @"9889151_103114372186_2.jpg";
        }else if (self.biaoshi==15){//中雪
            self.bgName = @"9889151_103114372186_2.jpg";
        }
        else if (self.biaoshi==06){ //雨夹雪
            self.bgName = @"318756-140S009391099.jpg";
        }
        else if (self.biaoshi==02){ //阴
            self.bgName = @"A9CD6F69-0E3D-476E-9AB1-9CC178323B6E.png";
        }
        else if (self.biaoshi==07){ //小雨
            self.bgName = @"318756-140S009391099.jpg";
        }
        else if (self.biaoshi==9){ //大雨
            self.bgName = @"318756-140S009391099.jpg";
        }
        else if (self.biaoshi==14){ //小雪
            self.bgName = @"9889151_103114372186_2.jpg";
        }
        else if (self.biaoshi==16){ //大雪
            self.bgName = @"9889151_103114372186_2.jpg";
        }else if (self.biaoshi==03){ //阵雨
            self.bgName = @"318756-140S009391099.jpg";
        }else if (self.biaoshi==8){ //中雨
            self.bgName = @"318756-140S009391099.jpg";
        }else if (self.biaoshi==26){ //小雪转中雪
            self.bgName = @"9889151_103114372186_2.jpg";
        }
        else if (self.biaoshi==06){ //雨夹雪
            self.bgName = @"318756-140S009391099.jpg";
        }
        else if (self.biaoshi==17){ //爆雪
            self.bgName = @"9889151_103114372186_2.jpg";
        }
        else if (self.biaoshi==10){ //暴雨
            self.bgName = @"318756-140S009391099.jpg";
        }
        else {

            self.bgName = @"qwewq.jpg";
        }
        
        //未来3天天气预报
        NSMutableDictionary *future=[result objectForKey:@"future"];
        //        NSLog(@"%@",result);
        //通过遍历解析
        arr1=[NSMutableArray array];
        arr2=[NSMutableArray array];
        arr3=[NSMutableArray array];
        arr4=[NSMutableArray array];
        //把字典进行排序
        NSArray *keys = [future allKeys];
        NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            
            return [obj1 compare:obj2 options:NSNumericSearch];
        }];
        
        for (NSString * dateDicKey in sortedArray) {
            //            NSLog(@"date: %@",dateDicKey);
            NSDictionary * dateDic = [future valueForKey:dateDicKey];
            
            [arr1 addObject:[dateDic objectForKey:@"date"]];
            
            
            [arr2 addObject:[dateDic objectForKey:@"week"]];
            
            [arr3 addObject:[dateDic objectForKey:@"weather"]];
            [arr4 addObject:[dateDic objectForKey:@"temperature"]];
            
        }
        
        
        
    [self performSelectorOnMainThread:@selector(data) withObject:self waitUntilDone:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@error",error);
    }];
}

-(void)data{
    //    //城市
    //    UILabel *city1=[[UILabel alloc]initWithFrame:CGRectMake(172, 50, 80, 50)];
    //    city1.font=[UIFont systemFontOfSize:17];
    //    city1.alpha=0.5;
    //
    //    city1.text=city;
    //    city1.textColor=[UIColor blackColor];
    //    [self.scrollView addSubview:city1];
    UILabel *citya=[[UILabel alloc]initWithFrame:CGRectMake(270, 73, 120, 100)];
    citya.font=[UIFont systemFontOfSize:25];
    citya.alpha=0.5;
    
    citya.text=city;
    citya.textColor=[UIColor blueColor];
    [self addSubview:citya];
    UILabel *riqi=[[UILabel alloc]initWithFrame:CGRectMake(200, 55, 120, 50)];
    riqi.font=[UIFont systemFontOfSize:15];
    riqi.alpha=0.5;
    
    riqi.text=date_y;
    riqi.textColor=[UIColor redColor];
    [self addSubview:riqi];
    
    UILabel *xingqi=[[UILabel alloc]initWithFrame:CGRectMake(320, 55, 80, 50)];
    xingqi.font=[UIFont systemFontOfSize:15];
    xingqi.alpha=0.5;
    
    xingqi.text=week;
    xingqi.textColor=[UIColor redColor];
    [self addSubview:xingqi];
    
    
    //更新时间label
    UILabel *gengxinshijian=[[UILabel alloc]initWithFrame:CGRectMake(300, 73, 50, 50)];
    gengxinshijian.font=[UIFont systemFontOfSize:15];
    gengxinshijian.alpha=0.5;
    
    gengxinshijian.text=@"发布";
    gengxinshijian.textColor=[UIColor redColor];
    [self addSubview:gengxinshijian];
    //更新时间
    UILabel *fabutime=[[UILabel alloc]initWithFrame:CGRectMake(260, 73, 50, 50)];
    fabutime.font=[UIFont systemFontOfSize:15];
    fabutime.alpha=0.5;
    
    fabutime.text=time;
    fabutime.textColor=[UIColor redColor];
    [self addSubview:fabutime];
    
    //今日温度
    UILabel *jingriwendu=[[UILabel alloc]initWithFrame:CGRectMake(30, 375, 120, 50)];
    jingriwendu.font=[UIFont systemFontOfSize:23];
    jingriwendu.text=temperature;
    jingriwendu.textColor=[UIColor blueColor];
    [self addSubview:jingriwendu];
    //图片
    UIImageView *photo=[[UIImageView alloc]initWithFrame:CGRectMake(215,195 , 120, 200)];
    photo.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"3362399_153948048086_2.png"]];
    [self addSubview:photo];
    //当前温度
    UILabel *weatherwendu=[[UILabel alloc]initWithFrame:CGRectMake(28, 300, 80, 100)];
    weatherwendu.font=[UIFont systemFontOfSize:60];
    weatherwendu.text=temp;
    weatherwendu.textColor=[UIColor blueColor];
    [self addSubview:weatherwendu];
    
    //当前温度摄氏度
    UILabel *weatherwendu2=[[UILabel alloc]initWithFrame:CGRectMake(90, 303, 100, 100)];
    weatherwendu2.font=[UIFont systemFontOfSize:40];
    weatherwendu2.text=@"°C";
    weatherwendu2.textColor=[UIColor blueColor];
    [self addSubview:weatherwendu2];
    //天气表示 晴阴等
    UILabel *tianqibiaoshi=[[UILabel alloc]initWithFrame:CGRectMake(155, 375, 100, 50)];
    tianqibiaoshi.font=[UIFont systemFontOfSize:20];
    tianqibiaoshi.text=weather;
    tianqibiaoshi.textColor=[UIColor blueColor];
    [self addSubview:tianqibiaoshi];
    
    //当前湿度字
    UILabel *dangqianshidu1=[[UILabel alloc]initWithFrame:CGRectMake(30, 420, 50, 50)];
    dangqianshidu1.font=[UIFont systemFontOfSize:20];
    dangqianshidu1.text=@"湿度:";
    dangqianshidu1.textColor=[UIColor blueColor];
    [self addSubview:dangqianshidu1];
    //当前湿度
    UILabel *dangqianshidu=[[UILabel alloc]initWithFrame:CGRectMake(80, 420, 50, 50)];
    dangqianshidu.font=[UIFont systemFontOfSize:20];
    dangqianshidu.text=humidity;
    dangqianshidu.textColor=[UIColor blueColor];
    [self addSubview:dangqianshidu];
    
    //当前风向字
    UILabel *dangqianfengxiang1=[[UILabel alloc]initWithFrame:CGRectMake(140, 420, 50, 50)];
    dangqianfengxiang1.font=[UIFont systemFontOfSize:20];
    dangqianfengxiang1.text=@"风向:";
    dangqianfengxiang1.textColor=[UIColor blueColor];
    [self addSubview:dangqianfengxiang1];
    //当前风向
    UILabel *dangqianfengxiang=[[UILabel alloc]initWithFrame:CGRectMake(190, 420, 60, 50)];
    dangqianfengxiang.font=[UIFont systemFontOfSize:20];
    dangqianfengxiang.text=wind_direction;
    dangqianfengxiang.textColor=[UIColor blueColor];
    [self addSubview:dangqianfengxiang];
    
    
    //当前风力字
    UILabel *dangqianfengli1=[[UILabel alloc]initWithFrame:CGRectMake(270, 420, 50, 50)];
    dangqianfengli1.font=[UIFont systemFontOfSize:20];
    dangqianfengli1.text=@"风力:";
    dangqianfengli1.textColor=[UIColor blueColor];
    [self addSubview:dangqianfengli1];
    //当前风力
    UILabel *dangqianfengli=[[UILabel alloc]initWithFrame:CGRectMake(320, 420, 50, 50)];
    dangqianfengli.font=[UIFont systemFontOfSize:20];
    dangqianfengli.text=wind_strength;
    dangqianfengli.textColor=[UIColor blueColor];
    [self addSubview:dangqianfengli];
    
    //明天天气lable的边框
    UILabel *biankuang1=[[UILabel alloc]initWithFrame:CGRectMake(0, 470, 375, 50)];
    biankuang1.layer.borderColor=[UIColor whiteColor].CGColor;
    biankuang1.layer.borderWidth=0.5;
    biankuang1.alpha=0.5;
    [self addSubview:biankuang1];
    //    //后天天气lable的边框
    //    UILabel *biankuang2=[[UILabel alloc]initWithFrame:CGRectMake(0, 520, 375, 50)];
    //    biankuang2.layer.borderColor=[UIColor whiteColor].CGColor;
    //   biankuang2.layer.borderWidth=0.5;
    //   biankuang2.alpha=0.3;
    //    [self addSubview:biankuang2];
    
    //大后天天气lable的边框
    UILabel *biankuang3=[[UILabel alloc]initWithFrame:CGRectMake(0, 570, 375, 50)];
    biankuang3.layer.borderColor=[UIColor whiteColor].CGColor;
    biankuang3.layer.borderWidth=0.5;
    biankuang3.alpha=0.5;
    [self addSubview:biankuang3];
    
    //未来天气 明天 date
    future1data=[[UILabel alloc]initWithFrame:CGRectMake(30, 480, 100, 40)];
    future1data.font=[UIFont systemFontOfSize:15];
    future1data.text=arr1[1];
    future1data.textColor=[UIColor whiteColor];
    [self addSubview:future1data];
    //未来天气 明天 星期几
    UILabel *future1week=[[UILabel alloc]initWithFrame:CGRectMake(140, 480, 50, 40)];
    future1week.font=[UIFont systemFontOfSize:15];
    future1week.text=arr2[1];
    future1week.textColor=[UIColor whiteColor];
    [self addSubview:future1week];
    
    //未来天气 明天 weather 晴
    UILabel *future1weather=[[UILabel alloc]initWithFrame:CGRectMake(200, 480, 80, 40)];
    future1weather.font=[UIFont systemFontOfSize:15];
    future1weather.text=arr3[1];
    future1weather.textColor=[UIColor whiteColor];
    [self addSubview:future1weather];
    
    //未来天气 明天 温度
    UILabel *future1wendu=[[UILabel alloc]initWithFrame:CGRectMake(290, 480, 100, 40)];
    future1wendu.font=[UIFont systemFontOfSize:15];
    future1wendu.text=arr4[1];
    future1wendu.textColor=[UIColor whiteColor];
    [self addSubview:future1wendu];
    
    
    //未来天气 后天 data
    UILabel *future2data=[[UILabel alloc]initWithFrame:CGRectMake(30, 530, 100, 40)];
    future2data.font=[UIFont systemFontOfSize:15];
    future2data.text=arr1[2];
    future2data.textColor=[UIColor whiteColor];
    [self addSubview:future2data];
    //未来天气 后天 星期几
    UILabel *future2week=[[UILabel alloc]initWithFrame:CGRectMake(140, 530, 50, 40)];
    future2week.font=[UIFont systemFontOfSize:15];
    future2week.text=arr2[2];
    future2week.textColor=[UIColor whiteColor];
    [self addSubview:future2week];
    
    //未来天气 后天 weather 晴
    UILabel *future2weather=[[UILabel alloc]initWithFrame:CGRectMake(200, 530, 80, 40)];
    future2weather.font=[UIFont systemFontOfSize:15];
    future2weather.text=arr3[2];
    future2weather.textColor=[UIColor whiteColor];
    [self addSubview:future2weather];
    
    //未来天气 后天 温度
    UILabel *future2wendu=[[UILabel alloc]initWithFrame:CGRectMake(290, 530, 100, 40)];
    future2wendu.font=[UIFont systemFontOfSize:15];
    future2wendu.text=arr4[2];
    future2wendu.textColor=[UIColor whiteColor];
    [self addSubview:future2wendu];
    
    
    
    //未来天气 大后天 data
    UILabel *future3data=[[UILabel alloc]initWithFrame:CGRectMake(30, 580, 100, 40)];
    future3data.font=[UIFont systemFontOfSize:15];
    future3data.text=arr1[3];
    future3data.textColor=[UIColor whiteColor];
    [self addSubview:future3data];
    //未来天气 大后天 星期几
    UILabel *future3week=[[UILabel alloc]initWithFrame:CGRectMake(140, 580, 50, 40)];
    future3week.font=[UIFont systemFontOfSize:15];
    future3week.text=arr2[3];
    future3week.textColor=[UIColor whiteColor];
    [self addSubview:future3week];
    
    //未来天气 大后天 weather 晴
    UILabel *future3weather=[[UILabel alloc]initWithFrame:CGRectMake(200, 580, 80, 40)];
    future3weather.font=[UIFont systemFontOfSize:15];
    future3weather.text=arr3[3];
    future3weather.textColor=[UIColor whiteColor];
    [self addSubview:future3weather];
    
    //未来天气 大后天 温度
    UILabel *future3wendu=[[UILabel alloc]initWithFrame:CGRectMake(290, 580, 100, 40)];
    future3wendu.font=[UIFont systemFontOfSize:15];
    future3wendu.text=arr4[3];
    future3wendu.textColor=[UIColor whiteColor];
    [self addSubview:future3wendu];
    
    
    UIImageView *ziwaixianphoto=[[UIImageView alloc]initWithFrame:CGRectMake(22, 630, 50, 50)];
    ziwaixianphoto.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"indexData_image_12_5.png"]];
    [self addSubview:ziwaixianphoto];
    
    UILabel *ziwaixianqiangdu=[[UILabel alloc]initWithFrame:CGRectMake(75, 640, 80, 40)];
    ziwaixianqiangdu.font=[UIFont systemFontOfSize:17];
    ziwaixianqiangdu.text=@"紫外强度:";
    ziwaixianqiangdu.textColor=[UIColor whiteColor];
    [self addSubview:ziwaixianqiangdu];
    
    UILabel *ziwaixianqd=[[UILabel alloc]initWithFrame:CGRectMake(160, 640, 100, 40)];
    ziwaixianqd.font=[UIFont systemFontOfSize:17];
    ziwaixianqd.text=uv_index;
    
    ziwaixianqd.textColor=[UIColor whiteColor];
    [self addSubview:ziwaixianqd];
    
    
    
    UIImageView *xichephoto=[[UIImageView alloc]initWithFrame:CGRectMake(22, 690, 50, 50)];
    xichephoto.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"indexData_image_9_1.png"]];
    [self addSubview:xichephoto];
    
    UILabel *xichezhishu=[[UILabel alloc]initWithFrame:CGRectMake(75, 700, 80, 40)];
    xichezhishu.font=[UIFont systemFontOfSize:17];
    xichezhishu.text=@"洗车指数:";
    xichezhishu.textColor=[UIColor whiteColor];
    [self addSubview:xichezhishu];
    
    UILabel *xiche=[[UILabel alloc]initWithFrame:CGRectMake(160, 700, 100, 40)];
    xiche.font=[UIFont systemFontOfSize:17];
    xiche.text=wash_index;
    
    xiche.textColor=[UIColor whiteColor];
    [self addSubview:xiche];
    
    
    UIImageView *chenlianphoto=[[UIImageView alloc]initWithFrame:CGRectMake(22, 750, 50, 50)];
    chenlianphoto.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"indexData_image_17_2.png"]];
    [self addSubview:chenlianphoto];
    
    UILabel *chenlianzhishu=[[UILabel alloc]initWithFrame:CGRectMake(75, 760, 80, 40)];
    chenlianzhishu.font=[UIFont systemFontOfSize:17];
    chenlianzhishu.text=@"晨练指数:";
    chenlianzhishu.textColor=[UIColor whiteColor];
    [self addSubview:chenlianzhishu];
    
    UILabel *chenlianzs=[[UILabel alloc]initWithFrame:CGRectMake(160, 760, 200, 40)];
    chenlianzs.font=[UIFont systemFontOfSize:17];
    chenlianzs.text=exercise_index;
    
    chenlianzs.textColor=[UIColor whiteColor];
    [self addSubview:chenlianzs];
    
    
    UIImageView *chuanyiphoto=[[UIImageView alloc]initWithFrame:CGRectMake(22, 810, 50, 50)];
    chuanyiphoto.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"indexData_image_11_1.png"]];
    [self addSubview:chuanyiphoto];
    
    UILabel *chuanyizhishu=[[UILabel alloc]initWithFrame:CGRectMake(75, 820, 80, 40)];
    chuanyizhishu.font=[UIFont systemFontOfSize:17];
    chuanyizhishu.text=@"穿衣指数:";
    chuanyizhishu.textColor=[UIColor whiteColor];
    [self addSubview:chuanyizhishu];
    
    UILabel *chuanyi=[[UILabel alloc]initWithFrame:CGRectMake(160, 820, 200, 40)];
    chuanyi.font=[UIFont systemFontOfSize:17];
    chuanyi.text=dressing_index;
    chuanyi.textColor=[UIColor whiteColor];
    [self addSubview:chuanyi];
    
    
    UIImageView *chuanyijianyiphoto=[[UIImageView alloc]initWithFrame:CGRectMake(22, 870, 50, 50)];
    chuanyijianyiphoto.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"indexData_image_11_3.png"]];
    [self addSubview:chuanyijianyiphoto];
    
    UILabel *chuanyijianyi=[[UILabel alloc]initWithFrame:CGRectMake(75, 880, 80, 40)];
    chuanyijianyi.font=[UIFont systemFontOfSize:17];
    chuanyijianyi.text=@"穿衣建议:";
    chuanyijianyi.textColor=[UIColor whiteColor];
    [self addSubview:chuanyijianyi];
    
    UILabel *chuanyijy=[[UILabel alloc]initWithFrame:CGRectMake(160, 862, 200, 100)];
    chuanyijy.font=[UIFont systemFontOfSize:17];
    chuanyijy.text=dressing_advice;
    chuanyijy.lineBreakMode = NSLineBreakByCharWrapping;
    chuanyijy.numberOfLines=0;
    chuanyijy.textColor=[UIColor whiteColor];
    [self addSubview:chuanyijy];
}

@end
