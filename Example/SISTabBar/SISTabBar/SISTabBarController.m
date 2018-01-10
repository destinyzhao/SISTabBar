//
//  SISTabBarController.m
//  SISTabBar
//
//  Created by Destiny on 2017/6/20.
//  Copyright © 2017年 Destiny. All rights reserved.
//

#import "SISTabBarController.h"
#import "SISTabBarItem.h"

#define ColorForTabBar(r, g, b)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
// 适配iPhone x TabBar 底栏高度
#define TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

static dispatch_once_t onceToken;
static SISTabBarController *_tabBarController;

@interface SISTabBarController ()<SISTabBarDelegate>


@end

@implementation SISTabBarController

- (UIColor *)itemTitleColor {
    
    if (!_itemTitleColor) {
        
        _itemTitleColor = [UIColor blackColor];
    }
    return _itemTitleColor;
}

- (UIColor *)selectedItemTitleColor {
    
    if (!_selectedItemTitleColor) {
        
        _selectedItemTitleColor = [UIColor redColor];
    }
    return _selectedItemTitleColor;
}

- (UIFont *)itemTitleFont {
    
    if (!_itemTitleFont) {
        
        _itemTitleFont = [UIFont systemFontOfSize:10.0f];
    }
    return _itemTitleFont;
}

- (UIFont *)badgeTitleFont {
    
    if (!_badgeTitleFont) {
        
        _badgeTitleFont = [UIFont systemFontOfSize:11.0f];
    }
    return _badgeTitleFont;
}

+(instancetype)sharedTabBarController
{
    dispatch_once(&onceToken, ^{
        if (_tabBarController == nil) {
            _tabBarController = [[SISTabBarController alloc]init];
        }
    });
    return _tabBarController;
}

-(void)attempDealloc
{
    onceToken = 0; // 只有置成0,GCD才会认为它从未执行过.它默认为0.这样才能保证下次再次调用shareInstance的时候,再次创建对象.
    _tabBarController = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self removeOriginTabBar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpTabbar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 删除原生TabBar
 */
- (void)removeOriginTabBar
{
    for (UIView *view in self.tabBar.subviews) {
        if (![view isKindOfClass:[SISTabBar class]]) {
            [view removeFromSuperview];
        }
    }
}

/**
 初始化TabBar
 */
- (void)setUpTabbar
{
    CGRect rect = self.tabBar.bounds;
    rect.size.height = TabBarHeight;
    SISTabBar *tabBar = [[SISTabBar alloc] initWithFrame:rect];
    tabBar.delegate = self;
    [self.tabBar addSubview:tabBar];
    
    self.sisTabBar = tabBar;
}


- (void)setViewControllers:(NSArray *)viewControllers {
    
    self.sisTabBar.badgeTitleFont = self.badgeTitleFont;
    self.sisTabBar.itemTitleFont = self.itemTitleFont;
    self.sisTabBar.itemTitleColor = self.itemTitleColor;
    self.sisTabBar.selectedItemTitleColor = self.selectedItemTitleColor;
    
    self.sisTabBar.tabBarItemCount = viewControllers.count;
    
    [self setupChildViewController:viewControllers];
    
    [self.sisTabBar addTabBarItemWithViewControllers:viewControllers selectIndex:0 irregularIndex:0];
}

/**
 Add ChildViewController
 */
- (void)setupChildViewController:(NSArray *)viewControllers
{
    for (UINavigationController *vc in viewControllers) {
        [self addChildViewController:vc];
    }
}

/**
 *  默认选中的ViewController
 *
 *  @param tabBarSelectedIndex slelectIndex
 */
- (void)tabBarSelectedWithSelectedIndex:(NSInteger)tabBarSelectedIndex
{
    // 取默认的Tabbar Item
    [self.sisTabBar tabBarItemSelectdWithIndex:tabBarSelectedIndex];
}

#pragma mark - XXTabBarDelegate Method
- (void)tabBar:(SISTabBar *)tabBarView didSelectedItemFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    self.selectedIndex = toIndex;
    
    if (self.tabBarDelegate && [self.tabBarDelegate respondsToSelector:@selector(tabBarSelectedItemIndex:)]) {
        [self.tabBarDelegate tabBarSelectedItemIndex:toIndex];
    }
}

#pragma mark - 更新TabBar Item Badge
- (void)updateTabBarItemBadge:(NSString *)badge itemIndex:(NSInteger)itemIndex
{
     [self.sisTabBar updateTabBarItemBadge:badge tabBarIndex:itemIndex];
}

#pragma mark - TabBar点击动画
- (void)tabBarSelectedAnimation:(NSInteger)index
{
    if (self.sisTabBar.tabBarItemArray.count && index < self.sisTabBar.tabBarItemArray.count)
    {
        CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pulse.duration = 0.2;
        pulse.repeatCount= 1;
        pulse.autoreverses= YES;
        pulse.fromValue= [NSNumber numberWithFloat:0.7];
        pulse.toValue= [NSNumber numberWithFloat:1.0];
        [[self.sisTabBar.tabBarItemArray[index] layer]
         addAnimation:pulse forKey:nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
