//
//  AppDelegate.m
//  Bodega
//
//  Created by CLAG on 10/2/16.
//  Copyright © 2016 Agbo. All rights reserved.
//

#import "AGFAppDelegate.h"
#import "AGFWineModel.h"
#import "AGFWineViewController.h"
#import "AGFWebViewController.h"

@interface AGFAppDelegate ()

@end

@implementation AGFAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    AGFWineModel *tintorro = [AGFWineModel wineWithName:@"Bembibre"
                                        wineCompanyName:@"Dominio de Tares"
                                                   type:@"Tinto"
                                                 origin:@"El Bierzo"
                                                 grapes:@[@"Mencía"]
                                         wineCompanyWeb:[NSURL URLWithString:@"http://www.dominiodetares.com"]
                                                  notes:@"Vendiamiado a mano racimo a racimo, fermentado con su propia levadura natural y criado durante 16 meses en barricas de roble francés y americano con 24 meses extra en botella. Vino de intenso color granate, nariz de frutos rojos y negros confitados, recuerdos de ciruela pasa y frutos secos tostados. Boca densa, pulida y cálida. Para compartir platos de sabor potente, como cocidos hechos a fuego lento, carnes de caza o cordero al horno. Se recomienda abrirlo y decantarlo 30 minutos antes de servir y disfrutarlo a una temperatura de unos 16°C. Nunca muy fresco ni demasiado caliente."
                                                 rating:5
                                                  photo:[UIImage imageNamed:@"bembibre.jpg"]];
    
    AGFWineModel *albarinno = [AGFWineModel wineWithName:@"Zárate"
                                         wineCompanyName:@"Zárate"
                                                    type:@"white"
                                                  origin:@"Rias Bajas"
                                                  grapes:@[@"Albariño"]
                                          wineCompanyWeb:[NSURL URLWithString:@"http://www.albarino-zarate.com"]
                                                   notes:@"El albariño Zarate es un vino blanco monovarietal que pertenece a la Denominación de Origen Rías Baixas. Considerado por la crítica especializada como uno de los grandes vinos blancos del mundo, el albariño ya es todo un mito."
                                                  rating:4
                                                   photo:[UIImage imageNamed:@"zarate.gif"]];
    
    AGFWineModel *champagne = [AGFWineModel wineWithName:@"Comtes de Champagne"
                                         wineCompanyName:@"Champagne Taittinger"
                                                    type:@"other"
                                                  origin:@"Champagne"
                                                  grapes:@[@"Chardonnay"]
                                          wineCompanyWeb:[NSURL URLWithString:@"http://www.taittinger.fr"]
                                                   notes:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nunc purus. Curabitur eu velit mauris. Curabitur magna nisi, ullamcorper ac bibendum ac, laoreet et justo. Praesent vitae tortor quis diam luctus condimentum. Suspendisse potenti. In magna elit, interdum sit amet facilisis dictum, bibendum nec libero. Maecenas pellentesque posuere vehicula. Vivamus eget nisl urna, quis egestas sem. Vivamus at venenatis quam. Sed eu nulla a orci fringilla pulvinar ut eu diam. Morbi nibh nibh, bibendum at laoreet egestas, scelerisque et nisi. Donec ligula quam, semper nec bibendum in, semper eget dolor. In hac habitasse platea dictumst. Maecenas adipiscing semper rutrum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;"
                                                  rating:5
                                                   photo:[UIImage imageNamed:@"comtesDeChampagne.jpg"]];
    
    
    

    // Creamos el controlador
    AGFWineViewController *tintoVC = [[AGFWineViewController alloc] initWithModel:tintorro];
    AGFWineViewController *blancoVC = [[AGFWineViewController alloc] initWithModel:albarinno];
    AGFWineViewController *otroVC = [[AGFWineViewController alloc] initWithModel:champagne];
    
    // Creamos los Navigation
    UINavigationController *tintoNav = [[UINavigationController alloc] initWithRootViewController:tintoVC];
    UINavigationController *blancoNav = [[UINavigationController alloc] initWithRootViewController:blancoVC];
    UINavigationController *otroNav = [[UINavigationController alloc] initWithRootViewController:otroVC];
    
    // Creamos TabBar (combinador va a contoner los combinadores navigations)
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = @[tintoNav, blancoNav, otroNav];
    
    
    // Lo asignamos como controlador raíz
    self.window.rootViewController = tabVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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
