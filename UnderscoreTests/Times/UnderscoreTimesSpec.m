//
//  UnderscoreTimesSpec.m
//  RBBUnderscore
//
//  Created by akitsukada on 2015/03/21.
//  Copyright (c) 2015年 Robert Böhnke. All rights reserved.
//

#import "RBBUnderscore+Times.h"

SpecBegin(UnderscoreTimes)

describe(@"times", ^{
    context(@"when positive number given", ^{
        it(@"should call given block specified times", ^{
            NSInteger __block count = 0;
            NSInteger times = 10;
            RBBUnderscore.times(times, ^(NSInteger n){
                count++;
            });
            expect(count).to.equal(times);
        });
    });

    context(@"when negative number given", ^{
        it(@"should through Exeption", ^{
            expect(^{
                NSInteger times = -1;
                RBBUnderscore.times(times, ^(NSInteger n){});
            }).to.raise(@"NSInternalInconsistencyException");
        });
    });
});

SpecEnd

