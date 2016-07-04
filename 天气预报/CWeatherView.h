//
//  CWeatherView.h
//  天气预报
//
//  Created by wanhe31 on 15/11/12.
//  Copyright © 2015年 wanhe31. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CWeatherView : UIView
//@property(nonatomic)NSInteger biaoshi;
@property(nonatomic,assign)NSInteger biaoshi;
@property (nonatomic,strong) NSString * bgName;
- (void) loadCityWeather:(NSString*)cityName;
-(void)data;
-(void)aa;
@end
