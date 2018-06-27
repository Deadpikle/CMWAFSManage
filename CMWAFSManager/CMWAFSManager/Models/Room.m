//
//  Room.m
//  CMWAFSManager
//
//  Created by School of Computing Macbook on 6/24/18.
//  Copyright © 2018 Pikle Productions. All rights reserved.
//

#import "Room.h"
#import "DBHelper.h"
#import "Utilities.h"

@implementation Room

-(void)insertIntoDatabase {
    // TODO:
    // create INSERT INTO Rooms (...) string
    FMDatabase *database = [DBHelper openDatabase];
    if (database) {
        NSString *insert = @" \
            INSERT INTO Rooms (BuildingName, Number, MaxPeople, Color) \
            VALUES (?, ?, ?, ?);";
        NSString *colorString = [Utilities convertColorToString:self.color];
        if (!colorString) {
            colorString = @"#FFFFFF";
        }
        NSError *error = nil;
        [database executeUpdate:insert
                         values:@[self.buildingName,
                                  [NSNumber numberWithUnsignedInteger:self.number],
                                  [NSNumber numberWithUnsignedInteger:self.maxNumberOfPeople],
                                  colorString]
                          error:&error];
        if (error) {
            NSLog(@"We failed to add a room!");
            // TODO:
        }
        // otherwise it's in the database. yay!
        NSLog(@"Successfully added a room!");
    }
    // TODO: return YES/NO for success/failure
}

+(NSArray<Room*>*)loadAllRooms {
    NSMutableArray<Room*> *data = [NSMutableArray array];
    FMDatabase *database = [DBHelper openDatabase];
    if (database) {
        NSString *query = @"\
            SELECT BuildingName, Number, MaxPeople, Color \
            FROM Rooms \
            ORDER BY BuildingName, Number";
        FMResultSet *results = [database executeQuery:query];
        while ([results next]) {
            Room *room = [[Room alloc] init];
            room.buildingName = [results stringForColumnIndex:0];
            room.number = [results intForColumnIndex:1];
            room.maxNumberOfPeople = [results intForColumnIndex:2];
            room.color = [Utilities colorWithHexColorString:[results stringForColumnIndex:3]];
            [data addObject:room];
        }
    }
    return data;
}

+(NSArray<NSString*>*)loadAllBuildingNames {
    NSMutableArray<NSString*> *data = [NSMutableArray array];
    FMDatabase *database = [DBHelper openDatabase];
    if (database) {
        NSString *query = @"SELECT DISTINCT BuildingName \
                            FROM Rooms \
                            ORDER BY BuildingName";
        FMResultSet *results = [database executeQuery:query];
        while ([results next]) {
            [data addObject:[results stringForColumnIndex:0]];
        }
    }
    return data;
}

@end
