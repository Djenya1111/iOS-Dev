//
//  StudentModel.m
//  TableView
//
//  Created by Istore on 26.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "StudentModel.h"

@interface StudentModel()




@end

@implementation StudentModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithName:(NSString*) name
                    lastName:(NSString*) lastname
                         age:(NSUInteger) age
                       cours:(NSUInteger) cours
                     subject:(NSArray*) subject
{
    self = [super init];
    if (self) {
        self.name = name;
        self.lastName = lastname;
        self.age = &(age);
        self.cours = &(cours);
        self.subject = [NSMutableArray arrayWithArray:subject];
        
        
        
        
    }
    return self;
}

@end
