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
        if ([inColorString hasPrefix:@"#"]) {
            inColorString = [inColorString stringByReplacingOccurrencesOfString:@"#" withString:@""];
        }
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

// https://developer.apple.com/library/archive/qa/qa1576/_index.html
+ (NSString*)convertColorToString:(NSColor*)color {
    // Convert the NSColor to the RGB color space before we can access its components
    NSColor *convertedColor = [color colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
    if (convertedColor) {
        CGFloat redFloatValue, greenFloatValue, blueFloatValue;
        // Get the red, green, and blue components of the color
        [convertedColor getRed:&redFloatValue green:&greenFloatValue blue:&blueFloatValue alpha:NULL];
        
        // Convert the components to numbers (unsigned decimal integer) between 0 and 255
        int redIntValue = redFloatValue * 255.99999f;
        int greenIntValue = greenFloatValue * 255.99999f;
        int blueIntValue = blueFloatValue * 255.99999f;
        
        // Convert the numbers to hex strings
        NSString *redHexValue = [NSString stringWithFormat:@"%02x", redIntValue];
        NSString *greenHexValue = [NSString stringWithFormat:@"%02x", greenIntValue];
        NSString *blueHexValue = [NSString stringWithFormat:@"%02x", blueIntValue];
        
        // Concatenate the red, green, and blue components' hex strings together with a "#"
        return [NSString stringWithFormat:@"#%@%@%@", redHexValue, greenHexValue, blueHexValue];
    }
    return nil;
}

@end
