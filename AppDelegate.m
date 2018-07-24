//
//  AppDelegate.m
//  SearchPeopleAndThings
//
//  Created by 孙苏 on 2017/11/24.
//  Copyright © 2017年 sunsu. All rights reserved.
//

/*
 甲震乙离丙辛坤，丁乾戊坎己巽门，庚日失物兑上找，壬癸可在艮上寻；
 甲己阳人乙庚阴，丙辛童子暗来侵，丁壬不出亲人手，戊癸失物不出门；
 子午卯酉在路旁，寅申巳亥归他乡，辰戌丑未身未动，书书参差细推详；
 甲己五里地，乙庚千里乡，丙辛整十里，丁壬三里藏，戊癸团团转，此是失物方。
 乾是西北，坎是正北，艮是东北，震是正东，巽是东南，离是正南，坤是西南，兑是正西
 
 寻人：https://wenku.baidu.com/view/dcfad4fa31b765ce0408146b.html

 */

#import "AppDelegate.h"

#import "ViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    ViewController * vc = [[self storyboard] instantiateViewControllerWithIdentifier:@"main"];
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController * vc = [storyBoard instantiateViewControllerWithIdentifier:@"main"];
    
    UINavigationController * navi = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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
