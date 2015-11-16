//
//  AOECarModel.m
//  AOECarBudget
//
//  Created by Alina Okhremenko on 10.11.15.
//  Copyright © 2015 Alina Okhremenko. All rights reserved.
//

#import "AOECarModel.h"

#import "AOEArrayModel.h"
#import "AOEImageModel.h"

#import "NSFileManager+AOEExtensions.h"

static NSString * const kAOEKeyName          =  @"kAOEKeyName";
static NSString * const kAOEKeyImageModel    =  @"kAOEKeyImageModel";
static NSString * const kAOEKeyModel         =  @"kAOEKeyModel";
static NSString * const kAOEKeyExpenxesArray =  @"kAOEKeyExpenxesArray";
static  NSString * const kAOEfileName        =  @"AOECarModel.plist";

@interface AOECarModel ()
@property (nonatomic, readonly)                  NSString   *fileName;
@property (nonatomic, readonly)                  NSString   *fileFolder;
@property (nonatomic, readonly)                  NSString   *filePath;
@property (nonatomic, assign, getter=isCached)   BOOL       cached;
@property (nonatomic, strong)                    NSArray    *notificationNames;

@property (nonatomic, strong) NSMutableArray *expencesArray;

- (void)subscribeToApplicationNotifications:(NSArray *)notificationNames;
- (void)unsubscribeFromApplicationNotifications:(NSArray *)notificationNames;
- (void)saveWithNotification:(id)notification;

@end

@implementation AOECarModel

@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;
@dynamic cached;
@dynamic notificationNames;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self unsubscribeFromApplicationNotifications:self.notificationNames];
}

- (id)initWithName:(NSString *)name model:(NSString *)model {
    self = [super init];
    if (self) {
        self.name = name;
        self.model = model;
        self.contentImageModel = [AOEImageModel init];
        self.expencesArray = [NSMutableArray init];
        
        [self subscribeToApplicationNotifications:self.notificationNames];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors
- (NSString *)fileName {
    return kAOEfileName;
}

- (NSString *)fileFolder {
    return [NSFileManager userDocumentsPath];
}

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

- (NSArray *)notificationNames {
    return @[UIApplicationDidEnterBackgroundNotification, UIApplicationWillTerminateNotification];
}


#pragma mark -
#pragma mark Public Methods

- (void)addExpence:(AOEExpenseRecord *)expence {
    if (expence) {
        [self.expencesArray addObject:expence];
    }
}

- (void)removeExpence:(AOEExpenseRecord *)expence {
    if (expence) {
        [self.expencesArray removeObject:expence];
    }
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.array toFile:self.filePath];
}

#pragma mark -
#pragma mark Private Methods

- (void)subscribeToApplicationNotifications:(NSArray *)notificationNames {
    for (NSString *notification in notificationNames) {
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(saveWithNotification:)
                                                    name:notification
                                                  object:nil];
    }
}

- (void)unsubscribeFromApplicationNotifications:(NSArray *)notificationNames {
    for (NSString *notification in notificationNames) {
        [[NSNotificationCenter defaultCenter]removeObserver:self
                                                       name:notification
                                                     object:nil];
    }
}

- (void)saveWithNotification:(id)notification {
    [self save];
}

#pragma mark -
#pragma mark NSCoding protocol implementation

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.name = [decoder decodeObjectForKey:kAOEKeyName];
        self.model = [decoder decodeObjectForKey:kAOEKeyModel];
        self.contentImageModel = [decoder decodeObjectForKey:kAOEKeyImageModel];
        self.expencesArray = [decoder decodeObjectForKey:kAOEKeyExpenxesArray];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:kAOEKeyName];
    [coder encodeObject:self.model forKey:kAOEKeyModel];
    [coder encodeObject:self.contentImageModel forKey:kAOEKeyImageModel];
    [coder encodeObject:self.expencesArray forKey:kAOEKeyExpenxesArray];
}

@end
