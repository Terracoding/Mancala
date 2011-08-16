//
//  DWNavigationBar.m
//  Name Shaker
//
//  Created by Dominic Wroblewski on 26/07/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DWNavigationBar.h"

@implementation DWNavigationBar

- (void) drawRect:(CGRect)rect
{
  UIImage *image = [[UIImage imageNamed:@"NavBar-iPhone.png"] retain];
  [image drawInRect:rect];
  [image release];
}

@end
