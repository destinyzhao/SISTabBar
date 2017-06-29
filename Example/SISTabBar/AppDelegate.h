//
//  AppDelegate.h
//  SISTabBar
//
//  Created by Destiny on 2017/6/20.
//  Copyright © 2017年 Destiny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SISTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,SISTabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SISTabBarController *tabBarController;


@end

