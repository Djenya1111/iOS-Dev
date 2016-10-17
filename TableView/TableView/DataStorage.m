//
//  DataStorage.m
//  TableView
//
//  Created by Istore on 12.10.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "DataStorage.h"

static NSString* const kJournalUD = @"jornalUserDefaults";

@implementation DataStorage

    + (void) addStudentToJournal:(StudentModel *)student {
        NSMutableArray* journal = [NSMutableArray new];
        journal = [self loadJournal];
        [journal addObject: student];
        [self saveJournal: journal];
        
    
}

+ (NSMutableArray*) loadJournal {
    NSData* journalData = [[NSUserDefaults standardUserDefaults] objectForKey:kJournalUD];
    NSMutableArray* journal = nil;
    if (journalData) {
        journal =
        [NSKeyedUnarchiver unarchiveObjectWithData: journalData];
    } else {
        journal = [NSMutableArray new];
    }
    return journal;
    
}

+ (void) saveJournal: (NSMutableArray*) journal{
    NSData* journalData = [NSKeyedArchiver archivedDataWithRootObject: journal];
    [[NSUserDefaults standardUserDefaults] setObject: journalData
                                              forKey:kJournalUD];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
    
    @end

