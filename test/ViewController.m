//
//  ViewController.m
//  test
//
//  Created by Istore on 09.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Student* student1 = [Student new];
    student1.name = @"Jenya";
    student1.cours = 3;
    student1.grant = YES;
    
    // [jenya sayHelloToTheTecher];
    // [jenya sayHelloToTheTecherWithName];
    // [student1 sayHelloWithTeacherName: @"Avaz"];
    NSString* helloText = [student1 getHelloTextWithTeacherName:@"Bakyt"];
    NSString* someText = helloText;
    NSLog(@"%@", someText);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
