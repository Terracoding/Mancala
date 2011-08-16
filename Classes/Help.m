//
//  Help.m
//  Kalah-iPad
//
//  Created by Dominic Wroblewski on 28/05/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import "Help.h"

@implementation Help

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return YES;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger) section
{
	if (section == 0) {
		return @"About";
	} else if (section == 1) {
		return @"How To Play";
	} else {
		return nil;
	}
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 0) {
		return 1;
	} else {
		return 4;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
	
	if (indexPath.section == 0) {
		if (indexPath.row == 0) {
			cell.textLabel.text = @"Welcome to the game of Kalah, an ancient board game brought to the iPad.";
			cell.textLabel.font = [UIFont systemFontOfSize:15];
			cell.textLabel.numberOfLines = 4;
			cell.textLabel.textAlignment = UITextAlignmentCenter;
			cell.textLabel.lineBreakMode = UILineBreakModeClip;
		}
	} else {
		cell.textLabel.font = [UIFont systemFontOfSize:15];
		cell.textLabel.textAlignment = UITextAlignmentCenter;
		cell.textLabel.lineBreakMode = UILineBreakModeClip;

		switch (indexPath.row) {
			case 0:
				cell.textLabel.text = @"The board is made up of six pits per player.";
				cell.textLabel.numberOfLines = 2;
				break;
			case 1:
				cell.textLabel.text = @"The number of starting stones is placed in each of these pits equally.";
				cell.textLabel.numberOfLines = 2;
				break;
			case 2:
				cell.textLabel.text = @"Each player has a store to the left or right of the board. This is where the stones are deposited and can't be removed.";
				cell.textLabel.numberOfLines = 4;
				break;
			case 3:
				cell.textLabel.text = @"The game begins with one player picking up all of the pieces in any one of the holes on their side.";
				cell.textLabel.numberOfLines = 2;
				break;
			default:
				break;
		}

	}
    
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0) {
		return 90;
	} else {
		return 44;
	}
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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

