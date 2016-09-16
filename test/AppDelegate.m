//
//  AppDelegate.m
//  test
//
//  Created by Istore on 09.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
#import "Animal.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    Student* student1 = [Student new];
    student1.name = @"jenya";
    student1.cours = 3;
    student1.grant = YES;
   
    [student1 sayHelloToTheTecher];
    [student1 sayHelloToTheTecherWithName];
    [student1 sayHelloWithTeacherName: @"Avaz"];
    NSString* helloText = [student1 getHelloTextWithTeacherName: @"Avaz"];
    NSString* someText = helloText;
    NSLog(@"%@", someText);
    
    
    Animal* animal1 = [[Animal alloc]init];
    animal1.name = @"cat";
    animal1.word = @"Meow";
    animal1.boy = NO;
    animal1.age = 2;
    animal1.Pets = YES;
    
    [animal1 sayNameToTheMan];
    [animal1 getSayWordToTheMan];
    [animal1 animalSayWordToJenya: @"Jenya"];
    NSString* sayWord1 = [animal1 getSayWordWithHelloTo: @"Jenya"];
    NSLog (@"%@", sayWord1);
    
    Animal* animal2 = [Animal new];
    animal2.name = @"dog";
    animal2.word = @"Bark";
    animal2.boy = YES;
    animal2.age = 4;
    animal2.Pets = YES;
    
    [animal2 sayNameToTheMan];
    [animal2 getSayWordToTheMan];
    [animal2 animalSayWordToJenya: @"Jenya"];
    NSString* sayWord2 = [animal2 getSayWordWithHelloTo: @"Jenya"];
    NSLog (@"%@", sayWord2);
    
    
    Animal* animal3 = [Animal new];
    animal3.name = @"duck";
    animal3.word = @"krya krya";
    animal3.boy = YES;
    animal3.age = 1;
    animal3.Pets = NO;
    
    [animal3 sayNameToTheMan];
    [animal3 getSayWordToTheMan];
    [animal3 animalSayWordToJenya: @"Jenya"];
    NSString* sayWord3 = [animal3 getSayWordWithHelloTo: @"Jenya"];
    NSLog (@"%@", sayWord3);
    
    
    Animal* animal4 = [Animal new];
    animal4.name = @"Chicken";
    animal4.word = @"Co Co";
    animal4.boy = YES;
    animal4.age = 2;
    animal4.Pets = YES;
    
    [animal4 sayNameToTheMan];
    [animal4 getSayWordToTheMan];
    [animal4 animalSayWordToJenya: @"Jenya"];
    NSString* sayWord4 = [animal4 getSayWordWithHelloTo: @"Jenya"];
    NSLog (@"%@", sayWord4);
    
    Animal* animal5 = [Animal new];
    animal5.name = @"cow";
    animal5.word = @"Moo";
    animal5.boy = NO;
    animal5.age = 6;
    animal5.Pets = YES;
    
    [animal5 sayNameToTheMan];
    [animal5 getSayWordToTheMan];
    [animal5 animalSayWordToJenya: @"Jenya"];
    NSString* sayWord5 = [animal5 getSayWordWithHelloTo: @"Jenya"];
    NSLog (@"%@", sayWord5);
    
    
    
    
    
    
    
    return YES;
    
    
    
    
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
