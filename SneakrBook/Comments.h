//
//  Comments.h
//  SneakrBook
//
//  Created by Taylor Wright-Sanson on 10/22/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Shoes;

@interface Comments : NSManagedObject

@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) Shoes *shoe;

@end
