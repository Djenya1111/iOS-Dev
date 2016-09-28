//
//  StudentsTableViewController.m
//  TableView
//
//  Created by Istore on 21.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "StudentsTableViewController.h"
#import "StudentTableViewCell.h"
#import "StudentModel.h"


static NSString* const reuseIdentifier = @"studentCellIdentifier";

@interface StudentsTableViewController ()
@property (nonatomic, strong) NSMutableArray<StudentModel*>* studentArray;
@end

@implementation StudentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* subjectArray = [NSArray new];
    
    StudentModel* student1 = [StudentModel new];
    StudentModel* student2 = [StudentModel new];
    StudentModel* student3 = [StudentModel new];
    
    student1.name = @"Jenya";
    student1.lastName = @"Kim";
    student1.age = (NSUInteger*) 25;
    student1.cours = (NSUInteger*) 1;
    student1.subject = [NSMutableArray arrayWithObjects: @"Algebra", @"Biologiya", @"Russia", nil];
    
    subjectArray = [NSArray arrayWithArray:student1.subject];
    
    
    student2.name = @"Samat";
    student2.lastName = @"Lee";
    student2.age = (NSUInteger*) 23;
    student2.cours = (NSUInteger*) 3;
    student2.subject = [NSMutableArray arrayWithArray: subjectArray];
    
    [student2.subject addObject: @"Geometriya"];
    
    
    student3.name = @"Andrei";
    student3.lastName = @"Pak";
    student3.age = (NSUInteger*) 22;
    student3.cours = (NSUInteger*) 3;
    student3.subject = [NSMutableArray arrayWithArray: subjectArray];
    
    [student3.subject addObject: @"Fizra"];
    
    StudentModel* student4 = [[StudentModel alloc] initWithName: @"Denis"
                                                       lastName: @"Ten"
                                                            age: 23
                                                          cours: 3
                                                        subject: subjectArray];
    
    
    
    StudentModel* student5 = [StudentModel new];
    
    student5.name = @"Alex";
    student5.lastName = @"Han";
    student5.age = (NSUInteger*) 23;
    student5.cours = (NSUInteger*) 3;
    student5.subject = [NSMutableArray arrayWithArray: subjectArray];
    
    [student5.subject addObject: @"Himiya"];
    
    
    StudentModel* student6 = [[StudentModel alloc] initWithName: @"Vanya"
                                                       lastName: @"Kan"
                                                            age: 24
                                                          cours: 4
                                                        subject: subjectArray];
    
    StudentModel* student7 = [[StudentModel alloc] initWithName: @"Bakyt"
                                                       lastName: @"Bakytov"
                                                            age:23
                                                          cours:3
                                                        subject: subjectArray];
    
    StudentModel* student8 = [[StudentModel alloc] initWithName: @"Asan"
                                                       lastName: @"Asanov"
                                                            age:22
                                                          cours:2
                                                        subject: subjectArray];
    
    
    
    
    
    //_studentArray = [NSMutableArray new];
    _studentArray = [NSMutableArray arrayWithObjects: student1,
                                                      student2,
                                                      student3,
                                                      student4,
                                                      student5,
                                                      student6,
                                                      student7,
                                                      student8, nil];
    
    
    

    
    
   
    







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
    
    StudentModel* student = [self.studentArray objectAtIndex:indexPath.row];
    
    cell.studentsLastName.text = student.lastName;
    
    cell.studentsName.text = student.name;
    
    NSString* str = [student.subject objectAtIndex:0];
    cell.studentsSubject.text = str;
    
    
    return cell;
}



@end
