//
//  ViewController.m
//  TableView
//
//  Created by Istore on 21.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor blueColor];
    self.navigationController.view.backgroundColor = [UIColor blueColor];
    self.navigationController.navigationBar.translucent = NO;
    
}

- (IBAction)ShowJournal:(id)sender {
    [self performSegueWithIdentifier:@"showJournalIdentifier" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
