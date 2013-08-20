//
//  AppDelegate.h
//  Tutorial
//
//  Created by Projet on 13/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Reachability;
@class Home;
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    Reachability *internetReach;
    UINavigationController *navigationController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@end
