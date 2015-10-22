//
//  YLTabBar.m
//  YLRiseTabBarDemo
//
//  Created by 杨立 on 15/10/22.
//  Copyright (c) 2015年 杨立. All rights reserved.
//

#import "YLTabBar.h"
#import "UIView+Extension.h"

@implementation YLTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    UIButton *publishButton = [[UIButton alloc] init];
    [publishButton setBackgroundImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
    [self addSubview:publishButton];
    [publishButton addTarget:self action:@selector(publishButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"发布";
    label.font = [UIFont systemFontOfSize:12];
    [label sizeToFit];
    [self addSubview:label];

    publishButton.size = publishButton.currentBackgroundImage.size;
    publishButton.centerX = self.width * 0.5;
    publishButton.centerY = 0;
    
    label.centerX = publishButton.centerX;
    label.centerY = publishButton.centerY + publishButton.height * 0.7;
    
    //设置其他按钮位置
    NSUInteger count = self.subviews.count;
    for (NSUInteger i = 0, j = 0; i < count; i++) {
        UIView *child = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.width = self.width / 5.0;
            child.x = self.width * j / 5.0;
            j++;
            if (j == 2) {
                j++;
            }
        }
    }
}

-(void)publishButtonClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(tabBarButtonClick:)]) {
        [self.delegate tabBarButtonClick:self];
    }
}
@end
