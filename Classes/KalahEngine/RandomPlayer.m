//
//  RandomPlayer.m
//  Kalah
//
//  Created by Dominic Wroblewski on 06/05/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import "RandomPlayer.h"

@implementation RandomPlayer

- (int)chooseMove:(KalaGameState *)gs
{
	
	if (gs.gameOver) {
		return -1;
	} else {
		int			value;
		BOOL		running = true;
		
		while (running) {
			value = (arc4random() % 6) + 1;
			if ([gs getNumStones:value] > 0) {
				running = false;
			} else {
				running = true;
			}
		}
		return value;
	}
}

@end
