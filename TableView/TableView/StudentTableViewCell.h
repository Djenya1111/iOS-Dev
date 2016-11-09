//
//  StudentTableViewCell.h
//  TableView
//
//  Created by Istore on 21.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SWTableViewCell.h>
@interface StudentTableViewCell : SWTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *studentsLastName;
@property (strong, nonatomic) IBOutlet UIImageView *studentsPhoto;
@property (strong, nonatomic) IBOutlet UILabel *studentsSubject;
@property (strong, nonatomic) IBOutlet UILabel *studentsName;
@property (strong, nonatomic) dispatch_block_t deleteStudentsBlock;



@end
