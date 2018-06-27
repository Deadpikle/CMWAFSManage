//
//  AddRoomViewController.m
//  CMWAFSManager
//
//  Created by School of Computing Macbook on 6/24/18.
//  Copyright © 2018 Pikle Productions. All rights reserved.
//

#import "AddRoomViewController.h"
#import "Room.h"
#import "Utilities.h"

@interface AddRoomViewController ()

@property (weak) IBOutlet NSComboBox *buildingComboBox;
@property (weak) IBOutlet NSTextField *maxPeopleTextField;
@property (weak) IBOutlet NSTextField *roomNumberTextField;
@property (weak) IBOutlet NSTextField *colorTextField;

- (IBAction)saveNewRoom:(NSButton *)sender;

@end

@implementation AddRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)saveNewRoom:(NSButton *)sender {
    // TODO: if max number of people < 0, error!
    // TODO: if room number < 0, error!
    // Create room object
    Room *room = [[Room alloc] init];
    room.buildingName = self.buildingComboBox.stringValue;
    room.maxNumberOfPeople = [self.maxPeopleTextField.stringValue integerValue];
    room.number = [self.roomNumberTextField.stringValue integerValue];
    room.color = [Utilities colorWithHexColorString:self.colorTextField.stringValue];
    // Save!
    [room insertIntoDatabase];
    // Tell user if it succeeded or kick them back to list of rooms or something like that
    // TODO: show error if failed :(
    [self dismissController:self];
}

@end
