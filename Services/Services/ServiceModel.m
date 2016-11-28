//
//  ServiceModel.m
//  Services
//
//  Created by Avaz on 28.11.16.
//  Copyright © 2016 Istore. All rights reserved.
//

#import "ServiceModel.h"

@implementation ServiceModel

+ (JSONKeyMapper *) keyMapper
    {
        return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                           @"description": @"descr",
                                                           @"id" : @"Id"
                                                           }];
    }

@end
