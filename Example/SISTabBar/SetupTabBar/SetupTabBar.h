//
//  SetupTabBar.h
//  SISTabBar
//
//  Created by Destiny on 2017/6/20.
//  Copyright © 2017年 Destiny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SetupTabBar : NSObject

/**
 视图控制器数组
 */
@property (strong, nonatomic) NSMutableArray *viewControllersArray;

+ (instancetype)sharedTabBar;

- (void)setupViewControllers;

@end
