//
//  RootViewController.h
//  Kalah-iPad
//
//  Created by Dominic Wroblewski on 14/05/2010.
//  Copyright TerraCoding 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPopoverControllerDelegate>
{
	IBOutlet UIBarButtonItem    * optionsButton;
	IBOutlet UIBarButtonItem    * helpButton;
	UIPopoverController         * popOver;
}

- (void)closePopover;
- (IBAction)playSingle:(id)sender;
- (IBAction)playMulti:(id)sender;
- (IBAction)showHelp:(id)sender;
- (IBAction)showOptions:(id)sender;

@property (nonatomic, retain) UIPopoverController * popOver;

@end
