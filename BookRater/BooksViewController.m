//
//  BooksViewController.m
//  BookRater
//
//  Created by James Cryer on 17/03/2013.
//  Copyright (c) 2013 James Cryer. All rights reserved.
//

#import "BooksViewController.h"
#import "BookCover.h"
#import "ImageViewController.h"

@interface BooksViewController ()

- (void)customise;
- (void)loadBooks;
- (void)addPager;
- (void)addLabel;

@end

@implementation BooksViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customise];
    [self loadBooks];
    [self addPager];
    [self addLabel];
}

#pragma mark -
#pragma mark - UIPageViewControllerDelegate Method

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    ImageViewController *contentVc = (ImageViewController *)viewController;
    NSUInteger currentIndex = [_modelArray indexOfObject:[contentVc model]];
    _vcIndex = currentIndex;
    
    BookCover *model = [_modelArray objectAtIndex:_vcIndex];
    [_imageLabel setText:[NSString stringWithFormat:@"%@", model.imageName]];
    
    if (currentIndex == 0) {
        return nil;
    }
    ImageViewController *imageViewController = [[ImageViewController alloc] init];
    imageViewController.model = [_modelArray objectAtIndex:currentIndex - 1];
    return imageViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    ImageViewController *contentVc = (ImageViewController *)viewController;
    NSUInteger currentIndex = [_modelArray indexOfObject:[contentVc model]];
    _vcIndex = currentIndex;
    
    BookCover *model = [_modelArray objectAtIndex:_vcIndex];
    [_imageLabel setText:[NSString stringWithFormat:@"%@", model.imageName]];
    
    if (currentIndex == _modelArray.count - 1) {
        return nil;
    }
    ImageViewController *imageViewController = [[ImageViewController alloc] init];
    imageViewController.model = [_modelArray objectAtIndex:currentIndex + 1];
    return imageViewController;
}

#pragma mark -
#pragma mark - UIPageViewControllerDataSource Method

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return _modelArray.count;
}
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

#pragma mark - 
#pragma mark - UI

- (void)customise
{
    [[self view] setBackgroundColor:[UIColor blackColor]];
}

- (void)addPager
{
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                          navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                        options:[NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:50.0f] forKey:UIPageViewControllerOptionInterPageSpacingKey]];
    _pageViewController.delegate = self;
    _pageViewController.dataSource = self;
    
    ImageViewController *imageViewController = [[ImageViewController alloc] init];
    imageViewController.model = [_modelArray objectAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:imageViewController];
    [self.pageViewController setViewControllers:viewControllers
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:nil];
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    
    CGRect pageViewRect = self.view.bounds;
    pageViewRect = CGRectInset(pageViewRect, 0.0, 30.0f);
    
    self.pageViewController.view.frame = pageViewRect;
    self.view.gestureRecognizers = _pageViewController.gestureRecognizers;
}

- (void)addLabel
{
    _imageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    _imageLabel.backgroundColor = [UIColor clearColor];
    _imageLabel.textColor = [UIColor whiteColor];
    [_imageLabel setFont:[UIFont boldSystemFontOfSize:16]];
    [_imageLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [_imageLabel setTextAlignment:NSTextAlignmentCenter];
    
    BookCover *model = [_modelArray objectAtIndex:0];
    _imageLabel.text = [NSString stringWithFormat:@"%@", model.imageName];
    [[self view] addSubview:_imageLabel];
}


#pragma mark - 
#pragma mark - Data

- (void)loadBooks
{
    _modelArray = [NSMutableArray arrayWithObjects:[[BookCover alloc] initWithImageName:@"hallows.jpg"],
                   [[BookCover alloc] initWithImageName:@"goblet.jpg"],
                   [[BookCover alloc] initWithImageName:@"angels-demons.jpg"],
                   [[BookCover alloc] initWithImageName:@"bilbo-song.jpg"],
                   [[BookCover alloc] initWithImageName:@"bard.jpg"],
                   [[BookCover alloc] initWithImageName:@"azkaban.jpg"],
                   nil];
    
}

@end
