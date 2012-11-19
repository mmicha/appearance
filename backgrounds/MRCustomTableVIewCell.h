//
//  MRCustomTableVIewCell.h
//  modelrelease
//
//  Created by Michael on 16.11.12.
//  Copyright (c) 2012 mikeapphouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRCustomTableVIewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *subjectPhotoView;
@property (strong, nonatomic) IBOutlet UILabel *subjectFullNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *subjectShotDateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *photoFilm;
@property (strong, nonatomic) IBOutlet UITextView *subjectDescription;
@end
