//
//  RBBUSStringWrapper.h
//  RBBUnderscore
//
//  Created by Vasco d'Orey on 16/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
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
#import "RBBUnderscore+Functional.h"
#import "RBBUSArrayWrapper.h"

@interface RBBUSStringWrapper : NSObject

+(instancetype) wrap:(NSString *)string;

-(id) init __deprecated_msg("You should use RBBUnderscore.string() instead.");

@property (readonly) NSString *unwrap;

/**
 *  Removes any leading and trailing whitespace character.
 */
@property (readonly) RBBUSStringWrapper *trim;

/**
 *  Capitalizes the first character in every word, all other characters are lowercase'd
 */
@property (readonly) RBBUSStringWrapper *capitalize;

/**
 *  Lowercases all characters.
 */
@property (readonly) RBBUSStringWrapper *lowercase;

/**
 *  Uppercases all characters.
 */
@property (readonly) RBBUSStringWrapper *uppercase;

/**
 *  Removes occurences of the given string.
 */
@property (readonly) RBBUSStringWrapper *(^strip)(NSString *strip);

/**
 *  Splits the string at the given separator. Returns a nil array if the separator is nil.
 */
@property (readonly) RBBUSArrayWrapper *(^split)(NSString *separator);

@end

@interface RBBUSArrayWrapper (USStrings)

/**
 *  Joins the elements in the array.
 */
@property (readonly) RBBUSStringWrapper *(^join)(NSString *joiner);

@end
