//
//  ViewController.m
//  Navigation
//
//  Created by Istore on 19.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "FirstViewController.h"
#import "ImageViewController.h"
#import "TextViewController.h"

const static NSString* secondControllerSegue = @"secondView";
const static NSString* textControllerSegue   = @"textView";




@interface FirstViewController ()
@property (strong, nonatomic) IBOutlet UIButton *buttonOutlet;
@property (strong, nonatomic) IBOutlet UIButton *textView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonOutlet.layer.cornerRadius = 20;
    self.textView.layer.cornerRadius = 20;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)jumpToSecondView:(id)sender {
}

- (IBAction)textView:(id)sender {
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:secondControllerSegue]) {
        ImageViewController* imageContr = [segue destinationViewController];
        imageContr.imageName = @"girl";
    } else if ([segue.identifier isEqualToString:textControllerSegue]){
        TextViewController* textVC = [segue destinationViewController];
        textVC.text = @"Hello World!!";
    }
    
    
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

