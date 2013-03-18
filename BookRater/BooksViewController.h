//
//  BooksViewController.h
//  BookRater
//
//  Created by James Cryer on 17/03/2013.
//  Copyright (c) 2013 James Cryer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BooksViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic) NSInteger vcIndex;
@property (nonatomic, strong) UILabel *imageLabel;

@end
