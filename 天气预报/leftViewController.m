//
//  leftViewController.m
//  天气预报
//
//  Created by wanhe31 on 15/11/11.
//  Copyright © 2015年 wanhe31. All rights reserved.
//

#import "leftViewController.h"
#import "weatherViewController.h"
#import "UIViewController+RESideMenu.h"
#import "tianjiaViewController.h"
#import "AppDelegate.h"
@interface leftViewController (){
    AppDelegate * app;
    weatherViewController *weathervC;
}
@property (strong, readwrite, nonatomic) UITableView *tableView;
@end

@implementation leftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    weathervC=[[weatherViewController alloc]init];
    app = [UIApplication sharedApplication].delegate;
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 54 * 5) / 2.0f, self.view.frame.size.width-110, 54 * 5) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.bounces = NO;
        tableView.scrollsToTop = NO;
        tableView;
    });
//    [self.tableView setBackgroundColor:[UIColor redColor]];
    [self.view setBackgroundColor: [UIColor clearColor] ];
    [self.view addSubview:self.tableView];
    [self button];
    // Do any additional setup after loading the view.
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"%ld",editingStyle);
    [app.weatherSource removeObjectAtIndex:indexPath.row];
   
    if (self.delegate) {
        [self.delegate didRemoveCell:indexPath.row];
    }
   
    
    [self.tableView reloadData];
}

-(void)button{
    UIButton *bianji=[[UIButton alloc]initWithFrame:CGRectMake(0, 165, 80, 30)];
    [bianji setTitle:@"编 辑" forState:UIControlStateNormal];
    [bianji addTarget:self action:@selector(del) forControlEvents:UIControlEventTouchUpInside];
    bianji.titleLabel.font=[UIFont systemFontOfSize:20];
    
    [self.view addSubview:bianji];
    UIButton *tianjia=[[UIButton alloc]initWithFrame:CGRectMake(200, 165, 80, 30)];
   [tianjia setTitle:@"添 加" forState:UIControlStateNormal];
    tianjia.titleLabel.font=[UIFont systemFontOfSize:20];
    [tianjia addTarget:self action:@selector(tianjia) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tianjia];
}
-(void)tianjia{
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    tianjiaViewController *tianjia=[story instantiateViewControllerWithIdentifier:@"tianjia"];
    [self presentViewController:tianjia animated:YES completion:nil];
   
}

-(void)del{
    //默认是删除  如果需要加号  就uitableviewcelleditingstyleinsert
    //uitableviewcelleditingstyledelete
    //获取当前tabbleview的编辑状态
    BOOL flag=self.tableView.editing;
    
    //每次点击对以前状态取反
    [self.tableView setEditing:!flag animated:YES];
    
}


#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
     app.currentPage = indexPath.row;
    
    switch (indexPath.row) {
        case 0:

            break;
            
        default:
            break;
    }
    
    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"firstViewController"]]
                                                 animated:YES];
    [self.sideMenuViewController hideMenuViewController];
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return app.weatherSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
        

    }
    
    cell.textLabel.text = app.weatherSource[indexPath.row];

    //NSArray *titles = @[@"Home", @"Calendar", @"Profile", @"Settings", @"Log Out"];

    return cell;
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
