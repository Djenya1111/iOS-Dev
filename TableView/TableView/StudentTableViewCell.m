//
//  StudentTableViewCell.m
//  TableView
//
//  Created by Istore on 21.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "StudentTableViewCell.h"

@implementation StudentTableViewCell
- (IBAction)deleteStudent:(id)sender {
    
    self.deleteStudentsBlock();
}


@end
