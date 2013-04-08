//
//  PlaceViewController.m
//  Place
//
//  Created by Iurii Oliiar on 3/29/13.
//  Copyright (c) 2013 Iurii Oliiar. All rights reserved.
//

#import "PlaceViewController.h"

@interface PlaceViewController ()

@end

@implementation PlaceViewController

@synthesize place;
@synthesize detailTableView;
@synthesize photoImageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoTapped:)];
    [self.photoImageView addGestureRecognizer:recognizer];
    [recognizer release];
    
    if (!self.place.photo) {
        self.photoImageView.image = [ResourceLoader unknownPlaceImage];
    } else {
        self.photoImageView.image = self.place.photo;
    }
    
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithTitle:LOC_DONE
                                                            style:UIBarButtonItemStyleDone
                                                           target:self
                                                           action:@selector(done:)];
    self.navigationItem.rightBarButtonItem = bar;
    [bar release];
    
}

- (void)done:(UIBarButtonItem *)sender {
    sender.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [place release];
    [detailTableView release];
    [photoImageView release];
    [super dealloc];
}

- (void)viewDidUnload {
    self.detailTableView = nil;
    self.photoImageView = nil;
    [super viewDidUnload];
}

- (void)photoTapped:(UITapGestureRecognizer*)sender {
    NSLog(@"Photo tapped");
}

#pragma mark UITableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return DescriptionRowCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    switch (indexPath.row) {
        case DescriptionRowCategory:
            cell.textLabel.text = LOC_CATEGORY;
            break;
        case DescriptionRowName:
            cell.textLabel.text = LOC_NAME;
            break;
        case DescriptionRowComment:
            cell.textLabel.text = LOC_COMMENT;
            break;
        case DescriptionRowDateVisited:
            cell.textLabel.text = LOC_DATE_VISITED;
            break;
        default:
            NSLog(@"Unknown description cell");
            break;
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
