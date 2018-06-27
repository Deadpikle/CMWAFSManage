//
//  Utilities.m
//  CMWAFSManager
//
//  Created by School of Computing Macbook on 6/24/18.
//  Copyright © 2018 Pikle Productions. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

// https://stackoverflow.com/a/8697241/3938401
+ (NSColor*)colorWithHexColorString:(NSString*)inColorString {
    unsigned colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (inColorString) {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char)(colorCode >> 16);
    greenByte = (unsigned char)(colorCode >> 8);
    blueByte = (unsigned char)(colorCode); // masks off high bits
    
    return [NSColor
              colorWithCalibratedRed:(CGFloat)redByte / 0xff
              green:(CGFloat)greenByte / 0xff
              blue:(CGFloat)blueByte / 0xff
              alpha:1.0];
}

@end
