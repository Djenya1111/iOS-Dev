//
//  Animal.h
//  test
//
//  Created by Istore on 15.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Animal : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* word;
@property (assign, nonatomic) BOOL boy;
@property (assign, nonatomic) NSUInteger age;
@property (assign, nonatomic) BOOL Pets;

- (void) sayNameToTheMan;
- (void) getSayWordToTheMan;
- (void) animalSayWordToJenya: (NSString*) nameOfTheMan;
- (NSString*) getSayWordWithHelloTo: (NSString*) nameOfTheMan;






@end
