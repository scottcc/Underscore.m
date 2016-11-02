//
//  RBBUnderscore+Strings.m
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

#import "RBBUnderscore+Strings.h"

@implementation RBBUnderscore (Strings)

+(RBBUSStringWrapper *(^)(NSString *))string
{
    return ^RBBUSStringWrapper *(NSString *string) {
        return [RBBUSStringWrapper wrap:string];
    };
}

+ (NSString *(^)(NSString *))trim
{
    return ^NSString *(NSString *string) {
        return RBBUnderscore.string(string).trim.unwrap;
    };
}

+ (NSString *(^)(NSString *))capitalize
{
    return ^NSString *(NSString *string) {
        return RBBUnderscore.string(string).capitalize.unwrap;
    };
}

+ (NSString *(^)(NSString *))lowercase
{
    return ^NSString *(NSString *string) {
        return RBBUnderscore.string(string).lowercase.unwrap;
    };
}

+ (NSString *(^)(NSString *))uppercase
{
    return ^NSString *(NSString *string) {
        return RBBUnderscore.string(string).uppercase.unwrap;
    };
}

+ (NSString *(^)(NSString *, NSString *))strip
{
    return ^NSString *(NSString *string, NSString *strip) {
        return RBBUnderscore.string(string).strip(strip).unwrap;
    };
}

+ (NSArray *(^)(NSString *, NSString *))split
{
    return ^NSArray *(NSString *string, NSString *separator) {
        return RBBUnderscore.string(string).split(separator).unwrap;
    };
}

+ (NSString *(^)(NSArray *, NSString *))join
{
    return ^NSString *(NSArray *components, NSString *joiner) {
        return RBBUnderscore.array(components).join(joiner).unwrap;
    };
}

@end
