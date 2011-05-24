//
//  Kalah_iPadAppDelegate.m
//  Kalah-iPad
//
//  Created by Dominic Wroblewski on 14/05/2010.
//  Copyright TerraCoding 2010. All rights reserved.
//

#import "Kalah_iPadAppDelegate.h"
#import "RootViewController.h"

@implementation Kalah_iPadAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    
    // Add the split view controller's view to the window and display.
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
	
	if (![[NSUserDefaults standardUserDefaults] objectForKey:@"startingStones"]) {
		[[NSUserDefaults standardUserDefaults] setObject:@"6" forKey:@"startingStones"];
	}
    
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [navigationController release];
    [window release];
    [super dealloc];
}


@end

