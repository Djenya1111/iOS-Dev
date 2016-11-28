//
//  ServiceModel.h
//  Services
//
//  Created by Avaz on 28.11.16.
//  Copyright © 2016 Istore. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ServiceModel : JSONModel
    @property (nonatomic, strong) NSString* Id;
    
    @property (nonatomic, strong) NSString *category;
    @property (nonatomic, strong) NSString *title;
    @property (nonatomic, strong) NSString<Optional> *descr;
    @property (nonatomic, strong) NSNumber *price;
    
    @property (nonatomic, strong) NSURL<Optional> *featured_image;
    @property (nonatomic, strong) NSURL<Optional> *image1;
    @property (nonatomic, strong) NSURL<Optional> *image2;
    @property (nonatomic, strong) NSURL<Optional> *image3;
    @property (nonatomic, strong) NSURL<Optional> *image4;
    @property (nonatomic, strong) NSURL<Optional> *image5;

@end
