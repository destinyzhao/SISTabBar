//
//  SISTabBarController.h
//  SISTabBar
//
//  Created by Destiny on 2017/6/20.
//  Copyright © 2017年 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SISTabBar.h"


@protocol SISTabBarControllerDelegate <NSObject>

@optional

-(void)tabBarSelectedItemIndex:(NSInteger)index;

@end

@interface SISTabBarController : UITabBarController

@property (nonatomic, assign) id<SISTabBarControllerDelegate> tabBarDelegate;

/**
 *  TabBar
 */
@property (nonatomic, strong) SISTabBar *sisTabBar;

/**
 *  TabBar item title color
 */
@property (nonatomic, strong) UIColor *itemTitleColor;

/**
 *  TabBar selected item title color
 */
@property (nonatomic, strong) UIColor *selectedItemTitleColor;

/**
 *  TabBar item title font
 */
@property (nonatomic, strong) UIFont *itemTitleFont;

/**
 *  TabBar item's badge title font
 */
@property (nonatomic, strong) UIFont *badgeTitleFont;

+(instancetype)sharedTabBarController;

-(void)attempDealloc;

/**
 *  默认选中的ViewController
 *
 *  @param tabBarSelectedIndex slelectIndex
 */
- (void)tabBarSelectedWithSelectedIndex:(NSInteger)tabBarSelectedIndex;

/**
 更新TabBar Item Badge

 @param badge badgeValue
 @param itemIndex TabBar Item Index
 */
- (void)updateTabBarItemBadge:(NSString *)badge itemIndex:(NSInteger)itemIndex;


@end
