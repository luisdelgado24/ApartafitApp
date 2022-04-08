//
//  AppDelegate.m
//  ApartafitApp
//
//  Created by Luis Delgado on 3/15/22.
//

#import "AppDelegate.h"

@import FirebaseAuthUI;
@import FirebaseCore;
@import FirebaseGoogleAuthUI;

@interface AppDelegate () <FUIAuthDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FIRApp configure];
    
    for (NSString *familyName in UIFont.familyNames) {
        NSArray<NSString *> *names = [[UIFont class] fontNamesForFamilyName:familyName];
        NSLog(@"Family name: ");
        NSLog(@"%@", familyName);
        NSLog(@"\nFont names: ");
        
        for (NSString *str in names) {
            NSLog(@"%@, ", str);
        }
        NSLog(@"\n");
    }

    //    FUIAuth *authUI = [FUIAuth defaultAuthUI];
//    // You need to adopt a FUIAuthDelegate protocol to receive callback
//    authUI.delegate = self;
//
//    NSArray<id<FUIAuthProvider>> *providers = @[
//      [[FUIGoogleAuth alloc] initWithAuthUI:authUI],
//    ];
//    authUI.providers = providers;
//    UINavigationController *authViewController = [authUI authViewController];
    return YES;
}

#pragma mark - FUIAuthDelegate

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {
  NSString *sourceApplication = options[UIApplicationOpenURLOptionsSourceApplicationKey];
  return [[FUIAuth defaultAuthUI] handleOpenURL:url sourceApplication:sourceApplication];
}

- (void)wiu:(FUIAuth *)authUI
didSignInWithUser:(nullable FIRUser *)user
         error:(nullable NSError *)error {
// Implement this method to handle signed in user or error if any.
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
