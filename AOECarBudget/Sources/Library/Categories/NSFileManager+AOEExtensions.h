//
//  NSFileManager+AOEExtensions.h
//  AOECarBudget
//
//  Created by Alina Okhremenko on 14.11.15.
//  Copyright © 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (AOEExtensions)

+ (NSString *)userDocumentsPath;
+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)pathDirectory;
+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)pathDirectory
                               domainMask:(NSSearchPathDomainMask)domainMask;

@end
