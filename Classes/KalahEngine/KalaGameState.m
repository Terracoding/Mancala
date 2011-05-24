//
//  KalaGameState.m
//  Kalah
//
//  Created by Dominic Wroblewski on 05/05/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import "KalaGameState.h"



@implementation KalaGameState



- (KalaGameState *)initWithStartingStones:(int)startingStones {

	startStones = startingStones;
	
	if(startingStones < 11 && startingStones > 0){

		kalaPitA = 0;
		kalaPitB = 0;
		playerTurn = 0;
		
		pitsA = [[[NSMutableArray alloc] initWithCapacity:6] retain];
		pitsB = [[[NSMutableArray alloc] initWithCapacity:6] retain];
		
		for(int i=0; i<6; i++){
			[pitsA insertObject:[NSNumber numberWithInt:startStones] atIndex:i]; 
			[pitsB insertObject:[NSNumber numberWithInt:startStones] atIndex:i];
		}
  }
  return self;
}


- (int)	getTurn {
	return playerTurn;
}


- (int)	getKala:(int)playerNum {
	
	if(playerNum == 0){
		
		return kalaPitA;
        
	}else if(playerNum == 1){
		
		return kalaPitB;
       	
	}else {
		return -1;
	}

}

- (int) getNumStones:(int)sidePitNum {
	
	if(sidePitNum > 0 && sidePitNum < 7){

		if(playerTurn == 0){
			return [[pitsA objectAtIndex:sidePitNum-1] intValue];
		}else{
			return [[pitsB objectAtIndex:sidePitNum-1] intValue];
		}
		
	}else{
		return -1;
	}
}


- (int) getNumStones:(int)sidePitNum player:(int)playerNum {
	
	if(sidePitNum > 0 && sidePitNum < 7){
    	
		if(playerNum == 0){
			
			return [[pitsA objectAtIndex:sidePitNum-1] intValue];
			
		}else if(playerNum == 1){
			return [[pitsB objectAtIndex:sidePitNum-1] intValue];
		}else{
			return -1;
		}
    	
	}else{
		return -1;
	}
	
}

- (int)	getScore:(int)playerNum {
	
	int score = 0;
	
	
	if(playerNum == 0){
        
		score = kalaPitA;
		
		for(int i=0; i<6; i++){
			score = score + [[pitsA objectAtIndex:i] intValue];
		}
		
		return score;
	}else if(playerNum == 1){
        
		score = kalaPitB;
        
		for(int i=0; i<6; i++){
			score = score + [[pitsB objectAtIndex:i] intValue];
		}
        
		return score;
	}else{
		// throw new IllegalPlayerNumException(playerNum);
		return -1;
	}
	
}

- (int) getSidePitArrayIndex:(int)sidePitNum {
	return -1;
}

- (BOOL) gameOver {
	int totalA = 0;
	int totalB = 0;
	
	for(int i=0; i<6; i++){
		totalA = totalA + [[pitsA objectAtIndex:i] intValue];
		totalB = totalB + [[pitsB objectAtIndex:i] intValue];
	}
	
	if(totalA == 0 || totalB == 0){
		return true;
	}else{
		return false;
	}
}


- (void) makeMove:(int)sidePitNum {
	
	if(sidePitNum < 1 || sidePitNum > 6){
	}else{
		
		int available = [self getNumStones:sidePitNum];
		int indexVal = sidePitNum-1;
		
		if(available == 0){

		}else{
			
			BOOL anotherGo = false;
			BOOL captureA = false;
			BOOL captureB = false;
			
			if(playerTurn == 0){
    			
				BOOL running = true;
				
				[pitsA removeObjectAtIndex:indexVal];
				[pitsA insertObject:[NSNumber numberWithInt:0] atIndex:indexVal];

				indexVal++;
				
				while (running) {
					
					while(indexVal <= 5 && available > 0){
						int val = [[pitsA objectAtIndex:indexVal] intValue] + 1;
						[pitsA removeObjectAtIndex:indexVal];
						[pitsA insertObject:[NSNumber numberWithInt:val] atIndex:indexVal];
						
						anotherGo = false;
						
						// Check if a capture has occurred
						if(available == 1 && [[pitsA objectAtIndex:indexVal] intValue] == 1){
							int indexB = 5 - indexVal;
							int bAdd = [[pitsB objectAtIndex:indexB] intValue];
							
							if(bAdd == 0){
								captureB = true; 							
							}else{
								captureA = true;    							
							}
							
							kalaPitA = kalaPitA + bAdd + 1;
							
							[pitsB removeObjectAtIndex:indexB];
							[pitsB insertObject:[NSNumber numberWithInt:0] atIndex:indexB];
							[pitsA removeObjectAtIndex:indexVal];
							[pitsA insertObject:[NSNumber numberWithInt:0] atIndex:indexVal];
							anotherGo = false;
							running = false;
						}
						
						available--;
						indexVal++;
						
					}
					
					if(available > 0){
						kalaPitA = kalaPitA + 1;
						available--;
						indexVal++;
					}else{
						running = false;
					}
					
					// Checking for putting in kala pit
					if(available == 0 && indexVal == 7){
						running = false;
						anotherGo = true;
					}
					
					indexVal = 0;
					
					while(indexVal <= 5 && available > 0){
						int val = [[pitsB objectAtIndex:indexVal] intValue] + 1;
						[pitsB removeObjectAtIndex:indexVal];
						[pitsB insertObject:[NSNumber numberWithInt:val] atIndex:indexVal];
						
						indexVal++;
						available--;
					}
					
					if(available > 0){
						kalaPitB = kalaPitB + 1;
						available--;
					}else{
						running = false;
					}
					
					if(available == 0){
						running = false;
					}else{
						running = true;
					}
					
					indexVal = 0;
					
				}
				
			}else {
				
				BOOL running = true;
				
				[pitsB removeObjectAtIndex:indexVal];
				[pitsB insertObject:[NSNumber numberWithInt:0] atIndex:indexVal];
	
				indexVal++;
				
				while (running){
    				
					while(indexVal <= 5 && available > 0){
						int val = [[pitsB objectAtIndex:indexVal] intValue] + 1;
						[pitsB removeObjectAtIndex:indexVal];
						[pitsB insertObject:[NSNumber numberWithInt:val] atIndex:indexVal];
						
						// Check if a capture has occurred
						if(available == 1 && [[pitsB objectAtIndex:indexVal] intValue] == 1){
							int indexA = 5 - indexVal;
							int bAdd = [[pitsA objectAtIndex:indexA] intValue];
							
							if(bAdd == 0){
								captureB = true; 							
							}else{
								captureA = true;    							
							}
							
							kalaPitB = kalaPitB + bAdd + 1;
							
							[pitsB removeObjectAtIndex:indexVal];
							[pitsB insertObject:[NSNumber numberWithInt:0] atIndex:indexVal];
							[pitsA removeObjectAtIndex:indexA];
							[pitsA insertObject:[NSNumber numberWithInt:0] atIndex:indexA];
							
							anotherGo = false;
							running = false;
						}
						
						available--;
						indexVal++;
						
					}
					
					if(available > 0){
						kalaPitB = kalaPitB + 1;
						available--;
						indexVal++;
					}else{
						running = false;
					}
					
					// Checking for putting in kala pit
					if(available == 0 && indexVal == 7){
						running = false;
						anotherGo = true;
					}
    				
					indexVal = 0;
					
					while(indexVal <= 5 && available > 0){
						int val = [[pitsA objectAtIndex:indexVal] intValue] + 1;
						[pitsA removeObjectAtIndex:indexVal];
						[pitsA insertObject:[NSNumber numberWithInt:val] atIndex:indexVal];
						
						
						indexVal++;
						available--;
					}
					
					if(available > 0){
						kalaPitA = kalaPitA + 1;
						available--;
					}
    				
					indexVal = 0;
    				
					if(available == 0){
						running = false;
					}
					
					
				}
				
			}
			
			if(captureA){
				//System.out.println("Move made: "+sidePitNum+" (capture)");
				
				if(playerTurn == 0){
					playerTurn = 1;
				}else{
					playerTurn = 0;
				}
				
			}else if(captureB){
				//System.out.println("Move made: "+sidePitNum+" (capture - but no stones in opposite pit)");
				
				if(playerTurn == 0){
					playerTurn = 1;
				}else{
					playerTurn = 0;
				}
    			
			}else if(anotherGo){
				//System.out.println("Move made: "+sidePitNum+" (another go)");
				
				if(playerTurn == 0){
					playerTurn = 0;
				}else{
					playerTurn = 1;
				}
			}else{
				//System.out.println("Move made: "+sidePitNum);
				
				if(playerTurn == 0){
					playerTurn = 1;
				}else{
					playerTurn = 0;
				}
			}

			
		}
		
	}
	
}

// Need to complete clone

@end
