//
//  APIClient.h
//  Services
//
//  Created by Avaz on 28.11.16.
//  Copyright © 2016 Istore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceModel.h"

typedef void(^successBlock)(NSArray<ServiceModel*>* result, NSInteger count, NSString* nextPage);
typedef void(^errorB)(NSError* error);

@interface APIClient : NSObject
    
- (void) getServicesWithParameters:(NSDictionary*) param
                           success:(successBlock) successBlock
                             error:(errorB) errorBlock;
@end
