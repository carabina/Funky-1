//
//  FunkyCollection.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkyMutableCollectionWithCapacityProtocol.h"

@protocol FunkyMutableCollection;

@protocol FunkyCollection <NSFastEnumeration, FunkyCollectionCounterpart>

- (NSInteger)count;
- (id<FunkyCollection>)copy;
- (id<FunkyMutableCollection>)mutableCopy;

@end

@protocol FunkyMutableCollection <FunkyCollection, FunkyMutableCollectionWithCapacity>

- (void)addObject:(id)object;
- (void)removeAllObjects;

@end