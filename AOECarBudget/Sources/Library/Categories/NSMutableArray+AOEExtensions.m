//
//  NSMutableArray+AOEExtensions.m
//  AOECarBudget
//
//  Created by Alina Okhremenko on 14.11.15.
//  Copyright © 2015 Alina Okhremenko. All rights reserved.
//

#import "NSMutableArray+AOEExtensions.h"

@implementation NSMutableArray (AOEExtensions)

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    id object = [self objectAtIndex:fromIndex];
    [self removeObjectAtIndex:fromIndex];
    [self insertObject:object atIndex:toIndex];
}

@end

