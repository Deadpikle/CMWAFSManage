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
        return database;
    }
    return nil;
}

@end
