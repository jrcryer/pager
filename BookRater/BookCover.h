//
//  BookCover.h
//  BookRater
//
//  Created by James Cryer on 17/03/2013.
//  Copyright (c) 2013 James Cryer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookCover : NSObject

- (id)initWithImageName:(NSString *)imageName;

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic) NSInteger rating;

@end
