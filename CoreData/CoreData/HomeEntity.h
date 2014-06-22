//
//  HomeEntity.h
//  CoreData
//
//  Created by Ken Ko on 6/21/14.
//  Copyright (c) 2014 Ken Ko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface HomeEntity : NSManagedObject

@property (nonatomic, retain) NSString * zipcode;
@property (nonatomic, retain) NSManagedObject *resident;

@end
