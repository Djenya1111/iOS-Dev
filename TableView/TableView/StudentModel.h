//
//  StudentModel.h
//  TableView
//
//  Created by Istore on 26.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StudentModel : NSObject<NSCoding>

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* lastName;
@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) NSInteger cours;
@property (strong, nonatomic) NSMutableArray* subject;
@property (strong, nonatomic) NSDictionary* marks;

@property (strong, nonatomic) NSString* picName;


- (instancetype)initWithName:(NSString*) name
                    lastName:(NSString*) lastname
                         age:(NSInteger) age
                       cours:(NSInteger) cours
                     subject:(NSArray*) subject;

-(void) addSubject:(NSString *)objects;
-(void) removeSubject:(NSString *)objects;





//-(void) addObj:(NSString*) obj;
// {
// [_subjectArray addObject:obj];
// }
// 
// -(void) removeObj:(NSString*) obj;
// {
// [_array removeObject:obj];
// }

@end
