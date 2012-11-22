//
//  AppDelegate.m
//  backgrounds
//
//  Created by Michael on 19.11.12.
//  Copyright (c) 2012 mikeapphouse. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>

//Это категория UINavigationController, просто целиком прописана здесь, а не отдельными файлами, для удобства
@interface UINavigationController (NavbarWithShadow)
@end

@implementation UINavigationController (NavbarWithShadow)

- (void)viewDidLoad {
    
    CGFloat bottomLevel = self.navigationBar.frame.size.height;
    
    CAGradientLayer *shadow = [[CAGradientLayer alloc] init];

    CGColorRef dark = [[UIColor blackColor] colorWithAlphaComponent:0.8].CGColor;
    CGColorRef light = [UIColor clearColor].CGColor;
    shadow.frame = CGRectMake(0,bottomLevel, self.view.frame.size.width, 7.0);
    shadow.colors = [NSArray arrayWithObjects:(__bridge id)(dark), (__bridge id)light, nil];
    shadow.type = kCAGradientLayerAxial;
    [self.view.layer addSublayer:shadow];
    [super viewDidLoad];
}
@end
//=================================== конец категории ==============================================
@implementation AppDelegate

- (void) customizeInteface {
//resizableImageWithCapInsets применяется чтобы растайлить короткий подкладочный рисунок. Это рисунок правращен в бесшовную текстуру заранее
//в фотошопе с помощью фильтра Offset.
    UIImage *barImage = [[UIImage imageNamed:@"navbar1.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [[UINavigationBar appearance] setBackgroundImage:barImage forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor],UITextAttributeTextColor,
      [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(0, -1)], UITextAttributeTextShadowOffset,
      [UIFont fontWithName:@"Helvetica-Bold" size:16.0], UITextAttributeFont,
      nil]];
    UIColor *buttonTintColor = [UIColor colorWithRed:65.0/255.0 green:72.0/255.0 blue:77.0/255.0 alpha:1.0];
    [[UIBarButtonItem appearance] setTintColor:buttonTintColor];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self customizeInteface];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        MasterViewController *masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController_iPhone" bundle:nil];
        self.navigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
        self.window.rootViewController = self.navigationController;
    } else {
        MasterViewController *masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController_iPad" bundle:nil];
        UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
        
        DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController_iPad" bundle:nil];
        UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    	
    	masterViewController.detailViewController = detailViewController;
    	
        self.splitViewController = [[UISplitViewController alloc] init];
        self.splitViewController.delegate = detailViewController;
        self.splitViewController.viewControllers = @[masterNavigationController, detailNavigationController];
        
        self.window.rootViewController = self.splitViewController;
    }
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
