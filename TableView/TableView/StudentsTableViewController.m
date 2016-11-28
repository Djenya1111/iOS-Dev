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
#import <SWTableViewCell.h>

#define DOCUMENTS [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

static NSString* const reuseIdentifier = @"studentCellIdentifier";
static NSString* const kStudentDetailIdentifier = @"tableStudentIdentifier";

@interface StudentsTableViewController ()<SWTableViewCellDelegate>
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
    //    [self prepareArrayWithStudents];
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
    cell.leftUtilityButtons   = [self leftButtons];
    cell.rightUtilityButtons  = [self rightButtons];
    cell.delegate = self;

    cell.studentsLastName.text = student.lastName;
    
    cell.studentsName.text = student.name;
    
    cell.studentsPhoto.image = [UIImage imageWithData:[NSData dataWithContentsOfFile:
                                                       [DOCUMENTS stringByAppendingPathComponent: student.photoName]]];
    
    cell.deleteStudentsBlock = ^{
        [self deleteStudentAtIndex:indexPath.row];
    };
    
    NSString* subjectString = [NSString new];
    
    for (int i = 0; i<student.subject.count; i++) {
        subjectString = [[student.subject valueForKey: @"description"] componentsJoinedByString: @" - "];
        
    }
    
    cell.studentsSubject.text = subjectString;
    
    
    return cell;
}

- (void) deleteStudentAtIndex: (NSInteger) index {
    
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle: @"Внимание!!!"
                                message: @"Удалить или оставить Студента"
                                preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle: @"Отменить"
                             style: UIAlertActionStyleCancel
                             handler: ^(UIAlertAction* action){
                                 
                             }];
    
    UIAlertAction* udalit = [UIAlertAction
                             actionWithTitle: @"Удалить"
                             style: UIAlertActionStyleDestructive
                             handler: ^(UIAlertAction* action){
                                 
                                 [self.studentArray removeObjectAtIndex: index];
                                 
                                 [DataStorage deleteStudentWithIndex: index];
                                 
                                 [self.tableView reloadData];
                                 
                                 
                             }];
    
    [alert addAction: cancel];
    [alert addAction: udalit];
    
    [self presentViewController: alert animated: YES completion: nil];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:kStudentDetailIdentifier sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    if ([segue.identifier isEqualToString:kStudentDetailIdentifier]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        StudentDetailViewController* detailVC = [segue destinationViewController];
        detailVC.student = _studentArray[indexPath.row];
    }
}

#pragma mark - Buttons

- (NSArray *)rightButtons
{
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
    
    
    
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                 icon:[UIImage imageNamed:@"edit_swipe"]];
    [rightUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188 alpha:1.0f]
                                                 icon:[UIImage imageNamed:@"delete_swipe"]];
    return rightUtilityButtons;
}

- (NSArray *)leftButtons
{
    NSMutableArray *leftUtilityButtons = [NSMutableArray new];
    
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                icon:[UIImage imageNamed:@"logo"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
                                                icon:[UIImage imageNamed:@"logo"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
                                                icon:[UIImage imageNamed:@"logo"]];
    [leftUtilityButtons sw_addUtilityButtonWithColor:
     [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
                                                icon:[UIImage imageNamed:@"logo"]];
    
    return leftUtilityButtons;
}

#pragma mark - SWTableViewDelegate

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            NSLog(@"check button was pressed");
            break;
        case 1:
            NSLog(@"clock button was pressed");
            break;
        case 2:
            NSLog(@"cross button was pressed");
            break;
        case 3:
            NSLog(@"list button was pressed");
        default:
            break;
    }
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    switch (index) {
        case 0:{
                        break;
        }
        case 1:
        {
            NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
            [self deleteStudentAtIndex:indexPath.row];
            break;
        }
        default:
            break;
    }
}



//- (NSDictionary*) prepareMarkWithSubjects: (NSArray*) subject{
//    NSMutableDictionary* marks = [NSMutableDictionary new];
//
//    for (int i = 0; i < subject.count; i++) {
//        NSInteger intMark = arc4random_uniform (4) +2;
//        NSNumber* objMark = @(intMark);
//
//
//        [marks setValue: objMark
//                 forKey: subject[i]];
//
//    }
//    return marks;
//
//}

//- (void) prepareArrayWithStudents {
//
//    NSArray* subjectArray = [NSArray new];
//
//    StudentModel* student1 = [StudentModel new];
//    StudentModel* student2 = [StudentModel new];
//    StudentModel* student3 = [StudentModel new];
//
//    student1.name = @"Jenya";
//    student1.lastName = @"Kim";
//    student1.age =  25;
//    student1.cours = 1;
//    student1.subject = [NSMutableArray arrayWithObjects: @"Algebra", @"Biologiya", @"Russia", @"Fizika", @"Spanish", @"Geografiya", @"Informatika", @"Astronomiya", @"Istoriya", @"Cherchenie", @"Francuzskii",  nil];
//    student1.marks = [self prepareMarkWithSubjects: student1.subject];
//    student1.photoName = @"batman";
//
//
//    //student1.studentsPhoto = [UIImageView imageNamed: @"batman"];
//
//    //studentsPhoto.image = [UIImageView imageNamed: @"batman"];
//
//
//    //student1.UIImage *studentsPhoto = [UIImageView imageNamed: @"batman.png"];
//
//
//    subjectArray = [NSArray arrayWithArray:student1.subject];
//
//
//    student2.name = @"Samat";
//    student2.lastName = @"Lee";
//    student2.age = 23;
//    student2.cours = 3;
//    student2.subject = [NSMutableArray arrayWithArray: subjectArray];
//    [student2.subject addObject: @"Geometriya"];
//    student2.marks = [self prepareMarkWithSubjects: student2.subject];
//    student2.photoName = @"hulk";
//
//
//
//
//    student3.name = @"Andrei";
//    student3.lastName = @"Pak";
//    student3.age = 22;
//    student3.cours = 3;
//    student3.subject = [NSMutableArray arrayWithArray: subjectArray];
//    [student3.subject addObject: @"Fizra"];
//    student3.marks = [self prepareMarkWithSubjects: student3.subject];
//    student3.photoName = @"spider-man";
//
//
//
//
//
//
//    StudentModel* student4 = [[StudentModel alloc] initWithName: @"Denis"
//                                                       lastName: @"Ten"
//                                                            age: 23
//                                                          cours: 3
//                                                        subject: subjectArray];
//
//
//    student4.marks = [self prepareMarkWithSubjects: student4.subject];
//    student4.photoName = @"capitan-america";
//
//
//    StudentModel* student5 = [StudentModel new];
//
//    student5.name = @"Alex";
//    student5.lastName = @"Han";
//    student5.age = 23;
//    student5.cours = 3;
//    student5.subject = [NSMutableArray arrayWithArray: subjectArray];
//    [student5.subject addObject: @"Himiya"];
//    student5.marks = [self prepareMarkWithSubjects: student5.subject];
//    student5.photoName = @"superman";
//
//
//
//
//
//    StudentModel* student6 = [[StudentModel alloc]  initWithName: @"Vanya"
//                                                       lastName: @"Kan"
//                                                            age: 24
//                                                          cours: 4
//                                                        subject: subjectArray];
//    student6.marks = [self prepareMarkWithSubjects: student6.subject];
//    student6.photoName = @"hellboy";
//
//
//    StudentModel* student7 = [[StudentModel alloc] initWithName: @"Bakyt"
//                                                       lastName: @"Bakytov"
//                                                            age: 23
//                                                          cours: 3
//                                                        subject: subjectArray];
//    student7.marks = [self prepareMarkWithSubjects: student7.subject];
//    student7.photoName = @"Ironman";
//
//    StudentModel* student8 = [[StudentModel alloc] initWithName: @"Asan"
//                                                       lastName: @"Asanov"
//                                                            age: 22
//                                                          cours: 2
//                                                        subject: subjectArray];
//    student8.marks = [self prepareMarkWithSubjects: student8.subject];
//    student8.photoName = @"wolverine";
//
//
//
//    //_studentArray = [NSMutableArray new];
//    [_studentArray addObjectsFromArray: [NSMutableArray arrayWithObjects: student1,
//                     student2,
//                     student3,
//                     student4,
//                     student5,
//                     student6,
//                     student7,
//                     student8, nil]];
//
//}


@end
