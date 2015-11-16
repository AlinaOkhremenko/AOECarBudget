//
//  AOECarModel.h
//  AOECarBudget
//
//  Created by Alina Okhremenko on 10.11.15.
//  Copyright © 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "AOEArrayModel.h"

@class AOEExpenseRecord;
@class AOEImageModel;

@interface AOECarModel : AOEArrayModel <NSCoding>
@property (nonatomic, strong) AOEImageModel *contentImageModel;
@property (nonatomic, copy)   NSString      *name;
@property (nonatomic, copy)   NSString      *model;

- (void)addExpence:(AOEExpenseRecord *)expence;
- (void)removeExpence:(AOEExpenseRecord *)expence;

- (void)save;
@end
