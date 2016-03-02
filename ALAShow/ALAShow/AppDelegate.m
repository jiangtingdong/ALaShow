//
//  AppDelegate.m
//  ALAShow
//
//  Created by 阿拉丁 on 16/3/1.
//  Copyright © 2016年 阿拉丁. All rights reserved.
//

#import "AppDelegate.h"
#import "ALAMainNavgationController.h"
#import "ALANewFeatureVC.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化APP
    [self initWithApp];
    
    // 设置新特性
//    [self setNewfeature];
    [self.window makeKeyAndVisible];
    return YES;
}

// 初始化APP
- (void)initWithApp
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ALAMainTabBarController *mainTabBarVC
    = [[ALAMainTabBarController alloc] init];
    
    // 首页
    UIStoryboard *hotTopSB = [UIStoryboard storyboardWithName:@"ALAHotTop" bundle:nil];
    ALAMainNavgationController *hotTopNVC = [hotTopSB instantiateInitialViewController];
    hotTopNVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"alaNo"] selectedImage:[UIImage imageNamed:@"alaSele"]];
    [hotTopNVC.tabBarItem  setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0]} forState:UIControlStateNormal];
    [hotTopNVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:KColor(255, 103, 45, 1.0)} forState:UIControlStateSelected];
    
    // 发布商品
    UIStoryboard *sendGoodsSB = [UIStoryboard storyboardWithName:@"ALASendGoods" bundle:nil];
    ALAMainNavgationController *sendGoodsNVC = [sendGoodsSB instantiateInitialViewController];
    sendGoodsNVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"add"] selectedImage:[UIImage imageNamed:@"add"]];
    sendGoodsNVC.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    [sendGoodsNVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:KColor(255, 103, 45, 1.0)} forState:UIControlStateNormal];
    [sendGoodsNVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:KColor(255, 103, 45, 1.0)} forState:UIControlStateSelected];
    
    // 个人中心
    UIStoryboard *myCenterSB = [UIStoryboard storyboardWithName:@"ALAMyCenter" bundle:nil];
    ALAMainNavgationController *myCenterNVC = [myCenterSB instantiateInitialViewController];
    myCenterNVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"my"] selectedImage:[UIImage imageNamed:@"mySele"]];
    [myCenterNVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:KColor(204, 204, 204, 1.0),NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateNormal];
    [myCenterNVC.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11], NSForegroundColorAttributeName:KColor(255, 103, 45, 1.0)} forState:UIControlStateSelected];
    
    mainTabBarVC.viewControllers = @[hotTopNVC,sendGoodsNVC,myCenterNVC];
    self.window.rootViewController = mainTabBarVC;
    [self.window makeKeyAndVisible];
    

    // 注册远程推送通知
    if ((KSysVersion >= 8.0)) {    // 在 iOS 8 下注册苹果推送，申请推送权限。
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge
                                                                                             |UIUserNotificationTypeSound
                                                                                             |UIUserNotificationTypeAlert) categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }else { // 注册苹果推送，申请推送权限。
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound];
    }
}

// 设置新特性
- (void)setNewfeature{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ALANewFeatureVC *newFeatureVC = [[ALANewFeatureVC alloc] initWithPreFixNameOfStartImage:@"firstView" andImageCount:4];
    self.window.rootViewController = newFeatureVC;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
