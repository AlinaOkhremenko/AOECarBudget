//
//  AOEExpenseRecord.h
//  AOECarBudget
//
//  Created by Alina Okhremenko on 10.11.15.
//  Copyright © 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM (NSUInteger, AOEExpensesType) {
    AOEExpensesTypeFuel,
    AOEExpensesTypeInsurance,
    AOEExpensesTypeParking,
    AOEExpensesTypeService,
    AOEExpensesTypeOthers
};
typedef NS_ENUM(NSUInteger, AOECurrencyType) {
    AOECurrencyTypeHryvna
};

@interface AOEExpenseRecord : NSObject <NSCoding>
@property (nonatomic, assign) float             amount;
@property (nonatomic, assign) AOEExpensesType   expensesType;
@property (nonatomic, assign) AOECurrencyType   currency;
@property (nonatomic, strong) NSDate            *timeStamp;

- (id)initWithExpensesType:(AOEExpensesType)expensesType
                    amount:(float)amount
                  currency:(AOECurrencyType)currency;

@end
