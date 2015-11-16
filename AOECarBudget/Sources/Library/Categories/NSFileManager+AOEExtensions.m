//
//  NSFileManager+AOEExtensions.m
//  AOECarBudget
//
//  Created by Alina Okhremenko on 14.11.15.
//  Copyright © 2015 Alina Okhremenko. All rights reserved.
//

#import "NSFileManager+AOEExtensions.h"

@implementation NSFileManager (AOEExtensions)

+ (NSString *)userDocumentsPath {
    return [self pathWithSearchPathDirectory:NSDocumentDirectory domainMask:NSUserDomainMask];
}

+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)pathDirectory {
    return [self pathWithSearchPathDirectory:pathDirectory domainMask:NSUserDomainMask];
}

+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)pathDirectory
                               domainMask:(NSSearchPathDomainMask)domainMask
{
    return [NSSearchPathForDirectoriesInDomains(pathDirectory, domainMask, YES) firstObject];
}

@end
