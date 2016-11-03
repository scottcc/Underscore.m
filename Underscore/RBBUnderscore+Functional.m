//
//  RBBUnderscore+Functional.m
//  RBBUnderscore
//
//  Created by Robert Böhnke on 7/15/12.
//  Copyright (c) 2012 Robert Böhnke. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//

#import "RBBUnderscore+Functional.h"

@implementation RBBUnderscore (Functional)

#pragma mark -
#pragma mark NSArray shortcuts

+ (RBBUSArrayWrapper *(^)(NSArray *))array
{
    return ^(NSArray *array) {
        return [RBBUSArrayWrapper wrap:array];
    };
}

+ (id (^)(NSArray *))first
{
    return ^(NSArray *array) {
        return RBBUnderscore.array(array).first;
    };
}

+ (id (^)(NSArray *))last
{
    return ^(NSArray *array) {
        return RBBUnderscore.array(array).last;
    };
}

+ (NSArray *(^)(NSArray *, NSUInteger))head
{
    return ^(NSArray *array, NSUInteger n) {
        return RBBUnderscore.array(array).head(n).unwrap;
    };
}

+ (NSArray *(^)(NSArray *, NSUInteger))tail
{
    return ^(NSArray *array, NSUInteger n) {
        return RBBUnderscore.array(array).tail(n).unwrap;
    };
}

+ (NSArray *(^)(NSArray *, NSUInteger))drop
{
    return ^(NSArray *array, NSUInteger n) {
        return RBBUnderscore.array(array).drop(n).unwrap;
    };
}

+ (NSUInteger (^)(NSArray *, id))indexOf
{
    return ^(NSArray *array, id obj) {
        return RBBUnderscore.array(array).indexOf(obj);
    };
}

+ (NSArray *(^)(NSArray *))_flatten
{
    return ^(NSArray *array) {
        return RBBUnderscore.array(array)._flatten.unwrap;
    };
}

+ (NSArray *(^)(NSArray *))uniq
{
    return ^(NSArray *array) {
        return RBBUnderscore.array(array).uniq.unwrap;
    };
}

+ (NSArray *(^)(NSArray *, NSArray *))without
{
    return ^(NSArray *array, NSArray *values) {
        return RBBUnderscore.array(array).without(values).unwrap;
    };
}

+ (NSArray *(^)(NSArray *))shuffle
{
    return ^(NSArray *array) {
        return RBBUnderscore.array(array).shuffle.unwrap;
    };
}

+(id (^)(NSArray *, id, UnderscoreReduceBlock))reduce
{
    return ^(NSArray *array, id memo, UnderscoreReduceBlock block) {
        return RBBUnderscore.array(array).reduce(memo, block);
    };
}

+ (id (^)(NSArray *, id, UnderscoreReduceBlock))reduceRight
{
    return ^(NSArray *array, id memo, UnderscoreReduceBlock block) {
        return RBBUnderscore.array(array).reduceRight(memo, block);
    };
}

+ (void (^)(NSArray *, UnderscoreArrayIteratorBlock))arrayEach
{
    return ^(NSArray *array, UnderscoreArrayIteratorBlock block) {
        RBBUnderscore.array(array).each(block);
    };
}

+ (NSArray *(^)(NSArray *array, UnderscoreArrayMapBlock block))arrayMap
{
    return ^(NSArray *array, UnderscoreArrayMapBlock block) {
        return RBBUnderscore.array(array).map(block).unwrap;
    };
}

+ (NSArray *(^)(NSArray *array, UnderscoreIndexedArrayMapBlock block))arrayIndexedMap
{
    return ^(NSArray *array, UnderscoreIndexedArrayMapBlock block) {
        return RBBUnderscore.array(array).indexedMap(block).unwrap;
    };
}

+ (NSArray *(^)(NSArray *firstArray, NSArray *secondArray, UnderscoreArrayZipWithBlock block))arrayZipWith
{
    return ^(NSArray *firstArray, NSArray *secondArray, UnderscoreArrayZipWithBlock block) {
        return RBBUnderscore.array(firstArray).zipWith(secondArray, block).unwrap;
    };
}

+ (NSArray *(^)(NSArray *, NSString *))pluck
{
    return ^(NSArray *array, NSString *keyPath) {
        return RBBUnderscore.array(array).pluck(keyPath).unwrap;
    };
}

+ (id (^)(NSArray *, UnderscoreTestBlock))find
{
    return ^(NSArray *array, UnderscoreTestBlock block) {
        return RBBUnderscore.array(array).find(block);
    };
}

+ (NSArray *(^)(NSArray *, UnderscoreTestBlock))filter
{
    return ^(NSArray *array, UnderscoreTestBlock block) {
        return RBBUnderscore.array(array).filter(block).unwrap;
    };
}
+ (NSArray *(^)(NSArray *, UnderscoreTestBlock))reject
{
    return ^(NSArray *array, UnderscoreTestBlock block) {
        return RBBUnderscore.array(array).reject(block).unwrap;
    };
}

+ (BOOL (^)(NSArray *, UnderscoreTestBlock))all
{
    return ^(NSArray *array, UnderscoreTestBlock block) {
        return RBBUnderscore.array(array).all(block);
    };
}
+ (BOOL (^)(NSArray *, UnderscoreTestBlock))any
{
    return ^(NSArray *array, UnderscoreTestBlock block) {
        return RBBUnderscore.array(array).any(block);
    };
}

+ (NSArray *(^)(NSArray *, UnderscoreSortBlock))sort
{
    return ^(NSArray *array, UnderscoreSortBlock block) {
        return RBBUnderscore.array(array).sort(block).unwrap;
    };
}

+ (NSDictionary *(^)(NSArray *, UnderscoreGroupingBlock))groupBy
{
    return ^(NSArray *array, UnderscoreGroupingBlock block) {
        return RBBUnderscore.array(array).groupBy(block).unwrap;
    };
}

#pragma mark -
#pragma mark NSDictionary shortcuts

+ (RBBUSDictionaryWrapper *(^)(NSDictionary *))dict
{
    return ^(NSDictionary *dictionary) {
        return [RBBUSDictionaryWrapper wrap:dictionary];
    };
}

+ (NSArray *(^)(NSDictionary *))keys
{
    return ^(NSDictionary *dictionary) {
        return [RBBUSDictionaryWrapper wrap:dictionary].keys.unwrap;
    };
}
+ (NSArray *(^)(NSDictionary *))values
{
    return ^(NSDictionary *dictionary) {
        return [RBBUSDictionaryWrapper wrap:dictionary].values.unwrap;
    };
}

+ (void (^)(NSDictionary *, UnderscoreDictionaryIteratorBlock))dictEach
{
    return ^(NSDictionary *dictionary, UnderscoreDictionaryIteratorBlock block) {
        RBBUnderscore.dict(dictionary).each(block);
    };
}

+ (NSDictionary *(^)(NSDictionary *, UnderscoreDictionaryMapBlock))dictMap
{
    return ^(NSDictionary *dictionary, UnderscoreDictionaryMapBlock block) {
        return RBBUnderscore.dict(dictionary).map(block).unwrap;
    };
}

+ (NSDictionary *(^)(NSDictionary *, NSArray *))pick
{
    return ^(NSDictionary *dictionary, NSArray *keys) {
        return [RBBUSDictionaryWrapper wrap:dictionary].pick(keys).unwrap;
    };
}

+ (NSDictionary *(^)(NSDictionary *, NSDictionary *))extend
{
    return ^(NSDictionary *dictionary, NSDictionary *source) {
        return [RBBUSDictionaryWrapper wrap:dictionary].extend(source).unwrap;
    };
}
+ (NSDictionary *(^)(NSDictionary *, NSDictionary *))defaults
{
    return ^(NSDictionary *dictionary, NSDictionary *defaults) {
        return [RBBUSDictionaryWrapper wrap:dictionary].defaults(defaults).unwrap;
    };
}

+ (NSDictionary *(^)(NSDictionary *, UnderscoreTestBlock))filterKeys
{
    return ^(NSDictionary *dictionary, UnderscoreTestBlock block) {
        return [RBBUSDictionaryWrapper wrap:dictionary].filterKeys(block).unwrap;
    };
}
+ (NSDictionary *(^)(NSDictionary *, UnderscoreTestBlock))filterValues
{
    return ^(NSDictionary *dictionary, UnderscoreTestBlock block) {
        return [RBBUSDictionaryWrapper wrap:dictionary].filterValues(block).unwrap;
    };
}

+ (NSDictionary *(^)(NSDictionary *, UnderscoreTestBlock))rejectKeys
{
    return ^(NSDictionary *dictionary, UnderscoreTestBlock block) {
        return [RBBUSDictionaryWrapper wrap:dictionary].rejectKeys(block).unwrap;
    };
}

+ (NSDictionary *(^)(NSDictionary *, UnderscoreTestBlock))rejectValues
{
    return ^(NSDictionary *dictionary, UnderscoreTestBlock block) {
        return [RBBUSDictionaryWrapper wrap:dictionary].rejectValues(block).unwrap;
    };
}

@end
