//
//  WebViewController.m
//  Blog Reader
//
//  Created by Alexander Nelson on 10/23/15.
//  Copyright © 2015 Jetwolfe Labs. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:self.blogPostURL];
    [self.webView loadRequest:urlRequest];
}


@end
