//
//  StudentDetailViewController.m
//  TableView
//
//  Created by Istore on 28.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "StudentDetailViewController.h"
#import "SubjectsTableViewController.h"


@interface StudentDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *LastName;
@property (strong, nonatomic) IBOutlet UILabel *Name;
@property (strong, nonatomic) IBOutlet UILabel *age;
@property (strong, nonatomic) IBOutlet UILabel *cours;
@property (strong, nonatomic) IBOutlet UIImageView *StudentPic;

@end

@implementation StudentDetailViewController

static NSString* const kSubjectsContainer= @"subjectsContainer";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Name.text = self.student.name;
    self.LastName.text = self.student.lastName;
    self.age.text = [NSString stringWithFormat: @"%d years old", (int) self.student.age];
    self.cours.text = [NSString stringWithFormat: @"%d cours", (int) self.student.cours];
    self.StudentPic.image = [UIImage imageNamed:self.student.photoName];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:kSubjectsContainer]) {
        
        SubjectsTableViewController* detailVC = [segue destinationViewController];
        
        detailVC.student = self.student;
        
    }

}


@end
