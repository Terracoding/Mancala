//
//  RandomPlayer.h
//  Kalah
//
//  Created by Dominic Wroblewski on 06/05/2010.
//  Copyright 2010 TerraCoding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KalaGameState.h"

@interface RandomPlayer : NSObject

- (int)chooseMove:(KalaGameState *)gs;

@end
