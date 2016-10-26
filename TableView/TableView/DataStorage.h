//
//  DataStorage.h
//  TableView
//
//  Created by Istore on 12.10.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentModel.h"

@interface DataStorage : NSObject


+ (void) addStudentToJournal:(StudentModel*) student;
+ (NSMutableArray*) loadJournal;
+ (void) deleteStudentWithIndex: (NSInteger) index;



@end
