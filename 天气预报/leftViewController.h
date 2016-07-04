//
//  leftViewController.h
//  天气预报
//
//  Created by wanhe31 on 15/11/11.
//  Copyright © 2015年 wanhe31. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"
@interface leftViewController :UIViewController <UITableViewDataSource, UITableViewDelegate, RESideMenuDelegate>

@property (weak,nonatomic) id delegate;

@end

@protocol leftViewControllerDelegate <NSObject>

- (void) didRemoveCell:(NSInteger)tag;

@end
