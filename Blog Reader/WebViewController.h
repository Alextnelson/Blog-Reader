//
//  WebViewController.h
//  Blog Reader
//
//  Created by Alexander Nelson on 10/23/15.
//  Copyright © 2015 Jetwolfe Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (strong, nonatomic) NSURL *blogPostURL;
@property (strong, nonatomic) IBOutlet UIWebView *webView;



@end
