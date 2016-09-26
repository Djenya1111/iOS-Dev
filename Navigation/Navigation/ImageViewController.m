//
//  SecondViewController.m
//  Navigation
//
//  Created by Istore on 19.09.16.
//  Copyright © 2016 IrokezDev. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageOutlet;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageOutlet.image = [UIImage imageNamed:self.imageName];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
