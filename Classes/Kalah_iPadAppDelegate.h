//
//  Kalah_iPadAppDelegate.h
//  Kalah-iPad
//
//  Created by Dominic Wroblewski on 14/05/2010.
//  Copyright TerraCoding 2010. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RootViewController;

@interface Kalah_iPadAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
