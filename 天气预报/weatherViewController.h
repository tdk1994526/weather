//
//  weatherViewController.h
//  天气预报
//
//  Created by wanhe31 on 15/10/20.
//  Copyright © 2015年 wanhe31. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface weatherViewController : UIViewController<UITableViewDelegate,CLLocationManagerDelegate>
@property(nonatomic,strong)NSString * cityName;

@property (nonatomic) NSInteger currentPage;

@end
