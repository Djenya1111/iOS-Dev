//
//  AddStudentViewController.m
//  TableView
//
//  Created by Istore on 07.10.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "AddStudentViewController.h"
#import "DataStorage.h"

@interface AddStudentViewController () <UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextField *lastNameField;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *ageField;
@property (strong, nonatomic) IBOutlet UITextField *coursField;
- (IBAction)saveStudent:(id)sender;

@property (assign, nonatomic) BOOL algebraSelected;
@property (assign,nonatomic) BOOL
    fizikaSelected;
@property (assign, nonatomic) BOOL
    russiaSelected;
@property (assign, nonatomic) BOOL
    spanishSelected;
@property (assign, nonatomic) BOOL
    informatikaSelected;


@property (strong, nonatomic) IBOutlet UIButton *algebraOutlet;
@property (strong, nonatomic) IBOutlet UIButton *russiaOutlet;
@property (strong, nonatomic) IBOutlet UIButton *fizikaOutlet;
@property (strong, nonatomic) IBOutlet UIButton *spanishOutlet;
@property (strong, nonatomic) IBOutlet UIButton *informatikaOutlet;




@end


@implementation AddStudentViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.lastNameField.delegate = self;
    self.nameField.delegate = self;
    self.ageField.delegate = self;
    self.coursField.delegate = self;
    
    [self.lastNameField becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




#pragma mark - Subject Selecting


- (IBAction)algebraMark:(id)sender {
    if (self.algebraSelected) {
        self.algebraSelected = NO;
        [self.algebraOutlet setImage:[UIImage imageNamed:@"hellboy"] forState:UIControlStateNormal];
    }  else {
        self.algebraSelected = YES;
        [self.algebraOutlet setImage:[UIImage imageNamed:@"hulk"] forState:UIControlStateNormal];
    }
}
- (IBAction)russiaMark:(id)sender {
}
- (IBAction)fizikaMark:(id)sender {
}
- (IBAction)spanishMark:(id)sender {
}
- (IBAction)informatikaMark:(id)sender {
}
- (IBAction)biologiyaMark:(id)sender {
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField isEqual: self.lastNameField]) {
        [self.nameField becomeFirstResponder];
        
    } else if ([textField isEqual: self.nameField]){
        [self.ageField becomeFirstResponder];
        
    } else if ([textField isEqual: self.ageField]){
        [self.coursField becomeFirstResponder];
        
    } else {
        [textField resignFirstResponder];
        
    }
    
    return YES;
}


#pragma mark - Save Student


- (IBAction)saveStudent:(id)sender {
    
    StudentModel* student = [StudentModel new];
    student.lastName    = self.lastNameField.text;
    student.name        = self.nameField.text;
    student.age         = [self.ageField.text integerValue];
    student.cours       = [self.coursField.text integerValue];
    
    [DataStorage addStudentToJournal: student];
    
    [self.navigationController popViewControllerAnimated: YES];
    
    
    
    
    
}
@end
