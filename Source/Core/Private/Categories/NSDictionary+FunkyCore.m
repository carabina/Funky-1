//
//  NSDictionary+FunkyCore.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 29..
//
//

#import "NSDictionary+FunkyCore.h"

@implementation NSDictionary (FunkyCore)

- (FunkyDictionaryUtilities*)utilities
{
    return [FunkyDictionaryUtilities utilitiesWithObject:self];
}

#pragma mark - FunkyCollectionCounterpart

+ (Class)classForImmutableCounterPart
{
    return [NSDictionary class];
}

+ (Class)classForMutableCounterPart
{
    return [NSMutableDictionary class];
}

+ (Class)classToFlatten
{
    return [NSDictionary class];
}

@end

@implementation NSMutableDictionary (FunkyCore)

#pragma mark - FunkyMutableCollectionWithCapacity

+ (id)newWithCapacity:(NSUInteger)capacity
{
    return [self dictionaryWithCapacity:capacity];
}

#pragma mark - Utilities

- (FunkyMutableDictionaryUtilities*)utilities
{
    return [FunkyMutableDictionaryUtilities utilitiesWithObject:self];
}

@end
