//
//  Student.m
//  test
//
//  Created by Istore on 09.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void) sayHelloToTheTecher {
    NSLog(@"HelloTecher");
}

- (void)sayHelloToTheTecherWithName{
    NSLog(@"HelloTecher, i am  %@ %lu", self.name, (unsigned long)self.cours);
}

- (void)sayHelloWithTeacherName: (NSString*) teacherName{
    NSLog(@"Hello %@, i am  %@ %lu", teacherName, self.name, (unsigned long)self.cours);
   
}

- (NSString*) getHelloTextWithTeacherName: (NSString*) teacherName {
    NSString* text = [NSString stringWithFormat: @"Hello %@", teacherName];
    return text;
}

@end

