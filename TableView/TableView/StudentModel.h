//
//  StudentModel.h
//  TableView
//
//  Created by Istore on 26.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentModel : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* lastName;
@property (assign, nonatomic) NSUInteger* age;
@property (assign, nonatomic) NSUInteger* cours;
@property (strong, nonatomic) NSMutableArray* subject;
@property (strong, nonatomic) NSDictionary* marks;

- (instancetype)initWithName:(NSString*) name
                    lastName:(NSString*) lastname
                         age:(NSUInteger) age
                       cours:(NSUInteger) cours
                     subject:(NSArray*) subject;

@end
