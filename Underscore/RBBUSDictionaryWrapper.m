//
//  RBBUSDictionaryWrapper.m
//  RBBUnderscore
//
//  Created by Robert Böhnke on 5/14/12.
//  Copyright (C) 2012 Robert Böhnke
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

#import "RBBUnderscore.h"

#import "RBBUSDictionaryWrapper.h"

@interface RBBUSDictionaryWrapper ()

- initWithDictionary:(NSDictionary *)dictionary;

@property (readwrite, retain) NSDictionary *dictionary;

@end

@implementation RBBUSDictionaryWrapper

#pragma mark Class methods

+ (RBBUSDictionaryWrapper *)wrap:(NSDictionary *)dictionary
{
    return [[RBBUSDictionaryWrapper alloc] initWithDictionary:[dictionary copy]];
}

#pragma mark Lifecycle

- (id)init
{
    return [super init];
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.dictionary = dictionary;
    }
    return self;
}

- (NSDictionary *)unwrap
{
    return [self.dictionary copy];
}

#pragma mark RBBUnderscore methods

- (RBBUSArrayWrapper *)keys
{
    return [RBBUSArrayWrapper wrap:self.dictionary.allKeys];
}

- (RBBUSArrayWrapper *)values
{
    return [RBBUSArrayWrapper wrap:self.dictionary.allValues];
}

- (RBBUSDictionaryWrapper *(^)(UnderscoreDictionaryIteratorBlock))each
{
    return ^RBBUSDictionaryWrapper *(UnderscoreDictionaryIteratorBlock block) {
        [self.dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            block(key, obj);
        }];

        return self;
    };
}

- (RBBUSDictionaryWrapper *(^)(UnderscoreDictionaryMapBlock))map
{
    return ^RBBUSDictionaryWrapper *(UnderscoreDictionaryMapBlock block) {
        NSMutableDictionary *result = [NSMutableDictionary dictionary];
        [self.dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            id mapped = block(key, obj);
            if (mapped) {
                result[key] = mapped;
            }
        }];

        return [[RBBUSDictionaryWrapper alloc] initWithDictionary:result];
    };
}

- (RBBUSDictionaryWrapper *(^)(NSArray *))pick
{
    return ^RBBUSDictionaryWrapper *(NSArray *keys) {
        __block NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:keys.count];

        [self.dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            if ([keys containsObject:key]) {
                result[key] = obj;
            }
        }];

        return [[RBBUSDictionaryWrapper alloc] initWithDictionary:result];
    };
}

- (RBBUSDictionaryWrapper *(^)(NSDictionary *))extend
{
    return ^RBBUSDictionaryWrapper *(NSDictionary *source) {
        __block NSMutableDictionary *result = [self.dictionary mutableCopy];

        [source enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            result[key] = obj;
        }];

        return [[RBBUSDictionaryWrapper alloc] initWithDictionary:result];
    };
}

- (RBBUSDictionaryWrapper *(^)(NSDictionary *))defaults
{
    return ^RBBUSDictionaryWrapper *(NSDictionary *source) {
        __block NSMutableDictionary *result = [self.dictionary mutableCopy];

        [source enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            if (![result valueForKey:key]) {
                result[key] = obj;
            }
        }];

        return [[RBBUSDictionaryWrapper alloc] initWithDictionary:result];
    };
}

- (RBBUSDictionaryWrapper *(^)(UnderscoreTestBlock))filterKeys
{
    return ^RBBUSDictionaryWrapper *(UnderscoreTestBlock test) {
        return self.map(^id (id key, id obj) {
            return test(key) ? obj : nil;
        });
    };
}

- (RBBUSDictionaryWrapper *(^)(UnderscoreTestBlock))filterValues
{
    return ^RBBUSDictionaryWrapper *(UnderscoreTestBlock test) {
        return self.map(^id (id key, id obj) {
            return test(obj) ? obj : nil;
        });
    };
}

- (RBBUSDictionaryWrapper *(^)(UnderscoreTestBlock))rejectKeys
{
    return ^RBBUSDictionaryWrapper *(UnderscoreTestBlock test) {
        return self.filterKeys(RBBUnderscore.negate(test));
    };
}

- (RBBUSDictionaryWrapper *(^)(UnderscoreTestBlock))rejectValues
{
    return ^RBBUSDictionaryWrapper *(UnderscoreTestBlock test) {
        return self.filterValues(RBBUnderscore.negate(test));
    };
}

@end
