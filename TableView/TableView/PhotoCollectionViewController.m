//
//  PhotoCollectionViewController.m
//  TableView
//
//  Created by Istore on 26.10.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "PhotoCollectionViewController.h"
#import "DataStorage.h"
#import "StudentModel.h"
#import "PhotoCollectionViewCell.h"
#import "StudentDetailViewController.h"
#import "AddStudentViewController.h"


static NSString* const reuseIdentifier = @"PicShowDetailIdentifier";
static NSString* const keyPicShowDetailIdentifier = @"StudentDetail";


@interface PhotoCollectionViewController ()

@property (nonatomic, strong) NSMutableArray<StudentModel*>* students;

@end

@implementation PhotoCollectionViewController

static NSString* const keyCellIdentifier = @"studentsPhotoIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.students = [NSMutableArray new];
    [self prepareArrayWithStudents];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
 
 
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
 
 
 if ([segue.identifier isEqualToString:keyPicShowDetailIdentifier]) {
 
 NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] firstObject];
 
 StudentDetailViewController* photoDetail = [segue destinationViewController];
 photoDetail.student = _students [indexPath.row];
 }
 }



#pragma mark <UICollectionViewDataSource>



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.students.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:keyCellIdentifier forIndexPath:indexPath];
    
    cell.photoName.image = [UIImage imageNamed:self.students[indexPath.row].photoName];
    
    return cell;
}



#pragma mark <UICollectionViewDelegate>



-(CGSize) collectionView:(UICollectionView *) collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    int numberOfCellInRow = 3;
    CGFloat cellWith = [[UIScreen mainScreen] bounds].size.width/numberOfCellInRow-30;
    
    int numberOfCellInRowVertical = 3;
    
    CGFloat cellHeight = [[UIScreen mainScreen] bounds].size.width/numberOfCellInRowVertical-30;
    
    return CGSizeMake(cellWith, cellHeight);
    
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
    student1.photoName = @"batman";
    
    
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
    student2.photoName = @"hulk";
    
    
    
    
    student3.name = @"Andrei";
    student3.lastName = @"Pak";
    student3.age = 22;
    student3.cours = 3;
    student3.subject = [NSMutableArray arrayWithArray: subjectArray];
    [student3.subject addObject: @"Fizra"];
    student3.marks = [self prepareMarkWithSubjects: student3.subject];
    student3.photoName = @"spider-man";
    
    
    
    
    
    
    StudentModel* student4 = [[StudentModel alloc] initWithName: @"Denis"
                                                       lastName: @"Ten"
                                                            age: 23
                                                          cours: 3
                                                        subject: subjectArray];
    
    
    student4.marks = [self prepareMarkWithSubjects: student4.subject];
    student4.photoName = @"capitan-america";
    
    
    StudentModel* student5 = [StudentModel new];
    
    student5.name = @"Alex";
    student5.lastName = @"Han";
    student5.age = 23;
    student5.cours = 3;
    student5.subject = [NSMutableArray arrayWithArray: subjectArray];
    [student5.subject addObject: @"Himiya"];
    student5.marks = [self prepareMarkWithSubjects: student5.subject];
    student5.photoName = @"superman";
    
    
    
    
    
    StudentModel* student6 = [[StudentModel alloc]  initWithName: @"Vanya"
                                                        lastName: @"Kan"
                                                             age: 24
                                                           cours: 4
                                                         subject: subjectArray];
    student6.marks = [self prepareMarkWithSubjects: student6.subject];
    student6.photoName = @"hellboy";
    
    
    StudentModel* student7 = [[StudentModel alloc] initWithName: @"Bakyt"
                                                       lastName: @"Bakytov"
                                                            age: 23
                                                          cours: 3
                                                        subject: subjectArray];
    student7.marks = [self prepareMarkWithSubjects: student7.subject];
    student7.photoName = @"Ironman";
    
    StudentModel* student8 = [[StudentModel alloc] initWithName: @"Asan"
                                                       lastName: @"Asanov"
                                                            age: 22
                                                          cours: 2
                                                        subject: subjectArray];
    student8.marks = [self prepareMarkWithSubjects: student8.subject];
    student8.photoName = @"wolverine";
    
    
    
    //_studentArray = [NSMutableArray new];
    [self.students addObjectsFromArray: [NSMutableArray arrayWithObjects: student1,
                                         student2,
                                         student3,
                                         student4,
                                         student5,
                                         student6,
                                         student7,
                                         student8, nil]];
    
}

@end
