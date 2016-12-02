//
//  APIClient.m
//  Services
//
//  Created by Avaz on 28.11.16.
//  Copyright © 2016 Istore. All rights reserved.
//

#import "APIClient.h"
#import <AFNetworking.h>

static NSString* const keyAPIUrl = @"http://176.126.167.231:3000";

@interface APIClient()
    
@property (nonatomic, strong) AFHTTPSessionManager* manager;
@property (nonatomic, strong) NSArray<ServiceModel*>* services;

@end
@implementation APIClient

- (instancetype)init{
    self = [super init];
    
    if (self)
    {
        self.services = [NSArray new];
        self.manager = [AFHTTPSessionManager manager];
    }
    return self;
}

#pragma mark - GET request
- (void) getServicesWithParameters:(NSDictionary*) param
                           success:(successBlock) successBlock
                             error:(errorB) errorBlock{
    
    
    [self.manager GET:keyAPIUrl
           parameters:param
             progress:NULL
              success:^(NSURLSessionDataTask * task, id responseObject)
     {
         NSError* jsonError = nil;
         NSArray* objects = [responseObject objectForKey:@"objects"];
         NSDictionary* meta = [responseObject objectForKey:@"meta"];
         NSInteger totalCount = (NSInteger)[[meta objectForKey:@"total_count"] integerValue];
         
         _services = [ServiceModel arrayOfModelsFromDictionaries:objects
                                                             error:&jsonError];
         
         if (jsonError == nil)
         {
             successBlock(_services, totalCount, nil);
         }
         else
         {
             errorBlock(jsonError);
         }
     }
              failure:^(NSURLSessionDataTask * task, NSError* error)
     {
         errorBlock(error);
     }];
    
}

@end
