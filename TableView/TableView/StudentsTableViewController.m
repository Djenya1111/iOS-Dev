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
#import "StudentDetailViewController.h"
#import "DataStorage.h"


static NSString* const reuseIdentifier = @"studentCellIdentifier";
static NSString* const kStudentDetailIdentifier = @"StudentDetail";

@interface StudentsTableViewController ()
@property (nonatomic, strong) NSMutableArray<StudentModel*>* studentArray;
@end

@implementation StudentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self updateJournal];
    
}

- (void) updateJournal{
    _studentArray = [DataStorage loadJournal];
     [self prepareArrayWithStudents];

    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (IBAction)addStudent:(id)sender {
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
    
    //cell.studentsPhoto = [[[UIImageView alloc] initWithImage:indicatorImage] autorelease];
                          
    //UIImageView *studentsPhoto = [[UIImageView alloc] init];
    
    cell.studentsPhoto.image = [UIImage imageNamed: student.picName];
    
    cell.deleteStudentsBlock = ^{
        
        NSLog(@"Minus Student");
        
        UIAlertController* alert = [UIAlertController
                                    alertControllerWithTitle: @"Udalit"
                                                    message: @"Udalit ili ostavit studenta"
                                    preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle: @"Otmenit"
                                 style: UIAlertActionStyleCancel
                                 handler: ^(UIAlertAction* action){
                                     
                                 }];
        
        UIAlertAction* udalit = [UIAlertAction
                                 actionWithTitle: @"udalit"
                                 style: UIAlertActionStyleDestructive
                                 handler: ^(UIAlertAction* action){
                                     
                                     [self.studentArray removeObjectAtIndex: indexPath.row];
                                     
                                     [DataStorage deleteStudentWithIndex: indexPath.row];
                                     
                                     [self.tableView reloadData];
                                     
                                 
                                 }];
        
        [alert addAction: cancel];
        [alert addAction: udalit];
        
        [self presentViewController: alert animated: YES completion: nil];
        
    };
    
    

    NSString* subjectString = [NSString new];
    
    for (int i = 0; i<student.subject.count; i++) {
        subjectString = [[student.subject valueForKey: @"description"] componentsJoinedByString: @" - "];
        //subjectString = [NSString stringWithFormat: @"%@, %@", subjectString, student, subjectString[i]];
        //subjectString = [subjectString stringByAppendingString: student.subject [i]];
    }
    cell.studentsSubject.text = subjectString;
    
    
    
    
    
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    [self performSegueWithIdentifier:kStudentDetailIdentifier
//                              sender:[_studentArray objectAtIndex:indexPath.row]];
//    
//
//}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    if ([segue.identifier isEqualToString:kStudentDetailIdentifier]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        StudentDetailViewController* detailVC = [segue destinationViewController];
        detailVC.student = _studentArray[indexPath.row];
    }
}

- (NSDictionary*) prepareMarkWithSubjects: (NSArray*) subject{
    NSMutableDictionary* marks = [NSMutableDictionary new];
    
    for (int i = 0; i < subject.count; i++) {
        NSInteger intMark = arc4random_uniform (4) +2;
        NSNumber* objMark = @(intMark);
        
        
        [marks setValue: objMark
                 forKey: subject[i]];
        
    }
    return marks;
    
}

- (void) prepareArrayWithStudents {
    
    NSArray* subjectArray = [NSArray new];
    
    StudentModel* student1 = [StudentModel new];
    StudentModel* student2 = [StudentModel new];
    StudentModel* student3 = [StudentModel new];
    
    student1.name = @"Jenya";
    student1.lastName = @"Kim";
    student1.age =  25;
    student1.cours = 1;
    student1.subject = [NSMutableArray arrayWithObjects: @"Algebra", @"Biologiya", @"Russia", @"Fizika", @"Spanish", @"Geografiya", @"Informatika", @"Astronomiya", @"Istoriya", @"Cherchenie", @"Francuzskii",  nil];
    student1.marks = [self prepareMarkWithSubjects: student1.subject];
    student1.picName = @"batman";
    
    
    //student1.studentsPhoto = [UIImageView imageNamed: @"batman"];
    
    //studentsPhoto.image = [UIImageView imageNamed: @"batman"];
    
    
    //student1.UIImage *studentsPhoto = [UIImageView imageNamed: @"batman.png"];
    
    
    subjectArray = [NSArray arrayWithArray:student1.subject];
    
    
    student2.name = @"Samat";
    student2.lastName = @"Lee";
    student2.age = 23;
    student2.cours = 3;
    student2.subject = [NSMutableArray arrayWithArray: subjectArray];
    [student2.subject addObject: @"Geometriya"];
    student2.marks = [self prepareMarkWithSubjects: student2.subject];
    student2.picName = @"hulk";
    
    
    
    
    student3.name = @"Andrei";
    student3.lastName = @"Pak";
    student3.age = 22;
    student3.cours = 3;
    student3.subject = [NSMutableArray arrayWithArray: subjectArray];
    [student3.subject addObject: @"Fizra"];
    student3.marks = [self prepareMarkWithSubjects: student3.subject];
    student3.picName = @"spider-man";
    
    
    
    
    
    
    StudentModel* student4 = [[StudentModel alloc] initWithName: @"Denis"
                                                       lastName: @"Ten"
                                                            age: 23
                                                          cours: 3
                                                        subject: subjectArray];
    
    
    student4.marks = [self prepareMarkWithSubjects: student4.subject];
    student4.picName = @"capitan-america";
    
    
    StudentModel* student5 = [StudentModel new];
    
    student5.name = @"Alex";
    student5.lastName = @"Han";
    student5.age = 23;
    student5.cours = 3;
    student5.subject = [NSMutableArray arrayWithArray: subjectArray];
    [student5.subject addObject: @"Himiya"];
    student5.marks = [self prepareMarkWithSubjects: student5.subject];
    student5.picName = @"superman";
    
    
    
    
    
    StudentModel* student6 = [[StudentModel alloc]  initWithName: @"Vanya"
                                                       lastName: @"Kan"
                                                            age: 24
                                                          cours: 4
                                                        subject: subjectArray];
    student6.marks = [self prepareMarkWithSubjects: student6.subject];
    student6.picName = @"hellboy";
    
    
    StudentModel* student7 = [[StudentModel alloc] initWithName: @"Bakyt"
                                                       lastName: @"Bakytov"
                                                            age: 23
                                                          cours: 3
                                                        subject: subjectArray];
    student7.marks = [self prepareMarkWithSubjects: student7.subject];
    student7.picName = @"Ironman";
    
    StudentModel* student8 = [[StudentModel alloc] initWithName: @"Asan"
                                                       lastName: @"Asanov"
                                                            age: 22
                                                          cours: 2
                                                        subject: subjectArray];
    student8.marks = [self prepareMarkWithSubjects: student8.subject];
    student8.picName = @"wolverine"; 
    
    
    
    //_studentArray = [NSMutableArray new];
    [_studentArray addObjectsFromArray: [NSMutableArray arrayWithObjects: student1,
                     student2,
                     student3,
                     student4,
                     student5,
                     student6,
                     student7,
                     student8, nil]];
    
}


@end
