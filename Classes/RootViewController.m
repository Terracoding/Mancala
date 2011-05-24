//
//  RootViewController.m
//  Kalah-iPad
//
//  Created by Dominic Wroblewski on 14/05/2010.
//  Copyright TerraCoding 2010. All rights reserved.
//

#import "RootViewController.h"
#import "SinglePlayerGame.h"
#import "MultiPlayerGame.h"
#import "Options.h"
#import "Help.h"

@implementation RootViewController

@synthesize popOver;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Kalah!";
	
	self.navigationItem.rightBarButtonItem = helpButton;
	self.navigationItem.leftBarButtonItem = optionsButton;
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closePopover) name:@"closePopover" object:nil];
	
}


-(void)closePopover {
	[popOver dismissPopoverAnimated:YES];
}


-(IBAction)showHelp:(id)sender {
	
	
	[popOver dismissPopoverAnimated:YES];
	
	Help *help = [[Help alloc] initWithNibName:@"Help" bundle:nil];
	popOver = [[UIPopoverController alloc] initWithContentViewController:help];
	popOver.delegate = self;
	[popOver presentPopoverFromBarButtonItem:helpButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	
	
	
}

-(IBAction)showOptions:(id)sender {
	
	[popOver dismissPopoverAnimated:YES];
	
	Options *options = [[Options alloc] initWithNibName:@"Options" bundle:nil];
	popOver = [[UIPopoverController alloc] initWithContentViewController:options];
	popOver.delegate = self;
	[popOver presentPopoverFromBarButtonItem:optionsButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
	
	
}


-(IBAction)playSingle:(id)sender {
	
	NSLog(@"Going to single player game");
	SinglePlayerGame *spg = [[SinglePlayerGame alloc] initWithNibName:@"SinglePlayerGame" bundle:nil];
	[self.navigationController pushViewController:spg animated:YES];	
	
}


-(IBAction)playMulti:(id)sender {
	
	NSLog(@"Going to multi player game");
	MultiPlayerGame *mpg = [[MultiPlayerGame alloc] initWithNibName:@"MultiPlayerGame" bundle:nil];
	[self.navigationController pushViewController:mpg animated:YES];
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

