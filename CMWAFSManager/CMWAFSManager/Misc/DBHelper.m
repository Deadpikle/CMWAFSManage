//
//  DBHelper.m
//  CMWAFSManager
//
//  Created by School of Computing Macbook on 6/24/18.
//  Copyright © 2018 Pikle Productions. All rights reserved.
//

#import "DBHelper.h"
#import "Constants.h"

@implementation DBHelper

+(FMDatabase*)openDatabase {
    // Get the database directory
    NSString *dataDir = [Constants dataDirectory];
    NSString *dbLocation = [dataDir stringByAppendingPathComponent:@"data.sqlite"];
    FMDatabase *database = [FMDatabase databaseWithPath:dbLocation];
    if ([database open]) {
        // run migrations
        [DBHelper runMigrations:database];
        return database;
    }
    return nil;
}

+(void)runMigrations:(FMDatabase*)database {
    // TODO: check if database is nil and check if open
    // Check the database version
    NSUInteger version = database.userVersion; // PRAGMA user_version;
    version++; // check for next version
    switch (version) {
        case 1: {
            NSString *insertRoomsTable = @" \
                CREATE TABLE Rooms ( \
                    RoomID INTEGER PRIMARY KEY AUTOINCREMENT, \
                    BuildingName TEXT, \
                    Number INTEGER, \
                    MaxPeople INTEGER, \
                    Color TEXT)";
            [database executeUpdate:insertRoomsTable];
        }
    }
}

@end
