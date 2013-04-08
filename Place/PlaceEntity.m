//
//  PlaceEntity.m
//  Place
//
//  Created by Iurii Oliiar on 3/29/13.
//  Copyright (c) 2013 Iurii Oliiar. All rights reserved.
//

#import "PlaceEntity.h"

@implementation PlaceEntity

@synthesize name;
@synthesize comment;
@synthesize dateVisited;
@synthesize photo;
@synthesize Id;
@synthesize category;
@synthesize latitude;
@synthesize longtitude;

- (void)dealloc {
    longtitude = 0.0;
    latitude = 0.0;
    category = 0;
    [photo release];
    [dateVisited release];
    [comment release];
    [name release];
    [super dealloc];
}

@end
