//
//  TableViewController.m
//  Blog Reader
//
//  Created by Alexander Nelson on 10/22/15.
//  Copyright © 2015 Jetwolfe Labs. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"
#import "WebViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *blogURL = [NSURL URLWithString:@"http://blog.teamtreehouse.com/api/get_recent_summary"];

    NSData *jsonData = [NSData dataWithContentsOfURL:blogURL];

    NSError *error = nil;

    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];

    self.blogPosts = [NSMutableArray array];

    NSArray *blogPostsArray = [dataDictionary objectForKey:@"posts"];

    for (NSDictionary *bpDictionary in blogPostsArray) {
        BlogPost *blogPost = [BlogPost blogPostWithTitle:[bpDictionary objectForKey:@"title"]];
        blogPost.author = [bpDictionary objectForKey:@"author"];
        blogPost.thumbnail = [bpDictionary objectForKey:@"thumbnail"];
        blogPost.date = [bpDictionary objectForKey:@"date"];
        blogPost.url = [NSURL URLWithString:[bpDictionary objectForKey:@"url"]];
        [self.blogPosts addObject:blogPost];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.blogPosts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlogPosts" forIndexPath:indexPath];

    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];

    if ([blogPost.thumbnail isKindOfClass:[NSString class]]) {
        NSData *imageData = [NSData dataWithContentsOfURL:blogPost.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
    } else {
        cell.imageView.image = [UIImage imageNamed:@"treehouse"];
    }
    cell.textLabel.text = blogPost.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Author: %@, Date: %@", blogPost.author, [blogPost formattedDate]];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Preparing for segue: %@", segue.identifier);

    if ([segue.identifier isEqualToString:@"showBlogPost"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];
        WebViewController *wc = (WebViewController *)segue.destinationViewController;
        wc.blogPostURL = blogPost.url;
//        [segue.destinationViewController setBlogPostURL:blogPost.url];
    }
}

@end

//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    BlogPost *blogPost = [self.blogPosts objectAtIndex:indexPath.row];

//Sample code for pushing to native browser in phone
//    UIApplication *application = [UIApplication sharedApplication];
//    [application openURL:blogPost.url];

//}


