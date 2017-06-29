//
//  SISTabBar.m
//  SISTabBar
//
//  Created by Destiny on 2017/6/20.
//  Copyright © 2017年 Destiny. All rights reserved.
//

#import "SISTabBar.h"
#import "SISTabBarItem.h"

static CGFloat const kCameraViewWidth =  49;
static CGFloat const kCameraViewHeight = 61;
static CGFloat const kCameraBtnHeight = 50;

@interface SISTabBar ()

/**
 记录上一次选中的TabBarItem
 */
@property (strong, nonatomic) SISTabBarItem *selectedBarItem;

@property(nonatomic,strong) UIView *centerView;
@property(nonatomic,strong) UIButton *centerBtn;


@end

@implementation SISTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


#pragma mark - lazy load
- (NSMutableArray *)tabBarItemArray
{
    if (!_tabBarItemArray) {
        _tabBarItemArray = [NSMutableArray array];
    }
    return _tabBarItemArray;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLine];
    }
    return self;
}

- (void)setupLine
{
    self.backgroundColor = [UIColor whiteColor];
    
    UIView *line = [UIView new];
    line.frame = CGRectMake(0, -1, [UIScreen mainScreen].bounds.size.width, 1);
    line.backgroundColor = [UIColor grayColor];
    [self addSubview:line];
}

/**
 初始化TabBar Item

 @param viewContrllers viewContrllers
 @param selectIndex 默认选中TabBarItem
 @param irregularIndex 不规则TabBarItemIndex
 */
- (void)addTabBarItemWithViewControllers:(NSArray *)viewContrllers selectIndex:(NSInteger)selectIndex irregularIndex:(NSInteger)irregularIndex
{
    for (int i = 0; i < viewContrllers.count; i++) {
        
        SISTabBarItem *tabBarItem = [[SISTabBarItem alloc] init];
        CGFloat btnW = self.frame.size.width/viewContrllers.count;
        CGFloat btnX = i * btnW;
        CGFloat btnY = 0;
        CGFloat btnH = self.frame.size.height;
        tabBarItem.frame = CGRectMake(btnX, btnY, btnW, btnH);
        tabBarItem.tag = i;
        
        if (irregularIndex > 0  && irregularIndex == i) {
            
            _centerView =[[UIView alloc]init];
            _centerView.center = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, 18);
            _centerView.bounds = CGRectMake(0, 0, kCameraViewWidth, kCameraViewHeight);
            _centerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_center_bg"]];
            
            _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_centerBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_photo_selected"] forState:UIControlStateNormal];
            [_centerBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_photo"] forState:UIControlStateHighlighted];
            _centerBtn.frame =  CGRectMake(0, 5, kCameraViewWidth, kCameraBtnHeight);
        
            [_centerView addSubview:_centerBtn];
            
            [self addSubview:_centerView];
        }
        else{
            tabBarItem.badgeTitleFont = self.badgeTitleFont;
            tabBarItem.itemTitleFont = self.itemTitleFont;
            tabBarItem.itemTitleColor = self.itemTitleColor;
            tabBarItem.selectedItemTitleColor = self.selectedItemTitleColor;
            tabBarItem.tabBarItemCount = self.tabBarItemCount;
            
            UIViewController *viewContrller = viewContrllers[i];
            // 图片不要渲染
            UIImage *selectedImage = viewContrller.tabBarItem.selectedImage;
            viewContrller.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            tabBarItem.tabBarItem = viewContrller.tabBarItem;
            
            [self addSubview:tabBarItem];

        }
    
        [tabBarItem addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == selectIndex) {
            [self buttonClick:tabBarItem];
        }
        
        [self.tabBarItemArray addObject:tabBarItem];
    }
}

/**
 TabBarItem Clicked

 @param tabBarItem SISTabBarItem
 */
- (void)buttonClick:(SISTabBarItem *)tabBarItem {
    
    if (tabBarItem.selected) {
        return;
    }
    
    NSInteger fromIndex = _selectedBarItem.tag;
    
    _selectedBarItem.selected = NO;
    tabBarItem.selected = YES;
    _selectedBarItem = tabBarItem;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedItemFromIndex:toIndex:)]) {
        [self.delegate tabBar:self didSelectedItemFromIndex:fromIndex toIndex:tabBarItem.tag];
    }
    
}

/**
 set Tabbar Item seleted
 
 @param selectedIndex selected Index
 */
- (void)tabBarItemSelectdWithIndex:(NSInteger)selectedIndex
{
    if (selectedIndex < self.tabBarItemArray.count) {
        SISTabBarItem *tabBarItem = self.tabBarItemArray[selectedIndex];
        [self buttonClick:tabBarItem];
    }
}

/**
 update TabBarItem Badge vaule
 
 @param badge badgeValue
 @param tabBarIndex selected TabBarItem Index
 */
- (void)updateTabBarItemBadge:(NSString *)badge tabBarIndex:(NSInteger)tabBarIndex
{
    if (tabBarIndex < self.tabBarItemArray.count) {
        SISTabBarItem *tabBarItem = self.tabBarItemArray[tabBarIndex];
        tabBarItem.tabBarItem.badgeValue = badge;
    }
}

@end
