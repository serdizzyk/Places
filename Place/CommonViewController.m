//
//  CommonViewController.m
//  Place
//
//  Created by Iurii Oliiar on 4/1/13.
//  Copyright (c) 2013 Iurii Oliiar. All rights reserved.
//

#import "CommonViewController.h"

@interface CommonViewController ()

@property (nonatomic, retain) NSMutableArray *routes;
@property (nonatomic, retain) NSMutableArray *places;

@end

@implementation CommonViewController

@synthesize routes;
@synthesize places;
@synthesize tableViewPR;

#pragma mark ViewController lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [routes release];
    [places release];
    [tableViewPR release];
    [super dealloc];
}
- (void)viewDidUnload {
    self.tableViewPR = nil;
    [super viewDidUnload];
}

#pragma mark UItableview methods 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return CategorySectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger counter;
    switch (section) {
        case CategorySectionPlace:
            counter = [places count];
            break;
        case CategorySectionRoute:
            counter = [routes count];
            break;
        default:
            counter = 0;
            NSLog(@"Unknown Place - Route section");
            break;
    }
    return counter;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    switch (indexPath.section) {
        case CategorySectionPlace:
            cell.textLabel.text = [places objectAtIndex:indexPath.row];
            break;
        case CategorySectionRoute:
            cell.textLabel.text = [routes objectAtIndex:indexPath.row];
            break;
        default:
            NSLog(@"Unknown Place - Route");
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case CategorySectionPlace:
            break;
        case CategorySectionRoute:
            break;
        default:
            NSLog(@"Unknown Place - Route cell taped");
            break;
    }

}

@end
