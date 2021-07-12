//
//  GameController.m
//  Lab6
//
//  Created by Dylan Park on 2021-07-11.
//

#import "GameController.h"

@implementation GameController

- (instancetype) init {
    if (self = [super init]) {
        _fiveDiceContainer = [NSMutableArray new];
        _heldDice = [NSMutableDictionary new];
        _remainingRolls = 5;
        _lowestScore = 30;
    }
    return self;
}

- (void) holdDie: (NSString *) targetDieNumberStr {
    int targetDieNumber = (int)[targetDieNumberStr integerValue];
    Dice *targetDie = self.fiveDiceContainer[targetDieNumber - 1];
    targetDie.isHeld = !targetDie.isHeld;
    if (targetDie.isHeld) {
        // when hold
        switch (targetDieNumber) {
            case 1:
                self.heldDice[@1] = self.fiveDiceContainer[0];
                break;
            case 2:
                self.heldDice[@2] = self.fiveDiceContainer[1];
                break;
            case 3:
                self.heldDice[@3] = self.fiveDiceContainer[2];
                break;
            case 4:
                self.heldDice[@4] = self.fiveDiceContainer[3];
                break;
            case 5:
                self.heldDice[@5] = self.fiveDiceContainer[4];
                break;
        }
    
    } else {
        // when un-hold
        switch (targetDieNumber) {
            case 1:
                [self.heldDice removeObjectForKey:@1];
                break;
            case 2:
                [self.heldDice removeObjectForKey:@2];
                break;
            case 3:
                [self.heldDice removeObjectForKey:@3];
                break;
            case 4:
                [self.heldDice removeObjectForKey:@4];
                break;
            case 5:
                [self.heldDice removeObjectForKey:@5];
                break;
        }
    }
}

- (void) resetDice {
    for (Dice *eachDie in self.fiveDiceContainer) {
        eachDie.isHeld = false;
    }
    [self.heldDice removeAllObjects];
}

- (NSString *) returnCurrentDice {
    Dice *die1 = self.fiveDiceContainer[0];
    Dice *die2 = self.fiveDiceContainer[1];
    Dice *die3 = self.fiveDiceContainer[2];
    Dice *die4 = self.fiveDiceContainer[3];
    Dice *die5 = self.fiveDiceContainer[4];
    NSString *currentDice = [NSString stringWithFormat:@"%@ %@ %@ %@ %@", die1.returnDieFace, die2.returnDieFace, die3.returnDieFace, die4.returnDieFace, die5.returnDieFace];
    return currentDice;
}

- (int) returnCurrentScore {
    int score = 0;
    for (Dice *eachDie in self.fiveDiceContainer) {
        if (eachDie.currentValue != 3) {
            score += eachDie.currentValue;
        }
    }
    return score;
}

- (void) printCurrentGameState {
    NSLog(@"Remaining Rolls: %d", self.remainingRolls);
    NSLog(@"--------------------");
    NSLog(@"--  Current Dice  --");
    NSLog(@"%@", self.returnCurrentDice);
    NSLog(@"");
    NSLog(@"--   Total Score  --");
    NSLog(@"Score: %d", self.returnCurrentScore);
    NSLog(@"Score to beat: %d", self.lowestScore);
    NSLog(@"--------------------");
}

- (void) forceToWin {
    for (Dice *eachDie in self.fiveDiceContainer) {
        eachDie.currentValue = 3;
        eachDie.isHeld = true;
    }
}

@end
