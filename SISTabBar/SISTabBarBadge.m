//
//  SISTabBarBadge.m
//  SISTabBar
//
//  Created by Destiny on 2017/6/20.
//  Copyright © 2017年 Destiny. All rights reserved.
//

#import "SISTabBarBadge.h"

@interface SISTabBarBadge ()

@property (strong, nonatomic) UILabel *tabBarBadgeLbl;

@end

@implementation SISTabBarBadge

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.tabBarBadgeLbl];
    }
    return self;
}

- (UILabel *)tabBarBadgeLbl
{
    if (!_tabBarBadgeLbl) {
        _tabBarBadgeLbl = [[UILabel alloc] init];
        _tabBarBadgeLbl.textColor = [UIColor whiteColor];
        _tabBarBadgeLbl.textAlignment = NSTextAlignmentCenter;
        _tabBarBadgeLbl.font = [UIFont systemFontOfSize:10.];
    }
    return _tabBarBadgeLbl;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    self.hidden = [badgeValue intValue] <= 0?YES:NO;
    
    CGRect frame = self.frame;
    frame.origin.x = ([UIScreen mainScreen].bounds.size.width /self.tabBarItemCount)/2 + 12;
    frame.origin.y = 4.0f;
    
    self.tabBarBadgeLbl.text = badgeValue;
    
    if ([badgeValue intValue] > 0 && [badgeValue intValue] < 100 ) {
        
        frame.size.width = 14;
        frame.size.height = 14;
        self.frame = frame;
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = frame.size.width/2.0;
        
    } else {
        
        frame.size.width = 25.0f;
        frame.size.height = 14;
        self.frame = frame;
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = frame.size.width/6;
    }
    
    
    self.tabBarBadgeLbl.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);

}

@end
