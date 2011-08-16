//
//  Options.m
//  Kalah-iPad
//
//  Created by Dominic Wroblewski on 27/05/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import "Options.h"

@implementation Options

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
	sectionsArray	= [[NSArray alloc] initWithObjects:@"Starting Stones", nil];
	array	= [[NSArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return YES;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return [sectionsArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [array count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger) section
{
	if (section == 0) {
		return @"Starting Stones";
	} else {
		return nil;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }

  cell.textLabel.text = [array objectAtIndex:indexPath.row];

  return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[[NSUserDefaults standardUserDefaults] setObject:[array objectAtIndex:indexPath.row] forKey:@"startingStones"];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"closePopover" object:nil];
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

