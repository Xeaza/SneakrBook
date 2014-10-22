//
//  Friend.h
//  SneakrBook
//
//  Created by Taylor Wright-Sanson on 10/22/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Friend : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *shoes;
@end

@interface Friend (CoreDataGeneratedAccessors)

- (void)addShoesObject:(NSManagedObject *)value;
- (void)removeShoesObject:(NSManagedObject *)value;
- (void)addShoes:(NSSet *)values;
- (void)removeShoes:(NSSet *)values;

@end
