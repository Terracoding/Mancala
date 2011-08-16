//
//  KalaGameState.h
//  Kalah
//
//  Created by Dominic Wroblewski on 05/05/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface KalaGameState : NSObject {
	
	int						playerTurn;
	int						kalaPitA;
	int						kalaPitB;
	int						startStones;
	
	NSMutableArray			*pitsA;
	NSMutableArray			*pitsB;

}

- (KalaGameState *)initWithStartingStones:(int)startingStones;

- (int)		getTurn;
- (int)		getKala:(int)playerNum;
- (int)		getNumStones:(int)sidePitNum;
- (int)		getNumStones:(int)sidePitNum player:(int)playerNum;
- (int)		getScore:(int)playerNum;
- (BOOL)	gameOver;
- (void)	makeMove:(int)sidePitNum;

// Deprecated
- (int)		getSidePitArrayIndex:(int)sidePitNum DEPRECATED_ATTRIBUTE;
	
@end
