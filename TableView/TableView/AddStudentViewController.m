//
//  AddStudentViewController.m
//  TableView
//
//  Created by Istore on 07.10.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "AddStudentViewController.h"

@interface AddStudentViewController () <UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextField *lastNameField;
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *ageField;
@property (strong, nonatomic) IBOutlet UITextField *coursField;
- (IBAction)saveStudent:(id)sender;


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



- (IBAction)saveStudent:(id)sender {
    
    
}
@end
