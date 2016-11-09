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

#define DOCUMENTS [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

static NSString* const reuseIdentifier = @"PicShowDetailIdentifier";
static NSString* const keyStudentShowDetailIdentifier = @"StudentDetail";


@interface PhotoCollectionViewController ()

@property (nonatomic, strong) NSMutableArray<StudentModel*>* students;

@end

@implementation PhotoCollectionViewController

static NSString* const keyCellIdentifier = @"studentsPhotoIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.students = [DataStorage loadJournal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
 
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:keyStudentShowDetailIdentifier
                              sender:nil];
}

 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    if ([segue.identifier isEqualToString:keyStudentShowDetailIdentifier]) {
        
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
    
    cell.photoName.image = [UIImage imageWithData:[NSData dataWithContentsOfFile:
                                                   [DOCUMENTS stringByAppendingPathComponent: _students[indexPath.row].photoName]]];
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



@end
