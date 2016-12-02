//
//  SignInViewController.m
//  Hav4i
//
//  Created by Avaz on 22.10.16.
//  Copyright © 2016 Avaz Abdrasulov. All rights reserved.
//

#import "SignInViewController.h"
#import <Quickblox/Quickblox.h>
#import <TOCropViewController.h>
#import <KVNProgress.h>

static NSString* const tabBarSegue   = @"tabBarSegueIdentifier";
static NSString* const keyUserProfil = @"profilUserDefaults";

@interface SignInViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, TOCropViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UIButton *avatar;
@property (strong, nonatomic) QBUUser* user;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    _nameField.delegate = self;
    _user = [QBSession currentSession].currentUser;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction) changeAvatar:(id)sender{
    
    UIImagePickerController* picker =
    [[UIImagePickerController alloc] init];
    
    picker.allowsEditing = NO;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    
    [self presentViewController:picker
                       animated:YES
                     completion:NULL];
}




#pragma mark - UIImagePickerControllerDelegate

- (void) imagePickerControllerDidCancel:(UIImagePickerController*) picker
{
    [picker dismissViewControllerAnimated:YES
                               completion:NULL];
}

- (void) imagePickerController:(UIImagePickerController*) picker
 didFinishPickingMediaWithInfo:(NSDictionary<NSString*, id>*) info
{
    [picker dismissViewControllerAnimated:YES
                               completion:NULL];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    TOCropViewController *cropViewController =
    [[TOCropViewController alloc] initWithCroppingStyle:TOCropViewCroppingStyleDefault image:image];
    cropViewController.aspectRatioLockEnabled = YES;
    cropViewController.aspectRatioPreset = TOCropViewControllerAspectRatioPresetSquare;
    cropViewController.delegate = self;
    cropViewController.aspectRatioPickerButtonHidden = YES;
    [self presentViewController:cropViewController animated:YES completion:nil];
    
}


#pragma mark - Sign In


-(IBAction) signIn:(id)sender{
    if (![self.avatar.imageView.image isEqual:[UIImage imageNamed:@"addAvatar"]] && self.nameField.text.length > 1) {
        if (_user.blobID) {
            [self  updateProfile];
        } else {
            [self  createProfile];
        }
        [KVNProgress showWithStatus:@"Отправка данных"];
    } else {
        
        [KVNProgress showErrorWithStatus:@"Выберите фотографию и введите имя"];
        
    }
}


- (void) updateProfile{
    NSData *imageData = UIImagePNGRepresentation(self.avatar.imageView.image);
    [KVNProgress updateStatus:@"Отправка картинки"];
    
    QBCBlob *blob = [QBCBlob blob];
    blob.ID = _user.blobID;
    blob.name = @"avatar";
    [QBRequest TUpdateFileWithData:imageData
                              file:blob
                      successBlock:^(QBResponse * _Nonnull response) {
                          QBUpdateUserParameters *updateParameters = [QBUpdateUserParameters new];
                          [KVNProgress updateStatus:@"Отправка данных"];
                          
                          updateParameters.website = blob.publicUrl;
                          updateParameters.blobID = blob.ID;
                          updateParameters.fullName = _nameField.text;
                          updateParameters.tags = [NSMutableArray arrayWithObjects:@"iOS", nil];
                          [QBRequest updateCurrentUser:updateParameters successBlock:^(QBResponse *response, QBUUser *user) {
                              [self saveUser];
                              [self performSegueWithIdentifier:tabBarSegue sender:nil];
                          } errorBlock:^(QBResponse *response) {
                              [KVNProgress showError];
                          }];
                          
                      } statusBlock:^(QBRequest * _Nonnull request, QBRequestStatus * _Nullable status) {
                          
                      } errorBlock:^(QBResponse * _Nonnull response) {
                          [KVNProgress showError];
                      }];
    
}



- (void) createProfile {
    NSData *imageData = UIImagePNGRepresentation(self.avatar.imageView.image);
    [KVNProgress updateStatus:@"Отправка картинки"];
    [QBRequest TUploadFile:imageData
                  fileName:@"avatar.png"
               contentType:@"image/png"
                  isPublic:YES
              successBlock:^(QBResponse *response, QBCBlob *blob) {
                  [KVNProgress updateStatus:@"Отправка данных"];
                  
                  
                  QBUpdateUserParameters *updateParameters = [QBUpdateUserParameters new];
                  updateParameters.website = blob.publicUrl;
                  updateParameters.blobID = blob.ID;
                  updateParameters.fullName = _nameField.text;
                  updateParameters.tags = [NSMutableArray arrayWithObjects:@"iOS", nil];
                  [QBRequest updateCurrentUser:updateParameters successBlock:^(QBResponse *response, QBUUser *user) {
                      [self saveUser];
                      [self performSegueWithIdentifier:tabBarSegue sender:nil];
                      
                  } errorBlock:^(QBResponse *response) {
                      [KVNProgress showError];
                  }];
                  
              } statusBlock:^(QBRequest *request, QBRequestStatus *status) {
                  
              } errorBlock:^(QBResponse *response) {
                  [KVNProgress showError];
                  NSLog(@"error: %@", response.error);
              }];
    
    
}


#pragma mark - Resize Image


- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

#pragma mark - TOCropViewControllerDelegate

- (void)cropViewController:(TOCropViewController *)cropViewController didCropToImage:(UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle
{
    CGSize newSize;
    newSize.height = 600;
    newSize.width  = 600;
    [self.avatar setImage:[self imageWithImage:image scaledToSize: newSize]
                 forState:UIControlStateNormal];
    [cropViewController dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UITextFieldDelegate


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.nameField resignFirstResponder];

    return YES;
}



- (void) saveUser{
    [[NSUserDefaults standardUserDefaults] setObject:@"updated"
                                              forKey:keyUserProfil];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (void) viewWillDisappear:(BOOL)animated{
    [KVNProgress dismiss];
}
@end
