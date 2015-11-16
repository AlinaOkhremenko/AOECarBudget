//
//  AOSubject.m
//  ObjectiveC
//
//  Created by Alina Okhremenko on 03.08.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOObservable.h"

@interface AOEObservable ()
@property (nonatomic, strong)    NSHashTable        *mutableObservers;
@property (nonatomic, assign)    BOOL               shouldNotify;

- (void)performBlock:(void(^)(void))block shouldNotify:(BOOL)shouldNotify;

@end

@implementation AOEObservable

#pragma mark -
#pragma mark Initialization Methods

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [NSHashTable weakObjectsHashTable];
        self.shouldNotify = YES;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(NSUInteger)state {
    [self setState:state withObject:nil];
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized(self) {
        if (_state != state) {
            _state = state;
        }
        if (self.shouldNotify) {
            [self notifyObserversWithSelector:[self selectorForState:state] withObject:object];
        }
    }
}

- (NSArray *)observers {
    return [self.mutableObservers allObjects];
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
    [self.mutableObservers addObject:observer];
}
- (void)removeObserver:(id)observer {
    [self.mutableObservers removeObject:observer];
}

- (BOOL)containsObserver:(id)observer {
    return [self.mutableObservers containsObject:observer];
}

- (SEL)selectorForState:(NSUInteger)state {
    return nil;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

- (void)notifyObserversWithSelector:(SEL)selector {
    [self notifyObserversWithSelector:selector withObject:nil];
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    for (id observer in self.mutableObservers) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self withObject:object];
        }
    }
}

#pragma clang diagnostic pop

- (void)performBlockWithoutNotification:(void(^)(void))block {
    [self performBlock:block shouldNotify:NO];
}

- (void)performBlockWithNotification:(void(^)(void))block {
    [self performBlock:block shouldNotify:YES];
}

- (void)performBlock:(void(^)(void))block shouldNotify:(BOOL)shouldNotify {
    @synchronized(self) {
        BOOL currentNotifyingState = self.shouldNotify;
        self.shouldNotify = shouldNotify;
        if (block) {
            block();
        }
        
        self.shouldNotify = currentNotifyingState;
    }
}

@end
