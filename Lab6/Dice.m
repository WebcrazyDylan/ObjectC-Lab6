//
//  Dice.m
//  Lab6
//
//  Created by Dylan Park on 2021-07-11.
//

#import "Dice.h"

@implementation Dice

- (instancetype) init {
    if (self = [super init]) {
        _currentValue = self.randomizeValue;
        _isHeld = false;
    }
    return self;
}

- (int) randomizeValue {
    return arc4random_uniform(6) + 1;  // (0+1)~(5+1)
}

- (NSString *) returnDieFace {
    if (self.isHeld == false) {
        switch (self.currentValue) {
            case 1:
                return @" ⚀ ";
            case 2:
                return @" ⚁ ";
            case 3:
                return @" ⚂ ";
            case 4:
                return @" ⚃ ";
            case 5:
                return @" ⚄ ";
            case 6:
                return @" ⚅ ";
            default:
                return nil;
        }
    } else {
        switch (self.currentValue) {
            case 1:
                return @"[⚀]";
            case 2:
                return @"[⚁]";
            case 3:
                return @"[⚂]";
            case 4:
                return @"[⚃]";
            case 5:
                return @"[⚄]";
            case 6:
                return @"[⚅]";
            default:
                return nil;
        }
    }
}

@end
