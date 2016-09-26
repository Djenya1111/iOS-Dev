//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Istore on 16.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()
@property (strong, nonatomic) IBOutlet UILabel *displayLabelOutlet;
@property (assign, nonatomic) NSInteger firstNumber;
@property (assign, nonatomic) NSInteger secondNumber;
@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.displayLabelOutlet.text = @"";
}


- (IBAction)numbersActionTap:(UIButton*)sender {
    [self showToDisplay:sender.tag];
}

- (IBAction)result:(UIButton *)sender {
    self.secondNumber = [self.displayLabelOutlet.text integerValue];
    self.displayLabelOutlet.text = @"";
   [self showToDisplay: self.firstNumber + self.secondNumber];
}

- (IBAction)mathAction:(UIButton *)sender {
    if (sender.tag == 10) {
        
    } else if (sender.tag == 11){
        
    } else if (sender.tag == 12){
        
    } else if (sender.tag == 13) {
        self.firstNumber = [self.displayLabelOutlet.text integerValue];
        self.displayLabelOutlet.text = @"";
    }
}

- (IBAction)displayClear:(id)sender {
    
    
}



- (void) showToDisplay:(NSInteger) number{
    NSString* numberString = [NSString stringWithFormat:@"%ld", number];
    NSString* displayText = [self.displayLabelOutlet.text stringByAppendingString:numberString];
    self.displayLabelOutlet.text = displayText;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
