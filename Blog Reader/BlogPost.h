//
//  BlogPost.h
//  Blog Reader
//
//  Created by Alexander Nelson on 10/22/15.
//  Copyright © 2015 Jetwolfe Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url;

//Designated Initializer
- (id) initWithTitle:(NSString *)title;

//Convenience Constructor
+ (id) blogPostWithTitle:(NSString *)title;

-(NSURL *) thumbnailURL;
-(NSString *) formattedDate;


@end
