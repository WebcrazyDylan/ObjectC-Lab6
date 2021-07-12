//
//  Dice.h
//  Lab6
//
//  Created by Dylan Park on 2021-07-11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject

@property int currentValue;
@property BOOL isHeld;

- (int) randomizeValue;
- (NSString *) returnDieFace;

@end

NS_ASSUME_NONNULL_END
