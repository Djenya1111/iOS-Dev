//
//  TextViewController.m
//  Navigation
//
//  Created by Istore on 19.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()
@property (strong, nonatomic) IBOutlet UILabel *TextViewController;


@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.TextViewController.text = _text;
    [self.TextViewController setText:_text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
