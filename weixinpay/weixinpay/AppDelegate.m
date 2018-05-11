//
//  AppDelegate.m
//  weixinpay
//
//  Created by 黄科源 on 2018/5/10.
//  Copyright © 2018年 黄科源. All rights reserved.
//

#import "AppDelegate.h"
#import "WXApi.h"

@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //向微信注册wxd930ea5d5a258f4f
//    [WXApi registerApp:@"wxb4ba3c02aa476ea1" withDescription:@"demo 2.0"];
    [WXApi registerApp:@"wxdbf9d303afbb7c4d"];//wxdbf9d303afbb7c4d
    
    
    
    

    
    return YES;
}

//微信回调,有支付结果的时候会回调这个方法

- (void)onResp:(BaseResp *)resp

{
    
    //    支付结果回调
    
    if([resp isKindOfClass:[PayResp class]]){
        
        switch (resp.errCode) {
                
            case WXSuccess:{
                
                //支付返回结果，实际支付结果需要去自己的服务器端查询
                
                NSNotification *notification = [NSNotification notificationWithName:@"ORDER_PAY_NOTIFICATION" object:@"success"];
                
                [[NSNotificationCenter defaultCenter] postNotification:notification];
                
                
                
                break;
                
            }
                
            default:{
                
                NSNotification *notification = [NSNotification notificationWithName:@"ORDER_PAY_NOTIFICATION"object:@"fail"];
                
                [[NSNotificationCenter defaultCenter] postNotification:notification];
                
                break;
                
            }
                
        }
        
    }
    
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options

{
    

            
            return  [WXApi handleOpenURL:url delegate:(id<WXApiDelegate>)self];
            
        
    
    
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url

{
    

            
            return  [WXApi handleOpenURL:url delegate:(id<WXApiDelegate>)self];

    
}



- (BOOL)application:(UIApplication *)application

            openURL:(NSURL *)url

  sourceApplication:(NSString *)sourceApplication

         annotation:(id)annotation {
    
    
    
//    if ([url.scheme isEqualToString:@"wx2355549c49f5cf73"])
//
//    {
    
        return  [WXApi handleOpenURL:url delegate:(id<WXApiDelegate>)self];
        
//    }
    
    
    
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
