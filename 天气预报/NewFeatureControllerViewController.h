//
//  NewFeatureControllerViewController.h
//  01项目
//
//  Created by wanhe31 on 15/9/9.
//  Copyright (c) 2015年 wangyougui. All rights reserved.
//

#import <UIKit/UIKit.h>





@interface NewFeatureControllerViewController : UIViewController<UIScrollViewAccessibilityDelegate,UICollectionViewDelegate,UIScrollViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pagecntrol;

@end
