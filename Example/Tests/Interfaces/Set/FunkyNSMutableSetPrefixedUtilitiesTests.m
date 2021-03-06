//
//  FunkyNSMutableSetPrefixedUtilitiesTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkySetUtilities.h>
#import <Funky/NSSet+FunkyPrefixedUtilities.h>
#import <Funky/NSSet+FunkyCore.h>
#import <OCMock/OCMock.h>
#import "MockedMutableSetUtilities.h"

@interface FunkyNSMutableSetPrefixedUtilitiesTests : XCTestCase

@end

@implementation FunkyNSMutableSetPrefixedUtilitiesTests
{
    NSMutableSet* set;
}

- (void)setUp {
    [super setUp];
    set = [[NSSet setWithArray:@[@0, @1, @2, @3]] mutableCopy];
    mockedMutableSetUtils = OCMPartialMock([FunkyMutableSetUtilities utilitiesWithObject:(id<FunkyCollection>)set]);
}

- (void)tearDown {
    mockedMutableSetUtils = nil;
    mockedMutableSetUtilsWithClass = nil;
    [super tearDown];
}

- (void)test_union_callsUtilitiesClass
{
    [set funky_takeUnion:[NSSet setWithObject:@1]];
    OCMVerify([mockedMutableSetUtils takeUnion:[OCMArg any]]);
}

- (void)test_minus_callsUtilitiesClass
{
    [set funky_takeMinus:[NSSet setWithObject:@1]];
    OCMVerify([mockedMutableSetUtils takeMinus:[OCMArg any]]);
}

- (void)test_intersect_callsUtilitiesClass
{
    [set funky_takeIntersection:[NSSet setWithObject:@1]];
    OCMVerify([mockedMutableSetUtils takeIntersection:[OCMArg any]]);
}

- (void)test_filter_callsUtilitiesClass
{
    [set funky_filter:^BOOL(id item) {
        return YES;
    }];
    OCMVerify([mockedMutableSetUtils filter:[OCMArg any]]);
}

- (void)test_flatten_callsUtilitiesClass
{
    [set funky_flatten];
    OCMVerify([mockedMutableSetUtils flatten]);
}

- (void)test_capacity_constructor
{
    id result = [NSMutableSet newWithCapacity:1];
    XCTAssertNotNil(result);
}

@end
