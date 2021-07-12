//
//  InputHandler.m
//  Lab6
//
//  Created by Dylan Park on 2021-07-11.
//

#import "InputHandler.h"

@implementation InputHandler {
    
}

- (instancetype) init {
    return self;
}

- (NSString *) getUserInput: (NSString *) prompt {
    int maxLength = 225;
    NSLog(@"%@ ", prompt);
    char inputCStr[maxLength];
    char *input = fgets(inputCStr, maxLength, stdin);
    if (input != NULL) {
        NSString *resultObjCStr = [NSString stringWithCString:inputCStr encoding:NSUTF8StringEncoding];
        NSCharacterSet *whitespaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimmedInput = [resultObjCStr stringByTrimmingCharactersInSet:whitespaces];
        return trimmedInput;
    }
    return NULL;
}

@end
