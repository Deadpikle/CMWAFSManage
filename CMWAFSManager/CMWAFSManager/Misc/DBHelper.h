//
//  DBHelper.h
//  CMWAFSManager
//
//  Created by School of Computing Macbook on 6/24/18.
//  Copyright © 2018 Pikle Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

@interface DBHelper : NSObject

+(FMDatabase*)openDatabase;

@end
