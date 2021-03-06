//
//  SetupTabBar.m
//  SISTabBar
//
//  Created by Destiny on 2017/6/20.
//  Copyright © 2017年 Destiny. All rights reserved.
//

#import "SetupTabBar.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewController5.h"
#import "SISNavigationController.h"

@implementation SetupTabBar

+ (instancetype)sharedTabBar
{
    static SetupTabBar *_tabBar;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tabBar = [[SetupTabBar alloc]init];
    });
    return _tabBar;
}

- (NSMutableArray *)viewControllersArray
{
    if (!_viewControllersArray) {
        _viewControllersArray = [NSMutableArray array];
    }
    return _viewControllersArray;
}

/**
 *  添加所有的子控制器
 */
- (void)setupViewControllers
{
    ViewController1 *vc1 = [[ViewController1 alloc] init];
    [self addOneChildVC:vc1 title:@"Home" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    [self addOneChildVC:vc2 title:@"Message" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    ViewController5 *vc5 = [[ViewController5 alloc] init];
    [self addOneChildVC:vc5 title:@"中心" imageName:@"tabbar_center_selected" selectedImageName:@"tabbar_center"];
    
    ViewController3 *vc3 = [[ViewController3 alloc] init];
    [self addOneChildVC:vc3 title:@"Discover" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    ViewController4 *vc4 = [[ViewController4 alloc] init];
    [self addOneChildVC:vc4 title:@"Profile" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}


/**
 添加一个控制器
 
 @param childVc 子控制器对象
 @param title 标题
 @param imageName 图标
 @param selectedImageName 选中时的图标
 */
- (void)addOneChildVC:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    // 设置标题
    childVc.tabBarItem.title = title;
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    // 不要渲染
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    // 添加为tabbar控制器的子控制器
    SISNavigationController *nav = [[SISNavigationController alloc] initWithRootViewController:childVc];
    
    [self.viewControllersArray addObject:nav];
}


@end
