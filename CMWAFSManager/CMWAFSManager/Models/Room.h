//
//  Room.h
//  CMWAFSManager
//
//  Created by School of Computing Macbook on 6/24/18.
//  Copyright © 2018 Pikle Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface Room : NSObject

@property NSUInteger roomID;
@property NSString *buildingName;
@property NSUInteger number;
@property NSUInteger maxNumberOfPeople;

@property NSColor *color;

-(void)insertIntoDatabase;

+(NSArray<Room*>*)loadAllRooms;

@end
