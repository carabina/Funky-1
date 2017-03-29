//
//  LTArrayUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "LTCollectionUtilities.h"
#import "LTFilterPredicateProtocol.h"

@interface LTArrayUtilities : LTCollectionUtilities

- (NSUInteger)firstIndex;
- (NSUInteger)lastIndex;

- (NSArray*)mapWithIndex:(id(^)(NSUInteger index, id item))block;
- (NSArray*)flatMapWithIndex:(id(^)(NSUInteger index, id item))block;

- (id)first:(BOOL(^)(id item))block;
- (NSUInteger)firstIndex:(BOOL(^)(id item))block;
- (id)last:(BOOL(^)(id item))block;
- (NSUInteger)lastIndex:(BOOL(^)(id item))block;

- (NSArray*)take:(BOOL(^)(id item))block;
- (NSArray*)takeLast:(BOOL(^)(id item))block;

- (NSArray*)fromValueExclusive:(id)value;
- (NSArray*)fromValueInclusive:(id)value;
- (NSArray*)fromIndexExclusive:(NSInteger)index;
- (NSArray*)fromIndexInclusive:(NSInteger)index;

- (NSArray*)untilValueExclusive:(id)value;
- (NSArray*)untilValueInclusive:(id)value;
- (NSArray*)untilIndexExclusive:(NSInteger)index;
- (NSArray*)untilIndexInclusive:(NSInteger)index;

- (NSArray*)fromValueExclusive:(id)from untilValueExclusive:(id)until;
- (NSArray*)fromValueExclusive:(id)from untilValueInclusive:(id)until;
- (NSArray*)fromValueInclusive:(id)from untilValueExclusive:(id)until;
- (NSArray*)fromValueInclusive:(id)from untilValueInclusive:(id)until;

- (NSArray*)fromIndexExclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;
- (NSArray*)fromIndexExclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;
- (NSArray*)fromIndexInclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;
- (NSArray*)fromIndexInclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;

- (void)forEachWithIndex:(void(^)(NSUInteger index, id item))block;

- (NSArray*)unique;
- (NSArray*)reversed;
- (NSArray*)shuffled;

+ (NSArray*)arrayWithItem:(id)item repeated:(NSUInteger)repeat;
+ (NSArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSArray* array))block repeated:(NSUInteger)repeat;
+ (NSArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSArray* array))block until:(BOOL(^)(NSArray* array))until;

@end