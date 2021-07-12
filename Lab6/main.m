//
//  main.m
//  Lab6
//
//  Created by Dylan Park on 2021-07-11.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        InputHandler *newInputHandler = [[InputHandler alloc] init];
        Dice *die1 = [[Dice alloc] init];
        Dice *die2 = [[Dice alloc] init];
        Dice *die3 = [[Dice alloc] init];
        Dice *die4 = [[Dice alloc] init];
        Dice *die5 = [[Dice alloc] init];

        GameController *newGameController = [[GameController alloc] init];
        newGameController.fiveDiceContainer = [NSMutableArray arrayWithObjects:die1, die2, die3, die4, die5, nil];
        
        [newGameController printCurrentGameState];
        int previousHoldCount = (int)newGameController.heldDice.count;
        
        BOOL playingGame = YES;
        while (playingGame) {
            NSString *choiceInput = [newInputHandler getUserInput:@"\n'roll' to roll the dice\n'hold' to hold a dice\n'reset' to un-hold all dice\n'done' to end the game\n'display' to show current stats\n'new game' to reset the score to beat"];
            if ([choiceInput isEqualToString:@"done"]) {
                playingGame = NO;
            } else if ([choiceInput isEqualToString:@"roll"]) {
                if (newGameController.remainingRolls > 0) {
                    if (previousHoldCount < newGameController.heldDice.count) {

                        for (Dice *eachDie in newGameController.fiveDiceContainer) {
                            if (eachDie.isHeld == true) {
                                continue;
                            }
                            eachDie.currentValue = die1.randomizeValue;
                        }
                        newGameController.remainingRolls -= 1;
                        [newGameController printCurrentGameState];
                        previousHoldCount = (int)newGameController.heldDice.count;
                        if (newGameController.remainingRolls <= 0) {
                            NSLog(@" GAME OVER");
                            [newGameController printCurrentGameState];
                            if (newGameController.returnCurrentScore < newGameController.lowestScore) {
                                newGameController.lowestScore = newGameController.returnCurrentScore;
                            }
                            NSLog(@"");
                            NSLog(@" Start New Game");
                            [newGameController resetDice];
                            for (Dice *eachDie in newGameController.fiveDiceContainer) {
                                eachDie.currentValue = die1.randomizeValue;
                            }
                            newGameController.remainingRolls = 5;
                            [newGameController printCurrentGameState];
                        }
                    } else {
                        NSLog(@"Please hold at least one die.");
                    }
                    
                } else {
                    NSLog(@"You can't roll anymore.");
                }
                
            } else if ([choiceInput isEqualToString:@"hold"]) {
                BOOL underChoosingDieToHold = YES;
                int holdCount = (int)newGameController.heldDice.count;
                previousHoldCount = holdCount;
                while (underChoosingDieToHold) {
                    NSString *numberToHold = [newInputHandler getUserInput:[NSString stringWithFormat:@"\nInput the number of a die to hold (reselect to unhold)\n'finish' to complete choosing\n 1   2   3   4   5 \n%@", [newGameController returnCurrentDice]]];
                    
                    if ([numberToHold isEqualToString:@"finish"]) {
                        if ((int)newGameController.heldDice.count > holdCount) {
                            [newGameController printCurrentGameState];
                            underChoosingDieToHold = NO;
                        } else {
                            NSLog(@"Please hold at least one more die.");
                        }
                        
                    } else if ([numberToHold isEqualToString:@"1"]) {
                        [newGameController holdDie:numberToHold];
                        die1 = newGameController.fiveDiceContainer[0];
                    } else if ([numberToHold isEqualToString:@"2"]) {
                        [newGameController holdDie:numberToHold];
                        die2 = newGameController.fiveDiceContainer[1];
                    } else if ([numberToHold isEqualToString:@"3"]) {
                        [newGameController holdDie:numberToHold];
                        die3 = newGameController.fiveDiceContainer[2];
                    } else if ([numberToHold isEqualToString:@"4"]) {
                        [newGameController holdDie:numberToHold];
                        die4 = newGameController.fiveDiceContainer[3];
                    } else if ([numberToHold isEqualToString:@"5"]) {
                        [newGameController holdDie:numberToHold];
                        die5 = newGameController.fiveDiceContainer[4];
                    } else {
                        NSLog(@"Invalid input. Please try again.");
                    }
                }
                if ((int)newGameController.heldDice.count == 5) {
                    NSLog(@" GAME OVER");
                    [newGameController printCurrentGameState];
                    if (newGameController.returnCurrentScore < newGameController.lowestScore) {
                        newGameController.lowestScore = newGameController.returnCurrentScore;
                    }
                    NSLog(@"");
                    NSLog(@" Start New Game");
                    [newGameController resetDice];
                    for (Dice *eachDie in newGameController.fiveDiceContainer) {
                        eachDie.currentValue = die1.randomizeValue;
                    }
                    newGameController.remainingRolls = 5;
                    [newGameController printCurrentGameState];
                }
            } else if ([choiceInput isEqualToString:@"reset"]) {
                [newGameController resetDice];
                newGameController.remainingRolls = 5;
                [newGameController printCurrentGameState];
            } else if ([choiceInput isEqualToString:@"display"]) {
                [newGameController printCurrentGameState];
            } else if ([choiceInput isEqualToString:@"new game"]) {
                newGameController.lowestScore = 30;
                [newGameController resetDice];
                for (Dice *eachDie in newGameController.fiveDiceContainer) {
                    eachDie.currentValue = die1.randomizeValue;
                }
                newGameController.remainingRolls = 5;
                [newGameController printCurrentGameState];
            } else if ([choiceInput isEqualToString:@"roII"]) {
                [newGameController forceToWin];
                [newGameController printCurrentGameState];
                NSLog(@" You Won!");
                if (newGameController.returnCurrentScore < newGameController.lowestScore) {
                    newGameController.lowestScore = newGameController.returnCurrentScore;
                }
                NSLog(@"");
                NSLog(@" Start New Game");
                [newGameController resetDice];
                for (Dice *eachDie in newGameController.fiveDiceContainer) {
                    eachDie.currentValue = die1.randomizeValue;
                }
                newGameController.remainingRolls = 5;
                [newGameController printCurrentGameState];
            } else {
                NSLog(@"Invalid input. Please try again.");
            }
            
        }
    }
    return 0;
}
