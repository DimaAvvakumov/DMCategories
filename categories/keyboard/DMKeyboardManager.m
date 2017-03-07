//
//  DMKeyboardManager.m
//  Pods
//
//  Created by Dmitry Avvakumov on 07.03.17.
//
//

#import "DMKeyboardManager.h"

@implementation DMKeyboardManager

#pragma mark - Shared instance

+ (DMKeyboardManager *) sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
