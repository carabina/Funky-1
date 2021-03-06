//
//  FunkySort.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "FunkySort.h"

@implementation FunkySort

+ (NSComparator)lexicographicalComparator
{
    return [self propertyComparator:nil];
}

+ (NSComparator)propertyComparator:(FunkySortComparablePropertyProviderBlock)propertyBlock
{
    return ^NSComparisonResult(id obj1, id obj2) {
        id<FunkySortComparable> prop1 = propertyBlock ? propertyBlock(obj1) : obj1;
        id<FunkySortComparable> prop2 = propertyBlock ? propertyBlock(obj2) : obj2;
        
        if ([prop1 isEqual:prop2]) {
            return NSOrderedSame;
        } else if ([prop1 respondsToSelector:@selector(compare:)]) {
            return [prop1 compare:prop2];
        } else {
            return prop1 < prop2 ? NSOrderedAscending : NSOrderedDescending;
        }
    };
}

+ (NSComparator)prioritizedComparator:(NSArray<NSComparator>*)comparators
{
    return ^NSComparisonResult(id obj1, id obj2) {
        for (NSComparator comparator in comparators) {
            NSComparisonResult result = comparator(obj1, obj2);
            if (result != NSOrderedSame) {
                return result;
            }
        }
        return NSOrderedSame;
    };
}

+ (NSComparator)comparatorWithBuckets:(NSArray<FunkySortingBucket*>*)buckets
{
    return [self comparatorWithBuckets:buckets defaultInnerBucketComparator:[self lexicographicalComparator]];
}

+ (NSComparator)comparatorWithBuckets:(NSArray<FunkySortingBucket*>*)buckets defaultInnerBucketComparator:(NSComparator)defaultInnerBucketComparator
{
    NSIndexSet* collectorBuckets = [buckets indexesOfObjectsPassingTest:^BOOL(FunkySortingBucket* bucket, NSUInteger index, BOOL* stop) {
        return bucket.isCollectorBucket;
    }];
    
    NSInteger indexOfCollectorBucket = collectorBuckets.firstIndex;
    if (indexOfCollectorBucket == NSNotFound) {
        indexOfCollectorBucket = buckets.count;
        buckets = [buckets arrayByAddingObject:[FunkySortingBucket bucketWithAllTheRest]];
    }
    
    return ^NSComparisonResult(id obj1, id obj2) {
        NSInteger bucketIndexFor1 = [self indexOfObject:obj1 inBuckets:buckets indexOfCollectorBucket:indexOfCollectorBucket];
        NSInteger bucketIndexFor2 = [self indexOfObject:obj2 inBuckets:buckets indexOfCollectorBucket:indexOfCollectorBucket];
        if (bucketIndexFor1 == bucketIndexFor2) {
            FunkySortingBucket* bucket = [buckets objectAtIndex:bucketIndexFor1];
            NSComparator innerBucketComparator = bucket.innerBucketComparator ?: defaultInnerBucketComparator;
            return innerBucketComparator(obj1, obj2);
        } else {
            return [@(bucketIndexFor1) compare:@(bucketIndexFor2)];
        }
    };
}

+ (NSInteger)indexOfObject:(id)object inBuckets:(NSArray<FunkySortingBucket*>*)buckets indexOfCollectorBucket:(NSInteger)indexOfCollectorBucket
{
    NSInteger index = [buckets indexOfObjectPassingTest:^BOOL(FunkySortingBucket* bucket, NSUInteger idx, BOOL* stop) {
        if (bucket.filterBlock && bucket.filterBlock(object)) {
            *stop = YES;
            return YES;
        } else {
            return NO;
        }
    }];
    return index == NSNotFound ? indexOfCollectorBucket : index;
}

+ (NSComparator)boolComparator:(BOOL(^)(id obj1, id obj2))comparator
{
    return ^NSComparisonResult(id obj1, id obj2) {
        BOOL resultOneWay = comparator(obj1, obj2);
        BOOL resultOtherWay = comparator(obj2, obj1);
        if (resultOneWay && !resultOtherWay) {
            return NSOrderedAscending;
        } else if (resultOtherWay && !resultOneWay) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    };
}

@end
