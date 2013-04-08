//
//  RouteViewController.h
//  Place
//
//  Created by Iurii Oliiar on 4/1/13.
//  Copyright (c) 2013 Iurii Oliiar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RouteViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) NSArray *places; // route entities

@end
