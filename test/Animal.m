//
//  Animal.m
//  test
//
//  Created by Istore on 15.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (void) sayNameToTheMan {
    NSLog(@"%@", self.name);
}

- (void) getSayWordToTheMan{
    NSLog(@"Get Say %@", self.word);
}

- (void) animalSayWordToJenya:(NSString *) nameOfTheMan{
    NSLog(@"%@ Say %@ To %@", self.name, self.word, nameOfTheMan);
}

- (NSString*) getSayWordWithHelloTo: (NSString*) nameOfTheMan {
    NSString* Text = [NSString stringWithFormat: @"%@ With Hello To %@", self.word, nameOfTheMan];
    return Text;
}








@end
