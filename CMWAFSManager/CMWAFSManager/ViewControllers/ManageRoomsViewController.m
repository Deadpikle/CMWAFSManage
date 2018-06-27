//
//  ManageRoomsViewController.m
//  CMWAFSManager
//
//  Created by School of Computing Macbook on 6/26/18.
//  Copyright © 2018 Pikle Productions. All rights reserved.
//

#import "ManageRoomsViewController.h"
#import "Room.h"

@interface ManageRoomsViewController ()

@end

@implementation ManageRoomsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    NSArray<Room*> *rooms = [Room loadAllRooms];
    NSLog(@"How many rooms did we load?? %ld", rooms.count);
}

@end
