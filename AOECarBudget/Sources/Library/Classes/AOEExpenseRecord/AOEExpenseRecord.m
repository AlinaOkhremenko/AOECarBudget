//
//  AOEExpenseRecord.m
//  AOECarBudget
//
//  Created by Alina Okhremenko on 10.11.15.
//  Copyright © 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEExpenseRecord.h"
static NSString * const kAOEKeyExpensesType =  @"kAOEKeyExpensesType";
static NSString * const kAOEKeyAmount       =  @"kAOEKeyAmount";
static NSString * const kAOEKeyCurrency     =  @"kAOEKeyCurrency";
static NSString * const kAOEKeyTimeStamp    =  @"kAOEKeyTimeStamp";

@implementation AOEExpenseRecord

#pragma mark -
#pragma mark Initializations

- (id)initWithExpensesType:(AOEExpensesType)expensesType
                    amount:(float)amount
                  currency:(AOECurrencyType)currency
{
    self = [super init];
    if (self) {
        self.expensesType = expensesType;
        self.amount = amount;
        self.currency = currency;
        self.timeStamp = []
    }
    
    return self;
}

#pragma mark -
#pragma mark NSCoding protocol methods

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.expensesType = [decoder decodeIntegerForKey:kAOEKeyExpensesType];
        self.amount = [decoder decodeFloatForKey:kAOEKeyAmount];
        self.currency = [decoder decodeIntegerForKey:kAOEKeyCurrency];
        self.timeStamp = [decoder decodeObjectForKey:kAOEKeyTimeStamp];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeInteger:self.expensesType forKey:kAOEKeyExpensesType];
    [coder encodeFloat:self.amount forKey:kAOEKeyAmount];
    [coder encodeInteger:self.currency forKey:kAOEKeyCurrency];
    [coder encodeObject:self.timeStamp forKey:kAOEKeyTimeStamp];
}


@end
