//
//  InputHandler.h
//  Lab6
//
//  Created by Dylan Park on 2021-07-11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputHandler : NSObject

// public methods
- (instancetype) init;
- (NSString *) getUserInput: (NSString *) prompt;

@end

NS_ASSUME_NONNULL_END

