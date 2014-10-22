//
//  DetailViewController.m
//  SneakrBook
//
//  Created by Taylor Wright-Sanson on 10/22/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "DetailViewController.h"
#import "Friend.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *brandLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

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
    NSLog(@"Hi");
//    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
//
//    Friend *friend = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:managedObjectContext];
//
//    //adventurer.name = textField.text;
//    //adventurer.species = [NSNumber numberWithInt:arc4random_uniform(4)];
//
//    NSError *error;
//    if ([self.managedObjectContext save:&error])
//    {
//        [self loadAdventurers];
//        textField.text = @"";
//        [textField resignFirstResponder];
//    }
//    else
//    {
//        NSLog(@"Error Saving Adventurer: %@",error.localizedDescription);
//    }
}

@end
