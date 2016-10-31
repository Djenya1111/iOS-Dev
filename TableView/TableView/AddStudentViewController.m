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
@property (assign, nonatomic) BOOL fizikaSelected;
@property (assign, nonatomic) BOOL russiaSelected;
@property (assign, nonatomic) BOOL spanishSelected;
@property (assign, nonatomic) BOOL informatikaSelected;

@property (strong, nonatomic) IBOutlet UIButton *algebraOutlet;
@property (strong, nonatomic) IBOutlet UIButton *russiaOutlet;
@property (strong, nonatomic) IBOutlet UIButton *fizikaOutlet;
@property (strong, nonatomic) IBOutlet UIButton *spanishOutlet;
@property (strong, nonatomic) IBOutlet UIButton *informatikaOutlet;

@property (strong, nonatomic) StudentModel* student;

@end

@implementation AddStudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lastNameField.delegate = self;
    self.nameField.delegate = self;
    self.ageField.delegate = self;
    self.coursField.delegate = self;
    [self.lastNameField becomeFirstResponder];
    self.student = [StudentModel new];
    self.student.subject = [NSMutableArray new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Subject Selecting


- (IBAction)algebraMark:(UIButton*)sender {
    if (self.algebraSelected) {
        self.algebraSelected = NO;
        [self.algebraOutlet setImage:[UIImage imageNamed:@"off"] forState:UIControlStateNormal];
        [self.student.subject removeObject: sender.currentTitle];
    }  else {
        self.algebraSelected = YES;
        [self.student.subject addObject: sender.currentTitle];
        [self.algebraOutlet setImage:[UIImage imageNamed:@"on"] forState:UIControlStateNormal];
    }
}

- (IBAction)russiaMark:(UIButton*)sender {
    if (self.russiaSelected) {
        self.russiaSelected = NO;
        [self.russiaOutlet setImage:[UIImage imageNamed:@"off"] forState:UIControlStateNormal];
        NSUInteger index = [_student.subject indexOfObject: sender.currentTitle];
        [self.student.subject removeObjectAtIndex: index];
    }   else {
        self.russiaSelected = YES;
        [self.student.subject addObject: sender.currentTitle];
        [self.russiaOutlet setImage:[UIImage imageNamed:@"on"] forState:UIControlStateNormal];
    }
}

- (IBAction)fizikaMark:(UIButton*)sender {
    if (self.fizikaSelected) {
        self.fizikaSelected = NO;
        [self.fizikaOutlet setImage:[UIImage imageNamed:@"off"] forState:UIControlStateNormal];
        NSUInteger index = [_student.subject indexOfObject: sender.currentTitle];
        [self.student.subject removeObjectAtIndex: index];
    }   else {
        self.fizikaSelected = YES;
        [self.student.subject addObject: sender.currentTitle];
        [self.fizikaOutlet setImage:[UIImage imageNamed:@"on"] forState:UIControlStateNormal];
    }
}

- (IBAction)spanishMark:(UIButton*)sender {
    if (self.spanishSelected) {
        self.spanishSelected = NO;
        [self.spanishOutlet setImage:[UIImage imageNamed:@"off"] forState:UIControlStateNormal];
        NSUInteger index = [_student.subject indexOfObject: sender.currentTitle];
        [self.student.subject removeObjectAtIndex: index];
    }   else {
        self.spanishSelected = YES;
        [self.student.subject addObject: sender.currentTitle];
        [self.spanishOutlet setImage:[UIImage imageNamed:@"on"] forState:UIControlStateNormal];
    }
}

- (IBAction)informatikaMark:(UIButton*)sender {
    if (self.informatikaSelected) {
        self.informatikaSelected = NO;
        [self.informatikaOutlet setImage:[UIImage imageNamed:@"off"] forState:UIControlStateNormal];
        NSUInteger index = [_student.subject indexOfObject: sender.currentTitle];
        [self.student.subject removeObjectAtIndex: index];
    }   else {
        self.informatikaSelected = YES;
        [self.student.subject addObject: sender.currentTitle];
        [self.informatikaOutlet setImage:[UIImage imageNamed:@"on"] forState:UIControlStateNormal];
    }
}


#pragma mark - Subject Mark


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
    
    //    StudentModel* student = [StudentModel new];
    self.student.lastName    = self.lastNameField.text;
    self.student.name        = self.nameField.text;
    self.student.age         = [self.ageField.text integerValue];
    self.student.cours       = [self.coursField.text integerValue];
    self.student.marks       = [self prepareMarkWithSubjects: self.student.subject];
    
    [DataStorage addStudentToJournal: self.student];
    
    [self.navigationController popViewControllerAnimated: YES];
    
}



@end
