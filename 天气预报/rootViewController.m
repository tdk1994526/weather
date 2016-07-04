//
//  rootViewController.m
//  天气预报
//
//  Created by wanhe31 on 15/11/11.
//  Copyright © 2015年 wanhe31. All rights reserved.
//

#import "rootViewController.h"
#import "leftViewController.h"
@interface rootViewController ()

@end

@implementation rootViewController

-(void)awakeFromNib{
    self.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
    self.contentViewShadowColor = [UIColor blackColor];
    self.contentViewShadowOffset = CGSizeMake(0, 0);
    self.contentViewShadowOpacity = 0.6;
    self.contentViewShadowRadius = 12;
    self.contentViewShadowEnabled = YES;
    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftMenuViewController"];
    
    self.backgroundImage = [UIImage imageNamed:@"Stars"];
    self.delegate = self;

}

@end
