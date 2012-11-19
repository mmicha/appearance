//
//  MasterViewController.h
//  backgrounds
//
//  Created by Michael on 19.11.12.
//  Copyright (c) 2012 mikeapphouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
