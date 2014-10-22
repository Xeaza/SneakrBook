//
//  Shoes.h
//  SneakrBook
//
//  Created by Taylor Wright-Sanson on 10/22/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Friend;

@interface Shoes : NSManagedObject

@property (nonatomic, retain) NSNumber * size;
@property (nonatomic, retain) NSString * color;
@property (nonatomic, retain) NSString * brand;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) Friend *friends;
@property (nonatomic, retain) NSSet *comments;
@end

@interface Shoes (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(NSManagedObject *)value;
- (void)removeCommentsObject:(NSManagedObject *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

@end
