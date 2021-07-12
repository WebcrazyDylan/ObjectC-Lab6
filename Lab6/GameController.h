//
//  GameController.h
//  Lab6
//
//  Created by Dylan Park on 2021-07-11.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property NSMutableArray *fiveDiceContainer;
@property NSMutableDictionary *heldDice;
@property int remainingRolls;
@property int lowestScore;

- (void) holdDie: (NSString *) targetDieNumberStr;
- (void) resetDice;
- (NSString *) returnCurrentDice;
- (int) returnCurrentScore;
- (void) printCurrentGameState;
- (void) forceToWin;

@end

NS_ASSUME_NONNULL_END
