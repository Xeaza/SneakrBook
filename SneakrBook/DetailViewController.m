//
//  DetailViewController.m
//  SneakrBook
//
//  Created by Taylor Wright-Sanson on 10/22/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"
#import "Friend.h"
#import "Shoes.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *brandLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

@property Friend *friend;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.user[@"name"];
    self.brandLabel.text = self.user[@"shoeBrand"];
    self.colorLabel.text = self.user[@"shoeColor"];
    self.sizeLabel.text = [self.user[@"shoeSize"] stringValue];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.user[@"shoeImage"]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
           if (!error)
           {
               self.image.image = [[UIImage alloc] initWithData:data];
           }
       }];
}

- (IBAction)onFavoriteButtonPressed:(id)sender
{
//    self.friend = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:self.managedObjectContext];
//    self.friend.name = self.user[@"name"];
//    Shoes *shoe = [self createShoe];
//    [self.friend addShoesObject:shoe];
//
//    NSError *error;
//    if ([self.managedObjectContext save:&error])
//    {
//        NSLog(@"%@",shoe.size);
//    }
//    else
//    {
//        NSLog(@"Error Saving Shoe: %@",error.localizedDescription);
//    }
    [self createShoe];
}

- (void)createShoe
{
    //NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Shoes"];
    //request.predicate = [NSPredicate predicateWithFormat:@"name=%@", self.user[@"name"]];
    //NSArray *results = [self.friend.managedObjectContext executeFetchRequest:request error:nil];
    Shoes *shoe = [NSEntityDescription insertNewObjectForEntityForName:@"Shoes" inManagedObjectContext:self.managedObjectContext];
    shoe.brand = self.user[@"shoeBrand"];
    shoe.color = self.user[@"shoeColor"];
    shoe.size = self.user[@"shoeSize"];
    shoe.photo = UIImageJPEGRepresentation(self.image.image, 1);

    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Friend"];
    request.predicate = [NSPredicate predicateWithFormat:@"name == %@", self.user[@"name"]];
    NSError *error;
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];

    if (error)
    {
        NSLog(@"fetch error: %@, %@", error, error.userInfo);
    }

    if (results.count > 0)
    {
        NSLog(@"Shoe already exisits");
        [results.firstObject addShoesObject:shoe];
        shoe.friends = results.firstObject;
        return;
    }

    Friend *friend = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:self.managedObjectContext];
    friend.name = self.user[@"name"];

    [friend addShoesObject:shoe];
    shoe.friends = friend;

}

/*
- (Raid *)createRaid
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Raid"];
    request.predicate = [NSPredicate predicateWithFormat:@"date=%@", self.datePicker.date];
    NSArray *results = [self.adventurer.managedObjectContext executeFetchRequest:request error:nil];

    if (results.count > 0)
    {
        NSLog(@"Raid already exisits");
        return results.firstObject;
    }
    else
    {
        Raid *raid = [NSEntityDescription insertNewObjectForEntityForName:@"Raid" inManagedObjectContext:self.adventurer.managedObjectContext];
        raid.date = self.datePicker.date;
        return raid;
    }

    
}

- (IBAction)unwindFromDetailViewController:(UIStoryboardSegue *)segue
{
    DetailViewController *detailViewController =  segue.sourceViewController;
    Raid *raid = [detailViewController createRaid];

    [raid addAdventurersObject:detailViewController.adventurer];
    NSError *error;
    if ([self.managedObjectContext save:&error])
    {
        [self loadAdventurers];
    }
    else
    {
        NSLog(@"Error Adding raid: %@", error.localizedDescription);
    }

}
*/
@end
