//
//  SubjectsTableViewController.h
//  TableView
//
//  Created by Istore on 02.10.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentModel.h"


@interface SubjectsTableViewController : UITableViewController

@property (strong, nonatomic) StudentModel* student;

@property (strong, nonatomic) NSArray* subjectArray;
@property (strong, nonatomic) NSDictionary* marks;

@end
