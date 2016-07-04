//
//  NewFeatureControllerViewController.m
//  01项目
//
//  Created by wanhe31 on 15/9/9.
//  Copyright (c) 2015年 wangyougui. All rights reserved.
//

#import "NewFeatureControllerViewController.h"
#import "UIView+Extension.h"
#import "MJCollectionViewCell.h"


#define PicCount 4
@interface NewFeatureControllerViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *parallaxCollectionView1;
@property (nonatomic, strong) NSMutableArray* images;






@end

@implementation NewFeatureControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //[self scrollVIewimage];
  
   
    
    NSUInteger index;
    for (index = 0; index < 14; ++index) {
        // Setup image name
        NSString *name = [NSString stringWithFormat:@"image%03ld.jpg", (unsigned long)index];
        if(!self.images)
            self.images = [NSMutableArray arrayWithCapacity:0];
        [self.images addObject:name];
    }
    
    [self.parallaxCollectionView1 reloadData];

    // Do any additional setup after loading the view.
}

-(void)scrollVIewimage{

    //初始化分夜页和scollview控件
    _scrollView=[[UIScrollView alloc]init];
    _scrollView.frame=CGRectMake(0, 60, 375, 150);
//    _scrollView.frame=self.view.bounds;
    // _scrollView.delegate=self;
    [self.view addSubview:_scrollView];
    
    CGFloat scrollW=_scrollView.bounds.size.width;
    CGFloat scrollH=_scrollView.bounds.size.height;
    //往scrollview里面加图片
    for (int i=0;i<PicCount; i++) {
        UIImageView *imageView=[[UIImageView alloc]init];
        imageView.width=scrollW;
        imageView.height=scrollH;
        imageView.x=i*scrollW;
        imageView.y=0;
        //2种方法加载图片到新特性上面
        
        
        // imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"Image-%d",i+1]];//比较浪费空间s
        
        
        NSString *name=[NSString stringWithFormat:@"image0%d",i+1];
        //获取图片完成的路径
        NSString *path=[[NSBundle mainBundle]pathForResource:name ofType:@"jpg"];
       // NSLog(@"%@",path);
        //这里的参数不能再传递图片名称 这里需要传递一个完整的路径
        UIImage *img=[UIImage imageWithContentsOfFile:path];
        imageView.image=img;
        
        
        //把图片对象添加到scollview里面
        [_scrollView addSubview:imageView];
    }
    
    
    
    
    //设置scrollview里面可以滚动的范围 如果在哪个方向不能滚动设置为0
    _scrollView.contentSize=CGSizeMake(PicCount*scrollW, 0);
    //去掉弹簧效果
    _scrollView.bounces=NO;
    //图片移动到一半 自动分页
    _scrollView.pagingEnabled=YES;
    _scrollView.delegate=self;
    
//    //初始化分页控件
//    _pagecntrol=[[UIPageControl alloc]init];
//    _pagecntrol.numberOfPages=PicCount;
//    
//    
//    _pagecntrol.pageIndicatorTintColor=[UIColor redColor];
//    _pagecntrol.currentPageIndicatorTintColor=[UIColor blackColor];//小点点的颜色
//    _pagecntrol.width=100;
//    _pagecntrol.centerX=scrollW *0.5;
//    _pagecntrol.centerY=scrollH -120;
//    [_pagecntrol addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged]; // 触摸mypagecontrol触发change这个方法事件
//  
//    [self.view addSubview:_pagecntrol];



}

#pragma mark - UICollectionViewDatasource Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MJCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MJCell" forIndexPath:indexPath];
    
    //get image name and assign
    NSString* imageName = [self.images objectAtIndex:indexPath.item];
    cell.image = [UIImage imageNamed:imageName];
    
    //set offset accordingly
    CGFloat yOffset = ((self.parallaxCollectionView1.contentOffset.y - cell.frame.origin.y) / IMAGE_HEIGHT) * IMAGE_OFFSET_SPEED;
    cell.imageOffset = CGPointMake(0.0f, yOffset);
    
    return cell;
}

#pragma mark - UIScrollViewdelegate methods
//开始滚动的时候
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
   
    for(MJCollectionViewCell *view in self.parallaxCollectionView1.visibleCells) {
         [self.navigationController.navigationBar setHidden:YES];
        [self.tabBarController.tabBar setHidden:YES];
        CGFloat yOffset = ((self.parallaxCollectionView1.contentOffset.y - view.frame.origin.y) / IMAGE_HEIGHT) * IMAGE_OFFSET_SPEED;
        view.imageOffset = CGPointMake(0.0f, yOffset);
    }
}
//拖拽 开始的时候 里面包括滚动的方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    for(MJCollectionViewCell *view in self.parallaxCollectionView1.visibleCells) {
        [self.navigationController.navigationBar setHidden:YES];
        [self.tabBarController.tabBar setHidden:YES];
        CGFloat yOffset = ((self.parallaxCollectionView1.contentOffset.y - view.frame.origin.y) / IMAGE_HEIGHT) * IMAGE_OFFSET_SPEED;
        view.imageOffset = CGPointMake(0.0f, yOffset);
    }
  // NSLog(@"scrollViewWillBeginDragging");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//结束的时候
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
  [self.navigationController.navigationBar setHidden:NO];
    [self.tabBarController.tabBar setHidden:NO];
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
