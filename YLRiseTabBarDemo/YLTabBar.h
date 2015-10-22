//
//  YLTabBar.h
//  YLRiseTabBarDemo
//
//  Created by 杨立 on 15/10/22.
//  Copyright (c) 2015年 杨立. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YLTabBar;

@protocol YLTabBarDelegate <NSObject>

-(void)tabBarButtonClick:(YLTabBar *)tabBar;

@end

@interface YLTabBar : UITabBar

@property (nonatomic, weak) id<YLTabBarDelegate> delegate;

@end
