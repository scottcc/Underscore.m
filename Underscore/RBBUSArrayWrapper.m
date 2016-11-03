//
//  RBBUSArrayWrapper.m
//  RBBUnderscore
//
//  Created by Robert Böhnke on 5/13/12.
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

#import "RBBUSArrayWrapper.h"
#import "RBBUSDictionaryWrapper.h"

@interface RBBUSArrayWrapper ()

- initWithArray:(NSArray *)array;

@property (readwrite, retain) NSArray *array;

@end

@implementation RBBUSArrayWrapper

#pragma mark Class methods

+ (RBBUSArrayWrapper *)wrap:(NSArray *)array
{
    return [[RBBUSArrayWrapper alloc] initWithArray:[array copy]];
}

#pragma mark Lifecycle

- (id)init
{
    return [super init];
}

- (id)initWithArray:(NSArray *)array
{
    if (self = [super init]) {
        self.array = array;
    }
    return self;
}

@synthesize array = _array;

- (NSArray *)unwrap
{
    return [self.array copy];
}

#pragma mark RBBUnderscore methods

- (id)first
{
    return self.array.count ? [self.array objectAtIndex:0] : nil;
}

- (id)last
{
    return self.array.lastObject;
}

- (RBBUSArrayWrapper *(^)(NSUInteger))head
{
    return ^RBBUSArrayWrapper *(NSUInteger count) {
        NSRange    range     = NSMakeRange(0, MIN(self.array.count, count));
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        NSArray    *result   = [self.array objectsAtIndexes:indexSet];

        return [[RBBUSArrayWrapper alloc] initWithArray:result];
    };
}

- (RBBUSArrayWrapper *(^)(NSUInteger))tail
{
    return ^RBBUSArrayWrapper *(NSUInteger count) {
        NSRange range;
        if (count > self.array.count) {
            range = NSMakeRange(0, self.array.count);
        } else {
            range = NSMakeRange(self.array.count - count, count);
        }

        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        NSArray    *result   = [self.array objectsAtIndexes:indexSet];

        return [[RBBUSArrayWrapper alloc] initWithArray:result];
    };
}

- (RBBUSArrayWrapper *(^)(NSUInteger))drop
{
    return ^RBBUSArrayWrapper *(NSUInteger count) {
        NSUInteger start     = MIN(count, self.array.count);
        NSRange    range     = NSMakeRange(start, self.array.count - start);
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
        NSArray *result      = [self.array objectsAtIndexes:indexSet];
        return [[RBBUSArrayWrapper alloc] initWithArray:result];
    };
}

- (NSUInteger (^)(id))indexOf
{
    return ^NSUInteger (id obj) {
        return [self.array indexOfObject:obj];
    };
}

- (RBBUSArrayWrapper *)_flatten
{
    __weak NSArray *array = self.array;
    __block NSArray *(^_flatten)(NSArray *) = ^NSArray *(NSArray *input) {
        NSMutableArray *result = [NSMutableArray array];

        for (id obj in input) {
            if ([obj isKindOfClass:[NSArray class]]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
                [result addObjectsFromArray:_flatten(obj)];
#pragma clang diagnostic pop
            } else {
                [result addObject:obj];
            }
        }

        // If the outmost call terminates, nil the reference to _flatten to break
        // the retain cycle
        if (input == array) {
            _flatten = nil;
        }

        return result;
    };

    return [RBBUSArrayWrapper wrap:_flatten(self.array)];
}

- (RBBUSArrayWrapper *(^)(NSArray *))without
{
    return ^RBBUSArrayWrapper *(NSArray *value) {
        return self.reject(^(id obj){
            return [value containsObject:obj];
        });
    };
}

- (RBBUSArrayWrapper *)shuffle
{
    NSMutableArray *result = [self.array mutableCopy];

    u_int32_t max = (u_int32_t)result.count;
    NSAssert(result.count <= INT32_MAX , @"Precision lost in the downcast.");
    for (NSInteger i = result.count - 1; i > 0; i--) {
        [result exchangeObjectAtIndex:arc4random_uniform(max) withObjectAtIndex:i];
    }

    return [[RBBUSArrayWrapper alloc] initWithArray:result];
}

- (id (^)(id, UnderscoreReduceBlock))reduce
{
    return ^RBBUSArrayWrapper *(id memo, UnderscoreReduceBlock function) {
        for (id obj in self.array) {
            memo = function(memo, obj);
        }

        return memo;
    };
}

- (id (^)(id, UnderscoreReduceBlock))reduceRight
{
    return ^RBBUSArrayWrapper *(id memo, UnderscoreReduceBlock function) {
        for (id obj in self.array.reverseObjectEnumerator) {
            memo = function(memo, obj);
        }

        return memo;
    };
}

- (RBBUSArrayWrapper *(^)(UnderscoreArrayIteratorBlock))each
{
    return ^RBBUSArrayWrapper *(UnderscoreArrayIteratorBlock block) {
        for (id obj in self.array) {
            block(obj);
        }

        return self;
    };
}

- (RBBUSArrayWrapper *(^)(UnderscoreArrayMapBlock))map
{
    return ^RBBUSArrayWrapper *(UnderscoreArrayMapBlock block) {
        NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.array.count];

        for (id obj in self.array) {
            id mapped = block(obj);

            if (mapped) {
                [result addObject:mapped];
            }
        }

        return [[RBBUSArrayWrapper alloc] initWithArray:result];
    };
}

- (RBBUSArrayWrapper *(^)(UnderscoreIndexedArrayMapBlock))indexedMap
{
    return ^RBBUSArrayWrapper *(UnderscoreIndexedArrayMapBlock block) {
        NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.array.count];

        [self.array enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            id mapped = block(obj, idx);

            if (mapped) {
                [result addObject:mapped];
            }
        }];

        return [[RBBUSArrayWrapper alloc] initWithArray:result];
    };
}

- (RBBUSArrayWrapper *(^)(NSArray *array, UnderscoreArrayZipWithBlock block))zipWith
{
    return ^RBBUSArrayWrapper *(NSArray *array, UnderscoreArrayZipWithBlock block) {
        NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.array.count];
        if(self.array.count <= array.count) {
            [self.array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [result addObject:block(obj, array[idx])];
            }];
        } else {
            [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [result addObject:block(self.array[idx], obj)]; 
            }];
        }
        return [[RBBUSArrayWrapper alloc] initWithArray:result];
    };
}

- (RBBUSArrayWrapper *(^)(NSString *))pluck
{
    return ^RBBUSArrayWrapper *(NSString *keyPath) {
        return self.map(^id (id obj) {
            return [obj valueForKeyPath:keyPath];
        });
    };
}

- (RBBUSArrayWrapper *)uniq
{
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:self.array];

    return [[RBBUSArrayWrapper alloc] initWithArray:[set array]];
}

- (id (^)(UnderscoreTestBlock))find
{
    return ^id (UnderscoreTestBlock test) {
        for (id obj in self.array) {
            if (test(obj)) {
                return obj;
            }
        }

        return nil;
    };
}

- (RBBUSArrayWrapper *(^)(UnderscoreTestBlock))filter
{
    return ^RBBUSArrayWrapper *(UnderscoreTestBlock test) {
        return self.map(^id (id obj) {
            return test(obj) ? obj : nil;
        });
    };
}

- (RBBUSArrayWrapper *(^)(UnderscoreTestBlock))reject
{
    return ^RBBUSArrayWrapper *(UnderscoreTestBlock test) {
        return self.filter(RBBUnderscore.negate(test));
    };
}

- (BOOL (^)(UnderscoreTestBlock))all
{
    return ^BOOL (UnderscoreTestBlock test) {
        if (self.array.count == 0) {
            return NO;
        }

        BOOL result = YES;

        for (id obj in self.array) {
            if (!test(obj)) {
                return NO;
            }
        }

        return result;
    };
}

- (BOOL (^)(UnderscoreTestBlock))any
{
    return ^BOOL (UnderscoreTestBlock test) {
        BOOL result = NO;

        for (id obj in self.array) {
            if (test(obj)) {
                return YES;
            }
        }

        return result;
    };
}

- (RBBUSArrayWrapper *(^)(UnderscoreSortBlock))sort
{
    return ^RBBUSArrayWrapper *(UnderscoreSortBlock block) {
        NSArray *result = [self.array sortedArrayUsingComparator:block];
        return [[RBBUSArrayWrapper alloc] initWithArray:result];
    };
}

- (RBBUSDictionaryWrapper *(^)(UnderscoreGroupingBlock))groupBy
{
    return ^RBBUSDictionaryWrapper *(UnderscoreGroupingBlock block) {
        NSMutableDictionary *result = [NSMutableDictionary dictionary];
        
        for(id obj in self.array) {
            id<NSCopying> groupIdentifier = block(obj);
            NSArray *groupContents = result[groupIdentifier] ?: @[];
            groupContents = [groupContents arrayByAddingObject:obj];
            result[groupIdentifier] = groupContents;
        }
        
        return [RBBUSDictionaryWrapper wrap:result];
    };
}

@end
