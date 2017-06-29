//
//  SISTabBar.h
//  SISTabBar
//
//  Created by Destiny on 2017/6/20.
//  Copyright © 2017年 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SISTabBar, SISTabBarItem;

@protocol SISTabBarDelegate <NSObject>

@optional

/**
 TabBar's item be selected
 */
- (void)tabBar:(SISTabBar *)tabBarView didSelectedItemFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

@end


@interface SISTabBar : UIView

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

/**
 *  TabBar's item count
 */
@property (nonatomic, assign) NSInteger tabBarItemCount;

/**
 存储 TabBarItem
 */
@property (strong, nonatomic) NSMutableArray *tabBarItemArray;

/**
 *  TabBar delegate
 */
@property (nonatomic, assign) id<SISTabBarDelegate> delegate;

/**
 初始化TabBar Item
 
 @param viewContrllers viewContrllers
 @param selectIndex 默认选中TabBarItem
 @param irregularIndex 不规则TabBarItemIndex
 */
- (void)addTabBarItemWithViewControllers:(NSArray *)viewContrllers selectIndex:(NSInteger)selectIndex irregularIndex:(NSInteger)irregularIndex;


/**
 update TabBarItem Badge vaule

 @param badge badgeValue
 @param tabBarIndex selected TabBarItem Index
 */
- (void)updateTabBarItemBadge:(NSString *)badge tabBarIndex:(NSInteger)tabBarIndex;


/**
 set Tabbar Item seleted

 @param selectedIndex selected Index
 */
- (void)tabBarItemSelectdWithIndex:(NSInteger)selectedIndex;


@end

