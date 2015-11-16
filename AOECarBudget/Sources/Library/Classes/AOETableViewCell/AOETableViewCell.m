//
//  AOETableViewCell.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 06.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOETableViewCell.h"

@implementation AOETableViewCell

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

@end
