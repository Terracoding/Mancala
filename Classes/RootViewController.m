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

- (void)viewDidLoad
{
  [super viewDidLoad];
	
	self.title = @"Kalah - The game of Mancala";
	self.navigationItem.rightBarButtonItem = helpButton;
	self.navigationItem.leftBarButtonItem = optionsButton;
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closePopover) name:@"closePopover" object:nil];
}

- (void)closePopover
{
	[popOver dismissPopoverAnimated:YES];
}

- (void)presentPopOver:(UIViewController *)viewController fromButton:(UIBarButtonItem *)button
{
  [self closePopover];
  popOver = [[UIPopoverController alloc] initWithContentViewController:viewController];
	popOver.delegate = self;
	[popOver presentPopoverFromBarButtonItem:button permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (IBAction)showHelp:(id)sender
{
	Help * help = [[Help alloc] initWithNibName:@"Help" bundle:nil];
  [self presentPopOver:help fromButton:helpButton];
  [help release];
}

- (IBAction)showOptions:(id)sender
{
	Options * options = [[Options alloc] initWithNibName:@"Options" bundle:nil];
  [self presentPopOver:options fromButton:optionsButton];
  [options release];
}

- (IBAction)playSingle:(id)sender
{
	SinglePlayerGame * singlePlayerGame = [[SinglePlayerGame alloc] initWithNibName:@"SinglePlayerGame" bundle:nil];
	[self.navigationController pushViewController:singlePlayerGame animated:YES];
  [singlePlayerGame release];
}


- (IBAction)playMulti:(id)sender
{
	MultiPlayerGame * multiPlayerGame = [[MultiPlayerGame alloc] initWithNibName:@"MultiPlayerGame" bundle:nil];
	[self.navigationController pushViewController:multiPlayerGame animated:YES];
  [multiPlayerGame release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return YES;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
  
}

- (void)dealloc
{
  [super dealloc];
}

@end

