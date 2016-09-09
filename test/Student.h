//
//  Student.h
//  test
//
//  Created by Istore on 09.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSUInteger cours;
@property (assign, nonatomic) BOOL grant;

- (void) sayHelloToTheTecher;
- (void)sayHelloToTheTecherWithName;
- (void)sayHelloWithTeacherName: (NSString*) teacherName;
- (NSString*) getHelloTextWithTeacherName: (NSString*) teacherName;
@end
