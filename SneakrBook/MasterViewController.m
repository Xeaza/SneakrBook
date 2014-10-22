//
//  MasterViewController.m
//  SneakrBook
//
//  Created by Taylor Wright-Sanson on 10/22/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self loadUsers];
}


- (void)loadUsers
{
     NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/18/friends.json"]];

    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    NSURLSessionDataTask *task = [delegateFreeSession dataTaskWithRequest:request completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
        NSArray *users = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"Friends: %@",users);
     }];

    [task resume];
}

@end
