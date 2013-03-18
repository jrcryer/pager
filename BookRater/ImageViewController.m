//
//  ViewController.m
//  BookRater
//
//  Created by James Cryer on 17/03/2013.
//  Copyright (c) 2013 James Cryer. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect insetFrame = CGRectMake(12, 12, self.view.frame.size.width - 12, self.view.frame.size.height - 12);
    _imageView = [[UIImageView alloc] initWithFrame:insetFrame];
    _imageView.backgroundColor = [UIColor clearColor];
    [_imageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [_imageView setImage:[UIImage imageNamed:_model.imageName]];
    [[self view] addSubview:_imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
