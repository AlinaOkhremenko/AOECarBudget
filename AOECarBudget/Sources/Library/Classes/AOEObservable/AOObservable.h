//
//  AOSubject.h
//  ObjectiveC
//
//  Created by Alina Okhremenko on 03.08.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AOEObservable : NSObject
@property (nonatomic, readonly)  NSArray     *observers;
@property (nonatomic)            NSUInteger  state;

- (void)setState:(NSUInteger)state withObject:(id)object;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)containsObserver:(id)observer;

- (SEL)selectorForState:(NSUInteger)state;

- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;

- (void)performBlockWithNotification:(void(^)(void))block;
- (void)performBlockWithoutNotification:(void(^)(void))block;

@end
