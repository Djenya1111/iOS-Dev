//
//  ViewController.m
//  Hav4i
//
//  Created by Avaz on 20.10.16.
//  Copyright © 2016 Avaz Abdrasulov. All rights reserved.
//

#import "SignUpViewController.h"
#import <DigitsKit/DigitsKit.h>
#import "SignInViewController.h"
#import <Quickblox/Quickblox.h>

static NSString* const signInSegue = @"profileSegue";

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loginWithDigits];
}


- (void) loginWithDigits{
    
    DGTAuthenticateButton *digitsButton =
    [DGTAuthenticateButton buttonWithAuthenticationCompletion:^(DGTSession *session, NSError *error) {
        
        DGTOAuthSigning *oauthSigning = [[DGTOAuthSigning alloc] initWithAuthConfig:[Digits sharedInstance].authConfig
                                                                        authSession:session];
        
        NSDictionary *authHeaders = [oauthSigning OAuthEchoHeadersToVerifyCredentials];
        if (!authHeaders) {
            NSLog(@"error: no authHeaders");
            return;
        }
        [QBRequest logInWithTwitterDigitsAuthHeaders:authHeaders successBlock:^(QBResponse *response, QBUUser *user) {
            [self performSegueWithIdentifier:signInSegue sender:session];
            
        } errorBlock:^(QBResponse *response) {
            NSLog(@"Response error: %@", response.error);
        }];
    }];
    
    digitsButton.center =
    CGPointMake(self.view.frame.size.width  / 2, self.view.frame.size.height * 0.8);
    [self.view addSubview:digitsButton];
    
}


@end
