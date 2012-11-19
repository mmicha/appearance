//
//  MRCustomTableVIewCell.m
//  modelrelease
//
//  Created by Michael on 16.11.12.
//  Copyright (c) 2012 mikeapphouse. All rights reserved.
//

#import "MRCustomTableVIewCell.h"

@interface MRCustomTableVIewCell () {
    
    
}

@end
@implementation MRCustomTableVIewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
    }
    
    return self;
}

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.photoFilm.alpha = 1.0;
    
    UIView *cover = [[UIView alloc] initWithFrame:self.bounds];
    cover.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.7];
    cover.tag = 10;
    cover.hidden = YES;
    [self addSubview:cover];
    [self bringSubviewToFront:cover];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated

{
    [super setSelected:selected animated:animated];

    if (selected) {
        self.photoFilm.alpha = 0.6;
        [self viewWithTag:10].hidden = NO;
    } else {
        self.photoFilm.alpha = 1.0;
        [self viewWithTag:10].hidden = YES;
    }
    
    
}

@end
