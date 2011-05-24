    //
//  MultiPlayerGame.m
//  Kalah-iPad
//
//  Created by Dominic Wroblewski on 25/05/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import "MultiPlayerGame.h"


@implementation MultiPlayerGame


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	self.title = @"Kalah - Multi Player";
	
	nextTurnButton.hidden = YES;
	
	startingStones = [[[NSUserDefaults standardUserDefaults] objectForKey:@"startingStones"] intValue];
	selectedPit = 0;
	playing = false;
	
	p1A = [[[NSMutableArray alloc] initWithCapacity:6] retain];
	p2A = [[[NSMutableArray alloc] initWithCapacity:6] retain];
	
	for(int i=0; i<6; i++){
		// Fill these pits in with the set number of starting stones
		[p1A insertObject:[NSNumber numberWithInt:startingStones] atIndex:i]; 
		[p1A insertObject:[NSNumber numberWithInt:startingStones] atIndex:i];
	}
	
	game = [[KalaGameState alloc] initWithStartingStones:startingStones];
	
	[a1 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateNormal];
	[a1 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateSelected];
	[a2 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateNormal];
	[a2 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateSelected];
	[a3 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateNormal];
	[a3 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateSelected];
	[a4 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateNormal];
	[a4 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateSelected];
	[a5 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateNormal];
	[a5 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateSelected];
	[a6 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateNormal];
	[a6 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateSelected];
	
	[b1 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateNormal];
	[b1 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateSelected];
	[b2 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateNormal];
	[b2 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateSelected];
	[b3 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateNormal];
	[b3 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateSelected];
	[b4 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateNormal];
	[b4 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateSelected];
	[b5 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateNormal];
	[b5 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateSelected];
	[b6 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateNormal];
	[b6 setTitle:[NSString stringWithFormat:@"%i", startingStones] forState:UIControlStateSelected];
}



-(IBAction)nextTurn:(id)sender {
	nextTurnButton.hidden = YES;
	
	if ([game getTurn] == 0) {
		
		[b1 setEnabled:FALSE];
		[b2 setEnabled:FALSE];
		[b3 setEnabled:FALSE];
		[b4 setEnabled:FALSE];
		[b5 setEnabled:FALSE];
		[b6 setEnabled:FALSE];
		
	}else {
		
		[a1 setEnabled:FALSE];
		[a2 setEnabled:FALSE];
		[a3 setEnabled:FALSE];
		[a4 setEnabled:FALSE];
		[a5 setEnabled:FALSE];
		[a6 setEnabled:FALSE];
		
	}

	
}


-(void)updatePitsA:(NSMutableArray *)a pitsB:(NSMutableArray *)b {
	
	NSString *s1 = @"";
	NSString *s2 = @"";
	
	//	NSLog(@"NSMutableArray KalahPitA = %@", a);
	//	NSLog(@"NSMutableArray KalahPitB = %@", b);
	
	for (int i=0; i<6; i++) {
		
		
		s1 = [NSString stringWithFormat:@"%i", [[a objectAtIndex:i] intValue]];
		s2 = [NSString stringWithFormat:@"%i", [[b objectAtIndex:i] intValue]];
		
		[a1 setTitle:[NSString stringWithFormat:@"%i", [[a objectAtIndex:0] intValue]] forState:UIControlStateNormal];
		[a1 setTitle:[NSString stringWithFormat:@"%i", [[a objectAtIndex:0] intValue]] forState:UIControlStateSelected];
		[a2 setTitle:[NSString stringWithFormat:@"%i", [[a objectAtIndex:1] intValue]] forState:UIControlStateNormal];
		[a2 setTitle:[NSString stringWithFormat:@"%i", [[a objectAtIndex:1] intValue]] forState:UIControlStateSelected];
		[a3 setTitle:[NSString stringWithFormat:@"%i", [[a objectAtIndex:2] intValue]] forState:UIControlStateNormal];
		[a3 setTitle:[NSString stringWithFormat:@"%i", [[a objectAtIndex:2] intValue]] forState:UIControlStateSelected];
		[a4 setTitle:[NSString stringWithFormat:@"%i", [[a objectAtIndex:3] intValue]] forState:UIControlStateNormal];
		[a4 setTitle:[NSString stringWithFormat:@"%i", [[a objectAtIndex:3] intValue]] forState:UIControlStateSelected];
		[a5 setTitle:[NSString stringWithFormat:@"%i", [[a objectAtIndex:4] intValue]] forState:UIControlStateNormal];
		[a5 setTitle:[NSString stringWithFormat:@"%i", [[a objectAtIndex:4] intValue]] forState:UIControlStateSelected];
		[a6 setTitle:[NSString stringWithFormat:@"%i", [[a objectAtIndex:5] intValue]] forState:UIControlStateNormal];
		[a6 setTitle:[NSString stringWithFormat:@"%i", [[a objectAtIndex:5] intValue]] forState:UIControlStateSelected];
		
		[b1 setTitle:[NSString stringWithFormat:@"%i", [[b objectAtIndex:0] intValue]] forState:UIControlStateNormal];
		[b1 setTitle:[NSString stringWithFormat:@"%i", [[b objectAtIndex:0] intValue]] forState:UIControlStateSelected];
		[b2 setTitle:[NSString stringWithFormat:@"%i", [[b objectAtIndex:1] intValue]] forState:UIControlStateNormal];
		[b2 setTitle:[NSString stringWithFormat:@"%i", [[b objectAtIndex:1] intValue]] forState:UIControlStateSelected];
		[b3 setTitle:[NSString stringWithFormat:@"%i", [[b objectAtIndex:2] intValue]] forState:UIControlStateNormal];
		[b3 setTitle:[NSString stringWithFormat:@"%i", [[b objectAtIndex:2] intValue]] forState:UIControlStateSelected];
		[b4 setTitle:[NSString stringWithFormat:@"%i", [[b objectAtIndex:3] intValue]] forState:UIControlStateNormal];
		[b4 setTitle:[NSString stringWithFormat:@"%i", [[b objectAtIndex:3] intValue]] forState:UIControlStateSelected];
		[b5 setTitle:[NSString stringWithFormat:@"%i", [[b objectAtIndex:4] intValue]] forState:UIControlStateNormal];
		[b5 setTitle:[NSString stringWithFormat:@"%i", [[b objectAtIndex:4] intValue]] forState:UIControlStateSelected];
		[b6 setTitle:[NSString stringWithFormat:@"%i", [[b objectAtIndex:5] intValue]] forState:UIControlStateNormal];
		[b6 setTitle:[NSString stringWithFormat:@"%i", [[b objectAtIndex:5] intValue]] forState:UIControlStateSelected];
		
		
		if([[a objectAtIndex:i] intValue] == 0){
			
			switch (i) {
				case 0:
					[a1 setEnabled:NO];
					break;
				case 1:
					[a2 setEnabled:NO];
					break;
				case 2:
					[a3 setEnabled:NO];
					break;
				case 3:
					[a4 setEnabled:NO];
					break;
				case 4:
					[a5 setEnabled:NO];
					break;
				case 5:
					[a6 setEnabled:NO];
					break;
				default:
					break;
			}
		}else {
			switch (i) {
				case 0:
					[a1 setEnabled:YES];
					break;
				case 1:
					[a2 setEnabled:YES];
					break;
				case 2:
					[a3 setEnabled:YES];
					break;
				case 3:
					[a4 setEnabled:YES];
					break;
				case 4:
					[a5 setEnabled:YES];
					break;
				case 5:
					[a6 setEnabled:YES];
					break;
				default:
					break;
			}
		}
		
		
	}
	
	
	
}



-(void)updateKalaA:(int)a KalaB:(int)b {
	
	NSString *k1 = [NSString stringWithFormat:@"%i", a];
	NSString *k2 = [NSString stringWithFormat:@"%i", b];
	
	[p1 setText:k1];
	[p2 setText:k2];
	
}





-(IBAction)pressA1:(id)sender {
	[game makeMove:1];
	//	NSLog(@"made move 1");
	[self finishMove];
}

-(IBAction)pressA2:(id)sender {
	[game makeMove:2];
	//	NSLog(@"made move 2");
	[self finishMove];
}

-(IBAction)pressA3:(id)sender {
	[game makeMove:3];
	//	NSLog(@"made move 3");
	[self finishMove];
}

-(IBAction)pressA4:(id)sender {
	[game makeMove:4];
	//	NSLog(@"made move 4");
	[self finishMove];
}

-(IBAction)pressA5:(id)sender {
	[game makeMove:5];
	//	NSLog(@"made move 5");
	[self finishMove];
}

-(IBAction)pressA6:(id)sender {
	[game makeMove:6];
	//	NSLog(@"made move 6");
	[self finishMove];
}



-(IBAction)pressB1:(id)sender {
	[game makeMove:1];
	//	NSLog(@"made move 1");
	[self finishMove];
}

-(IBAction)pressB2:(id)sender {
	[game makeMove:2];
	//	NSLog(@"made move 2");
	[self finishMove];
}

-(IBAction)pressB3:(id)sender {
	[game makeMove:3];
	//	NSLog(@"made move 3");
	[self finishMove];
}

-(IBAction)pressB4:(id)sender {
	[game makeMove:4];
	//	NSLog(@"made move 4");
	[self finishMove];
}

-(IBAction)pressB5:(id)sender {
	[game makeMove:5];
	//	NSLog(@"made move 5");
	[self finishMove];
}

-(IBAction)pressB6:(id)sender {
	[game makeMove:6];
	//	NSLog(@"made move 6");
	[self finishMove];
}


-(void)outputScore {
	
	// Disable the players buttons
	
	[a1 setEnabled:FALSE];
	[a2 setEnabled:FALSE];
	[a3 setEnabled:FALSE];
	[a4 setEnabled:FALSE];
	[a5 setEnabled:FALSE];
	[a6 setEnabled:FALSE];
	
	[b1 setEnabled:FALSE];
	[b2 setEnabled:FALSE];
	[b3 setEnabled:FALSE];
	[b4 setEnabled:FALSE];
	[b5 setEnabled:FALSE];
	[b6 setEnabled:FALSE];
	
	
	[nextTurnButton removeFromSuperview];
	
	NSLog(@"Final score = Player 1 = %i - %i Player 2", [game getScore:0], [game getScore:1]);
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:[NSString stringWithFormat:@"Player 1 = %i points\n Player 2 = %i points", [game getScore:0], [game getScore:1]] delegate:self cancelButtonTitle:nil otherButtonTitles:@"Okay", nil];
	//[alert setNumberOfRows:5];
	[alert show];
	
	// Output who won the game or if it was a tie
	
	if([game getScore:0] > [game getScore:1]){
		NSLog(@"Player 1 wins!");
	}else if([game getScore:1] > [game getScore:0]){
		NSLog(@"Player 2 wins!");
	}else{
		NSLog(@"The game was a tie.");
	}
	
	
}




-(void) finishMove {
	
	NSMutableArray *t = [[NSMutableArray alloc] initWithCapacity:6];
	NSMutableArray *u = [[NSMutableArray alloc] initWithCapacity:6];
	
	for(int i=0; i<6; i++){
		
		int b = i + 1;
		
		[t insertObject:[NSNumber numberWithInt:[game getNumStones:b player:0]] atIndex:i];
		[u insertObject:[NSNumber numberWithInt:[game getNumStones:b player:1]] atIndex:i];
		
	}
	
	[self updatePitsA:t pitsB:u];
	
	[self updateKalaA:[game getKala:0] KalaB:[game getKala:1]];
	
	if ([game getTurn] == 0) {
		
		//
		[a1 setEnabled:TRUE];
		[a2 setEnabled:TRUE];
		[a3 setEnabled:TRUE];
		[a4 setEnabled:TRUE];
		[a5 setEnabled:TRUE];
		[a6 setEnabled:TRUE];
		//
		
		[b1 setEnabled:FALSE];
		[b2 setEnabled:FALSE];
		[b3 setEnabled:FALSE];
		[b4 setEnabled:FALSE];
		[b5 setEnabled:FALSE];
		[b6 setEnabled:FALSE];
		
		if ([game gameOver]) {
			[self outputScore];
		}
		
		nextTurnButton.hidden = NO;
		
	}else {

		[a1 setEnabled:FALSE];
		[a2 setEnabled:FALSE];
		[a3 setEnabled:FALSE];
		[a4 setEnabled:FALSE];
		[a5 setEnabled:FALSE];
		[a6 setEnabled:FALSE];
		
		[b1 setEnabled:TRUE];
		[b2 setEnabled:TRUE];
		[b3 setEnabled:TRUE];
		[b4 setEnabled:TRUE];
		[b5 setEnabled:TRUE];
		[b6 setEnabled:TRUE];
		
		if ([game gameOver]) {
			[self outputScore];
		}
		
		nextTurnButton.hidden = NO;
		
	}
	
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
