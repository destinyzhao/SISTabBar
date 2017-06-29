# SISTabBar
custom TabBar

Podfile

pod 'SISTabBar'

主要代码

```/**
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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    SISTabBarController *tabBar = [SISTabBarController sharedTabBarController];
    tabBar.selectedItemTitleColor = [UIColor redColor];
    [[SetupTabBar sharedTabBar] setupViewControllers];
    tabBar.viewControllers = [[SetupTabBar sharedTabBar] viewControllersArray];
    tabBar.tabBarDelegate = self;
    self.tabBarController = tabBar;
    
    self.window.rootViewController = tabBar;
    
    return YES;
}

#pragma mark - SISTabBarControllerDelegate Method
- (void)tabBarSelectedItemIndex:(NSInteger)index
{
    NSLog(@"TabBarItem Selected%ld",index);
}
```
