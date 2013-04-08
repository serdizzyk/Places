//
//  DetailViewController.h
//  Place
//
//  Created by Iurii Oliiar on 3/28/13.
//  Copyright (c) 2013 Iurii Oliiar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>
//i was here!!!
@property (retain, nonatomic) NSArray *detailItems;
@property (retain, nonatomic) IBOutlet MKMapView *mapView;

- (void)clearMap;

@end
