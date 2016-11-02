//
//  UnderscoreSpec.m
//  RBBUnderscore
//
//  Created by Vasco d'Orey on 16/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "RBBUnderscore+Strings.h"

SpecBegin(UnderscoreStrings)

describe(@"trim: get rid of unneccessary whitespace characters.", ^{
    it(@"should behave with nil", ^{
        expect(RBBUnderscore.string(nil).trim.unwrap).to.beNil;
        expect(RBBUnderscore.trim(nil)).to.beNil;
    });
    
    it(@"should work with empty strings", ^{
        expect(RBBUnderscore.string(@"").trim.unwrap).to.equal(@"");
        expect(RBBUnderscore.trim(@"")).to.equal(@"");
    });
    
    it(@"should work with leading whitespace", ^{
        expect(RBBUnderscore.string(@" RBBUnderscore strings will be pretty useful")
               .trim
               .unwrap).to.equal(@"RBBUnderscore strings will be pretty useful");
        expect(RBBUnderscore.trim(@" RBBUnderscore strings will be pretty useful")).to.equal(@"RBBUnderscore strings will be pretty useful");
    });
    
    it(@"should work with trailing whitespace", ^{
        expect(RBBUnderscore.string(@"RBBUnderscore strings will be pretty useful ")
               .trim
               .unwrap).to.equal(@"RBBUnderscore strings will be pretty useful");
        expect(RBBUnderscore.trim(@"RBBUnderscore strings will be pretty useful ")).to.equal(@"RBBUnderscore strings will be pretty useful");
    });
    
    it(@"should work without any whitespace", ^{
        expect(RBBUnderscore.string(@"RBBUnderscore").trim.unwrap).to.equal(@"RBBUnderscore");
        expect(RBBUnderscore.trim(@"RBBUnderscore")).to.equal(@"RBBUnderscore");
    });
    
    it(@"should work with only whitespace", ^{
        expect(RBBUnderscore.string(@"   ").trim.unwrap).to.equal(@" ");
        expect(RBBUnderscore.trim(@"   ")).to.equal(@" ");
        expect(RBBUnderscore.string(@"  ").trim.unwrap).to.equal(@"");
        expect(RBBUnderscore.trim(@"  ")).to.equal(@"");
        expect(RBBUnderscore.string(@" ").trim.unwrap).to.equal(@"");
        expect(RBBUnderscore.trim(@" ")).to.equal(@"");
    });
});

describe(@"capitalize: uppercase the first letter of a string.", ^{
    it(@"should behave with nil", ^{
        expect(RBBUnderscore.string(nil).capitalize.unwrap).to.beNil;
        expect(RBBUnderscore.capitalize(nil)).to.beNil;
    });
    
    it(@"should work with empty strings", ^{
        expect(RBBUnderscore.string(@"").capitalize.unwrap).to.equal(@"");
        expect(RBBUnderscore.capitalize(@"")).to.equal(@"");
    });
    
    it(@"should behave with lowercase strings", ^{
        expect(RBBUnderscore.string(@"hello").capitalize.unwrap).to.equal(@"Hello");
        expect(RBBUnderscore.capitalize(@"hello")).to.equal(@"Hello");
    });
    
    it(@"should behave with capitalized strings", ^{
        expect(RBBUnderscore.string(@"Hello There").capitalize.unwrap).to.equal(@"Hello There");
        expect(RBBUnderscore.capitalize(@"Hello There")).to.equal(@"Hello There");
    });
    
    it(@"should behave with uppercase strings", ^{
        expect(RBBUnderscore.string(@"HELLO THERE").capitalize.unwrap).to.equal(@"Hello There");
        expect(RBBUnderscore.capitalize(@"HELLO THERE")).to.equal(@"Hello There");
    });
    
    it(@"should keep whitespace intact", ^{
        expect(RBBUnderscore.string(@"       HELLO THERE How are you").capitalize.unwrap).to.equal(@"       Hello There How Are You");
        expect(RBBUnderscore.capitalize(@"       HELLO THERE How are you")).to.equal(@"       Hello There How Are You");
    });
});

describe(@"lowercase: make all characters in the string lowercase", ^{
    it(@"should behave with nil", ^{
        expect(RBBUnderscore.string(nil).lowercase.unwrap).to.beNil;
        expect(RBBUnderscore.lowercase(nil)).to.beNil;
    });
    
    it(@"should work with empty strings", ^{
        expect(RBBUnderscore.string(@"").lowercase.unwrap).to.equal(@"");
        expect(RBBUnderscore.lowercase(@"")).to.equal(@"");
    });
    
    it(@"should behave with lowercase strings", ^{
        expect(RBBUnderscore.string(@"hello").lowercase.unwrap).to.equal(@"hello");
        expect(RBBUnderscore.lowercase(@"hello")).to.equal(@"hello");
    });
    
    it(@"should behave with capitalized strings", ^{
        expect(RBBUnderscore.string(@"Hello There").lowercase.unwrap).to.equal(@"hello there");
        expect(RBBUnderscore.lowercase(@"Hello There")).to.equal(@"hello there");
    });
    
    it(@"should behave with uppercase strings", ^{
        expect(RBBUnderscore.string(@"HELLO THERE").lowercase.unwrap).to.equal(@"hello there");
        expect(RBBUnderscore.lowercase(@"HELLO THERE")).to.equal(@"hello there");
    });
    
    it(@"should keep whitespace intact", ^{
        expect(RBBUnderscore.string(@"       HELLO THERE How are you").lowercase.unwrap).to.equal(@"       hello there how are you");
        expect(RBBUnderscore.lowercase(@"       HELLO THERE How are you")).to.equal(@"       hello there how are you");
    });
});

describe(@"uppercase: make all characters in the string uppercase", ^{
    it(@"should behave with nil", ^{
        expect(RBBUnderscore.string(nil).uppercase.unwrap).to.beNil;
        expect(RBBUnderscore.uppercase(nil)).to.beNil;
    });
    
    it(@"should work with empty strings", ^{
        expect(RBBUnderscore.string(@"").uppercase.unwrap).to.equal(@"");
        expect(RBBUnderscore.uppercase(@"")).to.equal(@"");
    });
    
    it(@"should behave with lowercase strings", ^{
        expect(RBBUnderscore.string(@"hello").uppercase.unwrap).to.equal(@"HELLO");
        expect(RBBUnderscore.uppercase(@"hello")).to.equal(@"HELLO");
    });
    
    it(@"should behave with capitalized strings", ^{
        expect(RBBUnderscore.string(@"Hello There").uppercase.unwrap).to.equal(@"HELLO THERE");
        expect(RBBUnderscore.uppercase(@"Hello There")).to.equal(@"HELLO THERE");
    });
    
    it(@"should behave with uppercase strings", ^{
        expect(RBBUnderscore.string(@"HELLO THERE").uppercase.unwrap).to.equal(@"HELLO THERE");
        expect(RBBUnderscore.uppercase(@"HELLO THERE")).to.equal(@"HELLO THERE");
    });
    
    it(@"should keep whitespace intact", ^{
        expect(RBBUnderscore.string(@"       HELLO THERE How are you").uppercase.unwrap).to.equal(@"       HELLO THERE HOW ARE YOU");
        expect(RBBUnderscore.uppercase(@"       HELLO THERE How are you")).to.equal(@"       HELLO THERE HOW ARE YOU");
    });
});

describe(@"strip: remove occurences of a substring from a string", ^{
    it(@"should behave with nil", ^{
        expect(RBBUnderscore.string(nil).strip(nil).unwrap).to.beNil;
        expect(RBBUnderscore.strip(nil, nil)).to.beNil;
        expect(RBBUnderscore.string(@"hey").strip(nil).unwrap).to.beNil;
        expect(RBBUnderscore.strip(@"hey", nil)).to.beNil;
        expect(RBBUnderscore.string(nil).strip(@"abc").unwrap).to.beNil;
        expect(RBBUnderscore.strip(nil, @"abc")).to.beNil;
    });
    
    it(@"should behave with empty strings", ^{
        expect(RBBUnderscore.string(@"").strip(@"abc").unwrap).to.equal(@"");
        expect(RBBUnderscore.strip(@"", @"abc")).to.equal(@"");
    });
    
    it(@"should remove substrings correctly", ^{
        expect(RBBUnderscore.string(@"It was the best of times, it was the worst of times")
               .strip(@",")
               .unwrap).to.equal(@"It was the best of times it was the worst of times");
        expect(RBBUnderscore.strip(@"It was the best of times, it was the worst of times"
                                , @",")).to.equal(@"It was the best of times it was the worst of times");
        expect(RBBUnderscore.string(@"aaabbbccc").strip(@"b").unwrap).to.equal(@"aaaccc");
        expect(RBBUnderscore.strip(@"aaabbbccc", @"b")).to.equal(@"aaaccc");
        expect(RBBUnderscore.string(@"aaabbbccc").strip(@"bb").unwrap).to.equal(@"aaabccc");
        expect(RBBUnderscore.strip(@"aaabbbccc", @"bb")).to.equal(@"aaabccc");
    });
    
    it(@"should behave when the substring doesn't exist", ^{
        expect(RBBUnderscore.string(@"It was the best of times, it was the worst of times")
               .strip(@"zzz")
               .unwrap).to.equal(@"It was the best of times, it was the worst of times");
        expect(RBBUnderscore.strip(@"It was the best of times, it was the worst of times",
                                @"zzz")).to.equal(@"It was the best of times, it was the worst of times");
        expect(RBBUnderscore.string(@"aaabbbccc").strip(@"d").unwrap).to.equal(@"aaabbbccc");
        expect(RBBUnderscore.strip(@"aaabbbccc", @"d")).to.equal(@"aaabbbccc");
    });
});

describe(@"split: split the string into an array with the components separated by the spaces", ^{
    it(@"should behave with nil", ^{
        expect(RBBUnderscore.string(nil).split(nil).unwrap).to.beNil;
        expect(RBBUnderscore.split(nil, nil)).to.beNil;
        expect(RBBUnderscore.string(@" this is a long string").split(nil).unwrap).to.beNil;
        expect(RBBUnderscore.split(@" this is a long string", nil)).to.beNil;
    });
    
    it(@"should behave with empty strings", ^{
        expect(RBBUnderscore.string(@"").split(@" ").unwrap).to.equal(@[ @"" ]);
        expect(RBBUnderscore.split(@"", @" ")).to.equal(@[ @"" ]);
    });
    
    it(@"should behave with single words", ^{
        expect(RBBUnderscore.string(@"hello").split(@" ").unwrap).to.equal(@[ @"hello" ]);
        expect(RBBUnderscore.split(@"hello", @" ")).to.equal(@[ @"hello" ]);
        expect(RBBUnderscore.string(@" hello ").split(@" ").unwrap).to.equal((@[ @"", @"hello", @"" ]));
        expect(RBBUnderscore.split(@" hello ", @" ")).to.equal((@[ @"", @"hello", @"" ]));
    });
    
    it(@"should behave with multiple words", ^{
        expect(RBBUnderscore.string(@"hello RBBUnderscore strings").split(@" ").unwrap).to.equal((@[ @"hello", @"RBBUnderscore", @"strings" ]));
        expect(RBBUnderscore.split(@"hello RBBUnderscore strings", @" ")).to.equal((@[ @"hello", @"RBBUnderscore", @"strings" ]));
        expect(RBBUnderscore.string(@" hello  RBBUnderscore strings ")
               .split(@" ")
               .unwrap).to.equal((@[ @"", @"hello", @"", @"RBBUnderscore", @"strings", @"" ]));
        expect(RBBUnderscore.split(@" hello  RBBUnderscore strings ", @" ")).to.equal((@[ @"", @"hello", @"", @"RBBUnderscore", @"strings", @"" ]));
    });
    
    it(@"should behave with diferent separators", ^{
        expect(RBBUnderscore.string(@"hello RBBUnderscore strings").split(@"n").unwrap).to.equal((@[ @"hello u", @"derscore stri", @"gs"]));
        expect(RBBUnderscore.split(@"hello RBBUnderscore strings", @"n")).to.equal((@[ @"hello u", @"derscore stri", @"gs"]));
        
        NSString *bestWorstTestString = @"It was the best of times, it was the worst of times";
        NSArray *bestWorstSplit = @[ @"I", @" was ", @"he bes", @" of ", @"imes, i", @" was ", @"he wors", @" of ", @"imes"];
        expect(RBBUnderscore.string(bestWorstTestString).split(@"t").unwrap).to.equal(bestWorstSplit);
        expect(RBBUnderscore.split(bestWorstTestString , @"t")).to.equal(bestWorstSplit);
        
        NSString *heyTestString = @"hey this is another string hey yeah";
        NSArray *heyAnotherStringSplit = @[ @"", @" this is another string ", @" yeah" ];
        expect(RBBUnderscore.string(heyTestString) .split(@"hey").unwrap).to.equal(heyAnotherStringSplit);
        expect(RBBUnderscore.split(heyTestString , @"hey")).to.equal(heyAnotherStringSplit);
    });
});

describe(@"join: joins the given array adding the given string between each component", ^{
    it(@"should behave with nil", ^{
        expect(RBBUnderscore.array(@[ @"a" ]).join(nil).unwrap).to.beNil;
        expect(RBBUnderscore.join(@[ @"a" ], nil)).to.beNil;
        expect(RBBUnderscore.array(nil).join(nil).unwrap).to.beNil;
        expect(RBBUnderscore.join(nil, nil)).to.beNil;
        expect(RBBUnderscore.array(nil).join(@"abc").unwrap).to.beNil;
        expect(RBBUnderscore.join(nil, @"abc")).to.beNil;
    });
    
    it(@"should behave with empty arrays", ^{
        expect(RBBUnderscore.array(@[ ]).join(@"h").unwrap).to.equal(@"");
        expect(RBBUnderscore.join(@[ ], @"h")).to.equal(@"");
    });
    
    it(@"should join arrays correctly", ^{
        expect(RBBUnderscore.array(@[ @"it", @"was", @"the", @"best" ]).join(@", ").unwrap).to.equal(@"it, was, the, best");
        expect(RBBUnderscore.join(@[ @"it", @"was", @"the", @"best" ], @", ")).to.equal(@"it, was, the, best");
    });
    
    it(@"should handle non string objects", ^{
        expect(RBBUnderscore.array(@[ @"string", [NSNull null]]).join(@", ").unwrap).to.equal(@"string, <null>");
        expect(RBBUnderscore.join(@[ @"string", [NSNull null]], @", ")).to.equal(@"string, <null>");
    });
});

describe(@"RBBUnderscore.strings should work with chaining", ^{
    it(@"should behave with nil", ^{
        expect(RBBUnderscore.string(nil)
               .strip(nil)
               .trim
               .capitalize
               .split(nil)
               .unwrap).to.beNil;
        expect(RBBUnderscore.string(nil)
               .lowercase
               .capitalize
               .uppercase
               .strip(@"hey")
               .unwrap).to.beNil;
    });
    
    it(@"should behave as intended", ^{
        expect(RBBUnderscore.string(@"It was the best of times, it was the worst of times")
               .lowercase
               .strip(@",")
               .split(@" ")
               .uniq
               .join(@", ")
               .unwrap).to.equal(@"it, was, the, best, of, times, worst");
    });
});

SpecEnd
