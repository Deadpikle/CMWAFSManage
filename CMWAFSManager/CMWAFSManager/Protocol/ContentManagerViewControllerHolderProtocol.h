//
//  ContentManagerViewControllerHolderProtocol.h
//  CMWAFSManager
//
//  Created by School of Computing Macbook on 6/24/18.
//  Copyright © 2018 Pikle Productions. All rights reserved.
//

#ifndef ContentManagerViewControllerHolderProtocol_h
#define ContentManagerViewControllerHolderProtocol_h

@class ContentManagerViewController;

@protocol ContentManagerViewControllerHolder <NSObject>

-(ContentManagerViewController*)retreiveContentManagerController;

@end

#endif /* ContentManagerViewControllerHolderProtocol_h */
