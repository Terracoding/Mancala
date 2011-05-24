//
//  SinglePlayerGame.h
//  Kalah-iPad
//
//  Created by Dominic Wroblewski on 14/05/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KalaGameState.h"
#import "RandomPlayer.h"

@interface SinglePlayerGame : UIViewController {
	
	KalaGameState				*game;
	RandomPlayer				*play1;
	RandomPlayer				*play2;
	
	IBOutlet UIButton			*a1, *a2, *a3, *a4, *a5, *a6;
	IBOutlet UIButton			*b1, *b2, *b3, *b4, *b5, *b6;
	IBOutlet UIButton			*nextTurnButton;
	IBOutlet UILabel			*p1;
	IBOutlet UILabel			*p2;
	
	int							startingStones;
	int							selectedPit;	
	BOOL						playing;
	
	NSMutableArray				*p1A;
	NSMutableArray				*p2A;
	
}

- (void)play DEPRECATED_ATTRIBUTE;
- (void)playComputer;
- (void)finishMove;
- (void)outputScore;
	
	
-(void)updateKalaA:(int)a KalaB:(int)b;

-(void)updatePitsA:(NSMutableArray *)a pitsB:(NSMutableArray *)b;


-(IBAction)pressA1:(id)sender;
-(IBAction)pressA2:(id)sender;
-(IBAction)pressA3:(id)sender;
-(IBAction)pressA4:(id)sender;
-(IBAction)pressA5:(id)sender;
-(IBAction)pressA6:(id)sender;

-(IBAction)nextTurn:(id)sender;


@end
