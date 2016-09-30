//
//  StudentDetailViewController.m
//  TableView
//
//  Created by Istore on 28.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "StudentDetailViewController.h"

@interface StudentDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *LastName;
@property (strong, nonatomic) IBOutlet UILabel *Name;
@property (strong, nonatomic) IBOutlet UIImageView *StudentPic;

@end

@implementation StudentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Name.text = self.student.name;
    self.LastName.text = self.student.lastName;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
