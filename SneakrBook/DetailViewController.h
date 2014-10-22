//
//  DetailViewController.h
//  SneakrBook
//
//  Created by Taylor Wright-Sanson on 10/22/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary *user;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end

