//
//  DetailViewController.h
//  backgrounds
//
//  Created by Michael on 19.11.12.
//  Copyright (c) 2012 mikeapphouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
