//
//  BookCover.m
//  BookRater
//
//  Created by James Cryer on 17/03/2013.
//  Copyright (c) 2013 James Cryer. All rights reserved.
//

#import "BookCover.h"

@implementation BookCover

- (id)initWithImageName:(NSString *)imageName
{
    self = [super init];
    if (self)
    {
        _imageName = imageName;
        _rating = 0;
    }
    return self;
}

@end
