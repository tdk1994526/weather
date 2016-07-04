//
//  AppDelegate.h
//  天气预报
//
//  Created by wanhe31 on 15/10/16.
//  Copyright © 2015年 wanhe31. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray * weatherSource;
@property (nonatomic) NSInteger currentPage;

@end

