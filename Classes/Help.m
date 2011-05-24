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


- (void)viewDidLoad {
    [super viewDidLoad];

}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger) section
{
	if (section == 0) {
		return @"About";
	}else if (section == 1) {
		return @"How To Play";
	}else {
		return nil;
	}
	
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	
	if (section == 0) {
		return 1;
	}else {
		return 4;
	}

}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
	}else {
		
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


//Each player has a 'store' to the right side of the Mancala board. Cereal bowls work well. for this purpose.
//The game begins with one player picking up all of the pieces in any one of the holes on his side.
//Moving counter-clockwise, the player deposits one of the stones in each hole until the stones run out.
//If you run into your own store, deposit one piece in it. If you run into your opponent's store, skip it.
//If the last piece you drop is in your own store, you get a free turn.
//If the last piece you drop is in an empty hole on your side, you capture that piece and any pieces in the hole directly opposite.
//Always place all captured pieces in your store.
//The game ends when all six spaces on one side of the Mancala board are empty.
//The player who still has pieces on his side of the board when the game ends captures all of those pieces.
//Count all the pieces in each store. The winner is the player with the most pieces.

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.section == 0) {
		return 90;
	}else {
		return 44;
	}

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

