//
//  RBBUSArrayWrapper.h
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

#import <Foundation/Foundation.h>

#import "RBBUSConstants.h"

@class RBBUSDictionaryWrapper;

@interface RBBUSArrayWrapper : NSObject

+ (RBBUSArrayWrapper *)wrap:(NSArray *)array;

- (id)init __attribute__((deprecated("You should RBBUnderscore.array() instead")));

@property (readonly) NSArray *unwrap;

@property (readonly) id first;
@property (readonly) id last;

@property (readonly) RBBUSArrayWrapper *(^head)(NSUInteger n);
@property (readonly) RBBUSArrayWrapper *(^tail)(NSUInteger n);
@property (readonly) RBBUSArrayWrapper *(^drop)(NSUInteger n);

@property (readonly) NSUInteger (^indexOf)(id obj);

@property (readonly) RBBUSArrayWrapper *flatten;
@property (readonly) RBBUSArrayWrapper *(^without)(NSArray *values);
@property (readonly) RBBUSArrayWrapper *shuffle;

@property (readonly) id (^reduce)(id memo, UnderscoreReduceBlock block);
@property (readonly) id (^reduceRight)(id memo, UnderscoreReduceBlock block);

@property (readonly) RBBUSArrayWrapper *(^each)(UnderscoreArrayIteratorBlock block);
@property (readonly) RBBUSArrayWrapper *(^map)(UnderscoreArrayMapBlock block);
@property (readonly) RBBUSArrayWrapper *(^indexedMap)(UnderscoreIndexedArrayMapBlock block);
@property (readonly) RBBUSArrayWrapper *(^zipWith)(NSArray *array, UnderscoreArrayZipWithBlock block);
@property (readonly) RBBUSArrayWrapper *(^pluck)(NSString *keyPath);
@property (readonly) RBBUSArrayWrapper *uniq;

@property (readonly) id (^find)(UnderscoreTestBlock block);

@property (readonly) RBBUSArrayWrapper *(^filter)(UnderscoreTestBlock block);
@property (readonly) RBBUSArrayWrapper *(^reject)(UnderscoreTestBlock block);

@property (readonly) BOOL (^all)(UnderscoreTestBlock block);
@property (readonly) BOOL (^any)(UnderscoreTestBlock block);

@property (readonly) RBBUSArrayWrapper *(^sort)(UnderscoreSortBlock block);
@property (readonly) RBBUSDictionaryWrapper *(^groupBy)(UnderscoreGroupingBlock block);

@end
