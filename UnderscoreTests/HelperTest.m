//
//  HelperTest.m
//  RBBUnderscore
//
//  Created by Robert Böhnke on 5/14/12.
//  Copyright (c) 2012 Robert Böhnke. All rights reserved.
//

#import "HelperTest.h"

#import "RBBUnderscore.h"

@implementation HelperTest

- (void)testNegate
{
    UnderscoreTestBlock yesBlock = ^BOOL (id obj) { return YES; };
    XCTAssertFalse(RBBUnderscore.negate(yesBlock)(nil), @"Can negate block");
    UnderscoreTestBlock noBlock = ^BOOL (id obj) { return NO; };
    XCTAssertTrue(RBBUnderscore.negate(noBlock)(nil), @"Can negate block");
}

- (void)testIsEqual
{
    XCTAssertTrue(RBBUnderscore.isEqual(@"foo")(@"foo"), @"Performs equality check");
    XCTAssertFalse(RBBUnderscore.isEqual(@"foo")(@"bar"), @"Performs equality check");
}

- (void)testIsArray
{
    XCTAssertTrue(RBBUnderscore.isArray([NSArray array]), @"Returns true for NSArray");
    XCTAssertFalse(RBBUnderscore.isArray([[NSObject alloc] init]), @"Returns false for NSObject");
}

- (void)testIsBool
{
    XCTAssertTrue(RBBUnderscore.isBool([NSNumber numberWithBool:YES]), @"Returns true for NSNumber with BOOL: YES");
    XCTAssertTrue(RBBUnderscore.isBool([NSNumber numberWithBool:NO]),  @"Returns true for NSNumber with BOOL: NO");
    XCTAssertFalse(RBBUnderscore.isBool([NSNumber numberWithInteger:42]), @"Returns false for NSNumber");
    XCTAssertFalse(RBBUnderscore.isBool([[NSObject alloc] init]),         @"Returns false for NSObject");
    XCTAssertFalse(RBBUnderscore.isBool([NSNumber numberWithInt:1]), @"Returns false for NSNumber with int: 1, as its type is int, not BOOL");
    XCTAssertFalse(RBBUnderscore.isBool([NSNumber numberWithInt:0]), @"Returns false for NSNumber with int: 0, as its type is int, not BOOL");
}

- (void)testIsDictionary
{
    XCTAssertTrue(RBBUnderscore.isDictionary([NSDictionary dictionary]), @"Returns true for NSDictionary");
    XCTAssertFalse(RBBUnderscore.isDictionary([[NSObject alloc] init]), @"Returns false for NSObject");
}

- (void)testIsNull
{
    XCTAssertTrue(RBBUnderscore.isNull([NSNull null]), @"Returns true for NSNull");
    XCTAssertFalse(RBBUnderscore.isNull([[NSObject alloc] init]), @"Returns false for NSObject");
}

- (void)testIsNumber
{
    XCTAssertTrue(RBBUnderscore.isNumber([NSNumber numberWithInteger:12]), @"Returns true for NSNumber");
    XCTAssertFalse(RBBUnderscore.isNumber([[NSObject alloc] init]), @"Returns false for NSObject");
}

- (void)testIsString
{
    XCTAssertTrue(RBBUnderscore.isString(@"hooray!"), @"Returns true for NSString");
    XCTAssertFalse(RBBUnderscore.isString([[NSObject alloc] init]), @"Returns false for NSObject");
}

- (void)testCompare
{
    XCTAssertEqual(RBBUnderscore.compare(@"a", @"b"), NSOrderedAscending,  @"Can compare correctly");
    XCTAssertEqual(RBBUnderscore.compare(@"a", @"a"), NSOrderedSame,       @"Can compare correctly");
    XCTAssertEqual(RBBUnderscore.compare(@"b", @"a"), NSOrderedDescending, @"Can compare correctly");
    XCTAssertThrows(RBBUnderscore.compare(@{}, @{}),
                   @"Comparing objects that don't respond to compare: throws an exception");
}

- (void)testIsEmpty
{
    XCTAssertTrue(RBBUnderscore.isEmpty(@""), @"Returns true for empty strings");
    XCTAssertTrue(RBBUnderscore.isEmpty(@[]), @"Returns true for empty arrays");
    XCTAssertTrue(RBBUnderscore.isEmpty(@{}), @"Returns true for empty dictionaries");
    XCTAssertFalse(RBBUnderscore.isEmpty(@"1"), @"Returns false for non-empty strings");
    XCTAssertFalse(RBBUnderscore.isEmpty(@[ @2 ]), @"Returns false for non-empty arrays");
    XCTAssertFalse(RBBUnderscore.isEmpty(@{ @3: @4 }), @"Returns false for non-empty dictionaries");
}

@end
