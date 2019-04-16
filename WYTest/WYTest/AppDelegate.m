//
//  AppDelegate.m
//  WYTest
//
//  Created by iOS on 2019/4/16.
//  Copyright © 2019年 iOS. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()<UITabBarDelegate,UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self tabBarViewController];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}
- (void)tabBarViewController{
    NSArray *arr = @[@"首页",@"视频",@"陪玩",@"社交",@"我的"];
    NSArray *darkImage = @[@"home－1",@"video－1",@"peiwan",@"shejiao",@"wode－1"];
    NSArray *lightImage = @[@"home－1",@"home－1",@"home－1",@"shejiao－1",@"home－1"];
    [self tabBarControllerWithControllers:@[[ViewController class],[ViewController class],[ViewController class],[ViewController class],[ViewController class]] darkImageNames:darkImage lightImageNames:lightImage tabBarNames:arr];
}
/**
 *  主页成为根数图控制器
 */
- (void)tabBarControllerWithControllers:(NSArray *)controllers darkImageNames:(NSArray *)darkImageNames lightImageNames:(NSArray *)lightImageNames tabBarNames:(NSArray *)names{
    UIWindow *window = self.window;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < controllers.count; i++) {
        UIImage *image1 = [UIImage imageNamed:lightImageNames[i]];
        image1 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *image2 =[UIImage imageNamed:darkImageNames[i]];
        image2 = [image2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIViewController *vc = [[[controllers[i] class]alloc] init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        nav.tabBarItem.title = names[i];
        nav.tabBarItem.image = image2;
        nav.tabBarItem.selectedImage = image1;
        nav.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
        [nav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(2, 0)];
        [array addObject:nav];
    }
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.delegate = self;
    //    tabBarController.tabBar.delegate = self;
    tabBarController.viewControllers = array;
    //[tabBarController.tabBar setTintColor:[UIColor colorWithHexString:@"ff4d29"]];
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor colorWithRed:23/255.0 green:158/255.0 blue:244/255.0 alpha:1.0]} forState:UIControlStateSelected];
    tabBarController.selectedIndex = 3;
    window.rootViewController = tabBarController;
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
