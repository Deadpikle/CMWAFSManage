//
//  Constants.m
//  CMWAFSManager
//
//  Created by School of Computing Macbook on 6/24/18.
//  Copyright © 2018 Pikle Productions. All rights reserved.
//

#import "Constants.h"

@implementation Constants

+(NSString*)dataDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *applicationSupportDirectory = paths.firstObject;
    NSString *dataDir = [applicationSupportDirectory stringByAppendingPathComponent:@"CMWAFSManager"];
    if (![NSFileManager.defaultManager fileExistsAtPath:dataDir]) {
        [NSFileManager.defaultManager createDirectoryAtPath:dataDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return dataDir;
}

@end
