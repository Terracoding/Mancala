//
//  KalaGameState.m
//  Kalah
//
//  Created by Dominic Wroblewski on 05/05/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import "KalaGameState.h"

@interface KalaGameState()

- (void)initPits;
- (int)getScoreForKalaPit:(int)kalaPit pits:(NSMutableArray *)pits;
- (void)pit:(NSMutableArray *)pits removeAddAtIndex:(int)index withNumber:(int)value;

@end

@implementation KalaGameState

- (KalaGameState *)initWithStartingStones:(int)startingStones
{
	startStones = startingStones;
	
	if (startingStones < 11 && startingStones > 0) {
		kalaPitA = 0;
		kalaPitB = 0;
		playerTurn = 0;
    [self initPits];
  }
  
  return self;
}

- (void)initPits
{
  pitsA = [[[NSMutableArray alloc] initWithCapacity:6] retain];
  pitsB = [[[NSMutableArray alloc] initWithCapacity:6] retain];
  for(int i=0; i<6; i++) {
    [pitsA insertObject:[NSNumber numberWithInt:startStones] atIndex:i]; 
    [pitsB insertObject:[NSNumber numberWithInt:startStones] atIndex:i];
  }
}

- (int)getTurn
{
	return playerTurn;
}

- (int)getKala:(int)playerNum
{
	if (playerNum == 0) {
		return kalaPitA;
	} else if(playerNum == 1) {
		return kalaPitB;
	} else {
		return -1;
	}
}

- (int)getNumStones:(int)sidePitNum
{
	if (sidePitNum > 0 && sidePitNum < 7) {
		if (playerTurn == 0) {
			return [[pitsA objectAtIndex:sidePitNum-1] intValue];
		} else {
			return [[pitsB objectAtIndex:sidePitNum-1] intValue];
		}
	} else {
		return -1;
	}
}

- (int)getNumStones:(int)sidePitNum player:(int)playerNum
{
	if (sidePitNum > 0 && sidePitNum < 7) {
		if (playerNum == 0) {
			return [[pitsA objectAtIndex:sidePitNum-1] intValue];
		} else if(playerNum == 1) {
			return [[pitsB objectAtIndex:sidePitNum-1] intValue];
		} else {
			return -1;
		}
	} else {
		return -1;
	}
}

- (int)getScoreForKalaPit:(int)kalaPit pits:(NSMutableArray *)pits
{
  int score = kalaPit;
  for (int i=0; i<6; i++) {
    score = score + [[pits objectAtIndex:i] intValue];
  }
  return score;
}

- (int)getScore:(int)playerNum
{
	if (playerNum == 0) {
		return [self getScoreForKalaPit:kalaPitA pits:pitsA];
	} else if (playerNum == 1) {
		return [self getScoreForKalaPit:kalaPitB pits:pitsB];
	} else {
		return -1;
	}
}

- (int)getSidePitArrayIndex:(int)sidePitNum
{
	return -1;
}

- (BOOL)gameOver
{
	int totalA = 0;
	int totalB = 0;
	
	for (int i=0; i<6; i++) {
		totalA = totalA + [[pitsA objectAtIndex:i] intValue];
		totalB = totalB + [[pitsB objectAtIndex:i] intValue];
	}
	
	if (totalA == 0 || totalB == 0) {
		return true;
	} else {
		return false;
	}
}

- (void)pit:(NSMutableArray *)pits removeAddAtIndex:(int)index withNumber:(int)value
{
  [pits removeObjectAtIndex:index];
  [pits insertObject:[NSNumber numberWithInt:value] atIndex:index];
}

- (void)makeAvailableMove:(int)available indexVal:(int)indexVal
{
  if (available != 0) {
			BOOL anotherGo = false;
			BOOL captureA = false;
			BOOL captureB = false;
			
			if (playerTurn == 0) {
    			
				BOOL running = true;
        [self pit:pitsA removeAddAtIndex:indexVal withNumber:0];

				indexVal++;
				
				while (running) {
					
					while (indexVal <= 5 && available > 0) {
						int val = [[pitsA objectAtIndex:indexVal] intValue] + 1;
            [self pit:pitsA removeAddAtIndex:indexVal withNumber:val];
						
						anotherGo = false;

						if (available == 1 && [[pitsA objectAtIndex:indexVal] intValue] == 1) {
							int indexB = 5 - indexVal;
							int bAdd = [[pitsB objectAtIndex:indexB] intValue];
							
							if (bAdd == 0) {
								captureB = true; 							
							}else{
								captureA = true;    							
							}
							
							kalaPitA = kalaPitA + bAdd + 1;
              [self pit:pitsB removeAddAtIndex:indexB withNumber:0];
              [self pit:pitsA removeAddAtIndex:indexVal withNumber:0];
							anotherGo = false;
							running = false;
						}
						
						available--;
						indexVal++;
					}
					
					if (available > 0) {
						kalaPitA = kalaPitA + 1;
						available--;
						indexVal++;
					} else {
						running = false;
					}
					
					// Checking for putting in kala pit
					if (available == 0 && indexVal == 7) {
						running = false;
						anotherGo = true;
					}
					
					indexVal = 0;
					
					while (indexVal <= 5 && available > 0) {
            [self pit:pitsB removeAddAtIndex:indexVal withNumber:([[pitsB objectAtIndex:indexVal] intValue] + 1)];
						
						indexVal++;
						available--;
					}
					
					if (available > 0) {
						kalaPitB = kalaPitB + 1;
						available--;
					}else{
						running = false;
					}
					
					if (available == 0) {
						running = false;
					}else{
						running = true;
					}
					
					indexVal = 0;
					
				}
				
			} else {
				
				BOOL running = true;
      
        [self pit:pitsB removeAddAtIndex:indexVal withNumber:0];
	
				indexVal++;
				
				while (running) {
    				
					while (indexVal <= 5 && available > 0) {
            [self pit:pitsB removeAddAtIndex:indexVal withNumber:([[pitsB objectAtIndex:indexVal] intValue] + 1)];
						
						if(available == 1 && [[pitsB objectAtIndex:indexVal] intValue] == 1){
							int indexA = 5 - indexVal;
							int bAdd = [[pitsA objectAtIndex:indexA] intValue];
							
							if(bAdd == 0){
								captureB = true; 							
							}else{
								captureA = true;    							
							}
							
							kalaPitB = kalaPitB + bAdd + 1;
							
              [self pit:pitsB removeAddAtIndex:indexVal withNumber:0];
              [self pit:pitsA removeAddAtIndex:indexA withNumber:0];
							
							anotherGo = false;
							running = false;
						}
						
						available--;
						indexVal++;
						
					}
					
					if (available > 0) {
						kalaPitB = kalaPitB + 1;
						available--;
						indexVal++;
					} else {
						running = false;
					}
					
					if (available == 0 && indexVal == 7) {
						running = false;
						anotherGo = true;
					}
    				
					indexVal = 0;
					
					while (indexVal <= 5 && available > 0) {
						[self pit:pitsA removeAddAtIndex:indexVal withNumber:([[pitsA objectAtIndex:indexVal] intValue] + 1)];
						
						indexVal++;
						available--;
					}
					
					if (available > 0) {
						kalaPitA = kalaPitA + 1;
						available--;
					}
    				
					indexVal = 0;
    				
					if (available == 0) {
						running = false;
					}
				}
			}
			
			if (captureA) {
				if (playerTurn == 0) {
					playerTurn = 1;
				} else {
					playerTurn = 0;
				}
				
			} else if (captureB) {
				if (playerTurn == 0) {
					playerTurn = 1;
				} else {
					playerTurn = 0;
				}
    			
			} else if (anotherGo) {
				if (playerTurn == 0) {
					playerTurn = 0;
				} else {
					playerTurn = 1;
				}
			} else {
				if (playerTurn == 0) {
					playerTurn = 1;
				} else {
					playerTurn = 0;
				}
			}

		}
}

- (void)makeMove:(int)sidePitNum
{
  if (sidePitNum > 1 || sidePitNum < 6) {
		int available = [self getNumStones:sidePitNum];
		int indexVal = sidePitNum-1;
		[self makeAvailableMove:available indexVal:indexVal];
	}
}

@end
