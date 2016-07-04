//
//  UIView+Extension.h
//  OC系统复习
//
//  Created by wangyougui on 15/8/23.
//  Copyright (c) 2015年 wangyougui. All rights reserved.
//

#import <UIKit/UIKit.h>
//分类里面只能扩充方法,目的是让所有控件在外面能直接改变起位置和大小
@interface UIView (Extension)
@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize size;
@property (nonatomic,assign) CGPoint origin;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@end