//
//  Room.m
//  CMWAFSManager
//
//  Created by School of Computing Macbook on 6/24/18.
//  Copyright © 2018 Pikle Productions. All rights reserved.
//

#import "Room.h"
#import "DBHelper.h"

@implementation Room

-(void)insertIntoDatabase {
    // TODO:
    // create INSERT INTO Rooms (...) string
    // grab database
    // insert into database
    // return YES/NO for success/failure
}

+(NSArray<Room*>*)loadAllRooms {
    // TODO:
    // SELECT * FROM Rooms
    
    // while (...not done...)
    //    create Room object
    //    add to rooms array
    return nil;
}

+(NSArray<NSString*>*)loadAllBuildingNames {
    NSMutableArray *data = [NSMutableArray array];
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
