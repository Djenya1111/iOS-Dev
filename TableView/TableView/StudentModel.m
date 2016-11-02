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
                         age:(NSInteger) age
                       cours:(NSInteger) cours
                     subject:(NSArray*) subject
{
    self = [super init];
    if (self) {
        self.name = name;
        self.lastName = lastname;
        self.age = age;
        self.cours = cours;
        self.subject = [NSMutableArray arrayWithArray:subject];
        
        
        
    }
    return self;
}

- (nullable instancetype) initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        self.lastName =
        [aDecoder decodeObjectForKey: @"studentLastName"];
        self.name =
        [aDecoder decodeObjectForKey: @"studentName"];
        self.age =
        [aDecoder  decodeIntegerForKey: @"studentAge"];
        self.cours =
        [aDecoder decodeIntegerForKey: @"studentCours"];
        self.subject =
        [aDecoder decodeObjectForKey: @"studentSubject"];
        self.marks =
        [aDecoder decodeObjectForKey: @"studentMarks"];
        self.photoName =
        [aDecoder decodeObjectForKey: @"studentPhoto"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject: self.lastName
                  forKey: @"studentLastName"];
    [aCoder encodeObject: self.name
                  forKey: @"studentName"];
    [aCoder encodeInteger: self.age
                   forKey: @"studentAge"];
    [aCoder encodeInteger: self.cours
                   forKey: @"studentCours"];
    [aCoder encodeObject: self.subject
                  forKey: @"studentSubject"];
    [aCoder encodeObject: self.marks
                  forKey: @"studentMarks"];
    [aCoder encodeObject: self.photoName
                  forKey: @"studentPhoto"];


}
@end
