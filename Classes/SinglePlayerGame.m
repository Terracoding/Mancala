//
//  SinglePlayerGame.m
//  Kalah-iPad
//
//  Created by Dominic Wroblewski on 14/05/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import "SinglePlayerGame.h"


@implementation SinglePlayerGame


- (void)viewDidLoad
{
  [super viewDidLoad];
	
	self.title = @"Kalah - Single Player";
	
	nextTurnButton.hidden = YES;
	startingStones = [[[NSUserDefaults standardUserDefaults] objectForKey:@"startingStones"] intValue];
	selectedPit = 0;
	playing = false;
	
	p1A = [[[NSMutableArray alloc] initWithCapacity:6] retain];
	p2A = [[[NSMutableArray alloc] initWithCapacity:6] retain];
	
	for(int i=0; i<6; i++){
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
	
	play1 = [[RandomPlayer alloc] init];
	play2 = [[RandomPlayer alloc] init];
	
}

- (void)getStonesAndUpdate
{
  NSMutableArray *t = [[NSMutableArray alloc] initWithCapacity:6];
  NSMutableArray *u = [[NSMutableArray alloc] initWithCapacity:6];
  for (int i=0; i<6; i++) {
    int b = i + 1;
    [t insertObject:[NSNumber numberWithInt:[game getNumStones:b player:0]] atIndex:i];
    [u insertObject:[NSNumber numberWithInt:[game getNumStones:b player:1]] atIndex:i];
  }
  [self updatePitsA:t pitsB:u];
}

- (void)playComputer
{
	if (![game gameOver]) {
		
		while ([game getTurn] == 1) {
			[game makeMove:[play2 chooseMove:game]];
      
			[self getStonesAndUpdate];
      
			[a1 setEnabled:TRUE];
			[a2 setEnabled:TRUE];
			[a3 setEnabled:TRUE];
			[a4 setEnabled:TRUE];
			[a5 setEnabled:TRUE];
			[a6 setEnabled:TRUE];
			
			[self updateKalaA:[game getKala:0] KalaB:[game getKala:1]];
			
			if ([game gameOver]) {
				[self outputScore];
				break;
			}
			
		}
		
	} else {
		[self outputScore];
	}
	
	nextTurnButton.hidden = YES;
}


- (void)outputScore
{
	[a1 setEnabled:FALSE];
	[a2 setEnabled:FALSE];
	[a3 setEnabled:FALSE];
	[a4 setEnabled:FALSE];
	[a5 setEnabled:FALSE];
	[a6 setEnabled:FALSE];

	[nextTurnButton removeFromSuperview];

	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over" 
                                                  message:[NSString stringWithFormat:@"Final score = You %i - %i Computer", [game getScore:0], [game getScore:1]] 
                                                 delegate:self 
                                        cancelButtonTitle:nil 
                                        otherButtonTitles:@"Okay", nil];
	[alert show];
  [alert release];
}

- (void)updatePitsA:(NSMutableArray *)a pitsB:(NSMutableArray *)b
{
	for (int i=0; i<6; i++) {
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
		
		
		if ([[a objectAtIndex:i] intValue] == 0) {
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
		} else {
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

- (IBAction)pressA1:(id)sender
{
	[game makeMove:1];
	[self finishMove];
}

- (IBAction)pressA2:(id)sender
{
	[game makeMove:2];
	[self finishMove];
}

- (IBAction)pressA3:(id)sender
{
	[game makeMove:3];
	[self finishMove];
}

- (IBAction)pressA4:(id)sender
{
	[game makeMove:4];
	[self finishMove];
}

- (IBAction)pressA5:(id)sender
{
	[game makeMove:5];
	[self finishMove];
}

- (IBAction)pressA6:(id)sender
{
	[game makeMove:6];
	[self finishMove];
}

- (IBAction)nextTurn:(id)sender
{
	nextTurnButton.hidden = YES;
	[self playComputer];
}

- (void)finishMove
{
	
	NSMutableArray *t = [[NSMutableArray alloc] initWithCapacity:6];
	NSMutableArray *u = [[NSMutableArray alloc] initWithCapacity:6];
	
	for(int i=0; i<6; i++) {
		int b = i + 1;
		[t insertObject:[NSNumber numberWithInt:[game getNumStones:b player:0]] atIndex:i];
		[u insertObject:[NSNumber numberWithInt:[game getNumStones:b player:1]] atIndex:i];
	}

	[self updatePitsA:t pitsB:u];
	[self updateKalaA:[game getKala:0] KalaB:[game getKala:1]];
  
  if ([game gameOver]) {
    [self outputScore];
  }

	if ([game getTurn] != 0) {
		[a1 setEnabled:FALSE];
		[a2 setEnabled:FALSE];
		[a3 setEnabled:FALSE];
		[a4 setEnabled:FALSE];
		[a5 setEnabled:FALSE];
		[a6 setEnabled:FALSE];
		nextTurnButton.hidden = NO;
	}
}


- (void)updateKalaA:(int)a KalaB:(int)b
{
	NSString *k1 = [NSString stringWithFormat:@"%i", a];
	NSString *k2 = [NSString stringWithFormat:@"%i", b];
	
	[p1 setText:k1];
	[p2 setText:k2];
}


- (void)play
{
	if (!game.gameOver) {
		int move = 0;
		if (game.getTurn == 0) {
			move = [play1 chooseMove:game];
		} else {
			move = [play2 chooseMove:game];
		}
		[game makeMove:move];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return YES;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
  game = nil;
  [super viewDidUnload];
}

- (void)dealloc
{
  [game release];
  [super dealloc];
}

@end
