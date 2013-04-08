//
//  MasterViewController.m
//  Place
//
//  Created by Iurii Oliiar on 3/28/13.
//  Copyright (c) 2013 Iurii Oliiar. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CommonViewController.h"
#import "SearchViewController.h"
#import "PlaceViewController.h"
#import "RouteViewController.h"

@interface MasterViewController ()

@property (nonatomic, retain) NSArray *cellNames;

@end

@implementation MasterViewController

@synthesize cellNames;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = LOC_MENU;
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.cellNames = [NSArray arrayWithObjects:LOC_MY_PLACES,
                              LOC_SEARCH,
                              LOC_ADD_PLACE,
                              LOC_ADD_ROUTE,
                              nil];

            self.clearsSelectionOnViewWillAppear = NO;
            self.contentSizeForViewInPopover = CGSizeMake(300.0, 600.0);
        } else {
            self.cellNames = [NSArray arrayWithObjects:LOC_MY_PLACES,
                              LOC_SEARCH,
                              LOC_ADD_PLACE,
                              LOC_ADD_ROUTE,
                              LOC_GOTO_MAP,
                              nil];

        }
    }
    return self;
}
							
- (void)dealloc {
    [cellNames release];
    [_detailViewController release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cellNames.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[[UIView alloc] init] autorelease];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text = [cellNames objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.row) {
        case MenuRowMyPlaces: {
            CommonViewController *cvc = [[[CommonViewController alloc] init] autorelease];
            [self.navigationController pushViewController:cvc animated:YES];
        }
            break;
        case MenuRowSearch: {
            SearchViewController *svc = [[[SearchViewController alloc] init] autorelease];
            [self.navigationController pushViewController:svc animated:YES];
        }
            break;
        case MenuRowAddPlace: {
            PlaceViewController *pvc = [[[PlaceViewController alloc] init]autorelease];
            [self.navigationController pushViewController:pvc animated:YES];
        }
            break;
        case MenuRowAddRoute: {
            RouteViewController *rvc = [[[RouteViewController alloc] init] autorelease];
            [self.navigationController pushViewController:rvc animated:YES];
        }
            break;
        case MenuRowGoToMap:
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
                if (!self.detailViewController) {
                    self.detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController_iPhone" bundle:nil] autorelease];
                    self.detailViewController.detailItems = nil;
                    [self.navigationController pushViewController:self.detailViewController animated:YES];
                }
            } else {
                NSLog(@"Unknown IPad menu item");
            }
            break;
        default:
            NSLog(@"Unknown menu item");
            break;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
    return ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad || orientation == UIDeviceOrientationPortrait);
}

@end
