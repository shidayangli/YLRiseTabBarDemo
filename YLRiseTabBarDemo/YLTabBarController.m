//
//  YLTabBarController.m
//  YLRiseTabBarDemo
//
//  Created by 杨立 on 15/10/22.
//  Copyright (c) 2015年 杨立. All rights reserved.
//

#import "YLTabBarController.h"
#import "YLHomeViewController.h"
#import "YLSameCityViewController.h"
#import "YLMessageViewController.h"
#import "YLMineViewController.h"
#import "YLTabBar.h"

@interface YLTabBarController ()<YLTabBarDelegate, UIActionSheetDelegate>

@end

@implementation YLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置子控制器
    YLHomeViewController *home = [[YLHomeViewController alloc] init];
    [self setChildVC:home title:@"首页" image:@"home_normal" selectedImage:@"home_highlight"];
    YLSameCityViewController *sameCity = [[YLSameCityViewController alloc] init];
    [self setChildVC:sameCity title:@"同城" image:@"mycity_normal" selectedImage:@"mycity_highlight"];
    YLMessageViewController *message = [[YLMessageViewController alloc] init];
    [self setChildVC:message title:@"消息" image:@"message_normal" selectedImage:@"message_highlight"];
    YLMineViewController *mine = [[YLMineViewController alloc] init];
    [self setChildVC:mine title:@"我的" image:@"account_normal" selectedImage:@"account_highlight"];
    
    YLTabBar *tabBar = [[YLTabBar alloc] init];
    tabBar.delegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc            子控制器
 *  @param title              tabbar标题
 *  @param image              tabbar图片名
 *  @param selectedImage      tabbar选中图片名
 */
-(void)setChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVC.tabBarItem.title = title;
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:12];
    [childVC.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:childVC];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabBarButtonClick:(YLTabBar *)tabBar
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                            delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册选取", @"淘宝一键转卖", nil];
    [actionSheet showFromTabBar:tabBar];
}
@end
