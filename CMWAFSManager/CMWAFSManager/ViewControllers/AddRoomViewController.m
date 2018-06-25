//
//  AddRoomViewController.m
//  CMWAFSManager
//
//  Created by School of Computing Macbook on 6/24/18.
//  Copyright © 2018 Pikle Productions. All rights reserved.
//

#import "AddRoomViewController.h"

@interface AddRoomViewController ()

@property (weak) IBOutlet NSTextField *buildingNameTextField;
- (IBAction)saveNewRoom:(NSButton *)sender;

@end

@implementation AddRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)saveNewRoom:(NSButton *)sender {
    NSLog(@"User wants to save the new room!");
    NSLog(@"User building name is: %@", self.buildingNameTextField.stringValue);
    // Create room object
    // Save!
    // Tell user if it succeeded or kick them back to list of rooms or something like that
    //[self dismissController:self];
}

@end
