//
//  StudentsTableViewController.m
//  TableView
//
//  Created by Istore on 21.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "StudentsTableViewController.h"
#import "StudentTableViewCell.h"

static NSString* const reuseIdentifier = @"studentCellIdentifier";

@interface StudentsTableViewController ()
@property (nonatomic, strong) NSMutableArray* studentArray;
@end

@implementation StudentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _studentArray = [NSMutableArray new];
    _studentArray = [NSMutableArray arrayWithObjects:@"Jenya",@"Ulan", @"Almaz",@"Avaz", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.studentArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StudentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.studentsName.text = [self.studentArray objectAtIndex:indexPath.row];
    
    
    
    return cell;
}



@end
