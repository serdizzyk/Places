//
//  PlaceViewController.h
//  Place
//
//  Created by Iurii Oliiar on 3/29/13.
//  Copyright (c) 2013 Iurii Oliiar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceEntity.h"
//кукуцкцкцукцук
@interface PlaceViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) PlaceEntity *place;
@property (retain, nonatomic) IBOutlet UIImageView *photoImageView;
@property (retain, nonatomic) IBOutlet UITableView *detailTableView;

@end
