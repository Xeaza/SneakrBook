//
//  MasterViewController.m
//  SneakrBook
//
//  Created by Taylor Wright-Sanson on 10/22/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "FavoritesTableViewController.h"
#import "Friend.h"
#import "Shoes.h"

@interface MasterViewController ()

@property NSArray *users;

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

        NSArray *usersFromJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (error) {
            NSLog(@"Error: %@",error.localizedDescription);
        }
        //NSLog(@"Friends: %@",users);
        NSArray *shoeBrands = @[@"Nike", @"New Balance", @"Puma", @"James Bond"];
        NSArray *shoeSizes = @[@7, @5, @8, @12];
        NSArray *shoeColors = @[@"Blue", @"Green", @"Yellow", @"Purple"];
        NSArray *shoeImages = @[[NSURL URLWithString:@"https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQLPIWBSq4BTHAXFs6wUneg5vYesY8ai0TVr_MmXnZbe4Pun7FU"], [NSURL URLWithString:@"http://media.melablog.it/a/app/apple_shoes.jpg"], [NSURL URLWithString:@"http://www.lobshots.com/wp-content/uploads/2011/10/google-nike-shoes.jpg"], [NSURL URLWithString:@"https://img1.etsystatic.com/000/0/5783547/il_fullxfull.238454345.jpg"]];


        NSMutableArray *newUsers = [NSMutableArray array];
        for (NSString *user in usersFromJson)
        {
            int randomIndex1 = arc4random_uniform(3);
            int randomIndex2 = arc4random_uniform(3);
            int randomIndex3 = arc4random_uniform(3);
            int randomIndex4 = arc4random_uniform(3);
            NSDictionary *usersDetails = [NSDictionary dictionaryWithObjectsAndKeys:user, @"name", shoeBrands[randomIndex1], @"shoeBrand", shoeSizes[randomIndex2], @"shoeSize", shoeColors[randomIndex3], @"shoeColor", shoeImages[randomIndex4], @"shoeImage",  nil];
            [newUsers addObject:usersDetails];
        }
        self.users = [NSArray arrayWithArray:newUsers];
        [self.tableView reloadData];
     }];
    [task resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.users.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSDictionary *userDict = [self.users objectAtIndex:indexPath.row];
    cell.textLabel.text = userDict[@"name"];
    return cell;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];

    if ([segue.identifier isEqualToString:@"UserDetailSegue"])
    {
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.user = [self.users objectAtIndex:indexPath.row];
        detailViewController.managedObjectContext = self.managedObjectContext;
        //[detailViewController setManagedObjectContext:[self managedObjectContext]];
    }
    else if ([segue.identifier isEqualToString:@"FavoritesSegue"])
    {
        FavoritesTableViewController *favoritesTableViewController = segue.destinationViewController;
       // favoritesTableViewController.managedObjectContext = self.managedObjectContext;
//        [favoritesTableViewController setManagedObjectContext:[self managedObjectContext]];
    }
}

//- (IBAction)unwindFromDetailViewController:(UIStoryboardSegue *)segue
//{
//    DetailViewController *detailViewController =  segue.sourceViewController;
//    Friend *friend = [detailViewController createShoe];
//
//    [friend addAdventurersObject:detailViewController.adventurer];
//    NSError *error;
//    if ([self.managedObjectContext save:&error])
//    {
//        [self loadAdventurers];
//    }
//    else
//    {
//        NSLog(@"Error Adding raid: %@", error.localizedDescription);
//    }
//
//}

@end
