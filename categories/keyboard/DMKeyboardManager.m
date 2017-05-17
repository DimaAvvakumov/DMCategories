//
//  DMKeyboardManager.m
//  Pods
//
//  Created by Dmitry Avvakumov on 07.03.17.
//
//

#import "DMKeyboardManager.h"

@interface DMKeyboardManager ()

@property (assign, nonatomic) UIResponder *kb_firstResponder;

@end

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
        self.kb_firstResponder = nil;
        [self kb_startObservingDidBeginEditingNotification];
    }
    return self;
}

- (void)dealloc {
    [self kb_stopObservingDidBeginEditingNotification];
}

#pragma mark - Implementation methods

- (void)kb_startObservingDidBeginEditingNotification {

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(kb_textDidBeginEditing:)
                                                 name:UITextFieldTextDidBeginEditingNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(kb_textDidBeginEditing:)
                                                 name:UITextViewTextDidBeginEditingNotification
                                               object:nil];
}

- (void)kb_stopObservingDidBeginEditingNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextFieldTextDidBeginEditingNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidBeginEditingNotification
                                                  object:nil];
}

#pragma mark - Input Notifications

- (void)kb_textDidBeginEditing:(NSNotification *)notification {
    self.kb_firstResponder = notification.object;

}

#pragma mark - Resign

- (void)resignKeyboard {
    UIResponder *responder = self.kb_firstResponder;
    if (responder == nil) return;
    
    self.kb_firstResponder = nil;
    
    if (responder.isFirstResponder) {
        [responder resignFirstResponder];
    } else {
        NSLog(@"is not First Responder");
    }
}

@end
