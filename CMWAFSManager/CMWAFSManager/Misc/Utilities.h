//
//  Utilities.h
//  CMWAFSManager
//
//  Created by School of Computing Macbook on 6/24/18.
//  Copyright © 2018 Pikle Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface Utilities : NSObject

+ (NSColor*)colorWithHexColorString:(NSString*)inColorString;
+ (NSString*)convertColorToString:(NSColor*)color;

@end
