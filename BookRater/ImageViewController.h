//
//  ViewController.h
//  BookRater
//
//  Created by James Cryer on 17/03/2013.
//  Copyright (c) 2013 James Cryer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookCover.h"

@interface ImageViewController : UIViewController

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) BookCover *model;

@end
