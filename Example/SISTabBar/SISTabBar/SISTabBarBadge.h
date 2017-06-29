//
//  SISTabBarBadge.h
//  SISTabBar
//
//  Created by Destiny on 2017/6/20.
//  Copyright © 2017年 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SISTabBarBadge : UIView

/**
 *  TabBar item badge value
 */
@property (nonatomic, copy) NSString *badgeValue;
/**
 *  TabBar item's badge title font
 */
@property (nonatomic, strong) UIFont *badgeTitleFont;

/**
 *  TabBar's item count
 */
@property (nonatomic, assign) NSInteger tabBarItemCount;


@end
