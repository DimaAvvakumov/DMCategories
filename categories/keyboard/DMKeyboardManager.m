//
//  DMKeyboardManager.m
//  Pods
//
//  Created by Dmitry Avvakumov on 07.03.17.
//
//

#import "DMKeyboardManager.h"

@interface DMKeyboardManager ()

@property (weak, nonatomic) UIResponder *firstResponder;

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
        self.firstResponder = nil;
        [self startObservingDidBeginEditingNotification];
        [self startObservingKeyboardNotifications];
    }
    return self;
}

- (void)dealloc {
    [self stopObservingDidBeginEditingNotification];
    [self stopObservingKeyboardNotifications];
}

#pragma mark - Editing Notification

- (void)startObservingDidBeginEditingNotification {

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textDidBeginEditing:)
                                                 name:UITextFieldTextDidBeginEditingNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textDidBeginEditing:)
                                                 name:UITextViewTextDidBeginEditingNotification
                                               object:nil];
}

- (void)stopObservingDidBeginEditingNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextFieldTextDidBeginEditingNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidBeginEditingNotification
                                                  object:nil];
}

#pragma mark - Keyboard Notification

- (void)startObservingKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShowOrHideNotification:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShowOrHideNotification:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)stopObservingKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

#pragma mark - Input Notifications

- (void)textDidBeginEditing:(NSNotification *)notification {
    id responder = notification.object;
    
    if (!responder) return;
    if (![responder isKindOfClass:[UIResponder class]]) return;
    
    self.firstResponder = responder;
}

- (void)keyboardWillShowOrHideNotification:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;

    CGRect keyboardFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    BOOL isShowNotification = [notification.name isEqualToString:UIKeyboardWillShowNotification];
    CGFloat keyboardHeight = isShowNotification ? CGRectGetHeight(keyboardFrame) : 0.0;

    self.keyboardHeight = keyboardHeight;
}

#pragma mark - Resign

- (void)resignKeyboard {
    UIResponder *responder = self.firstResponder;
    if (responder == nil) return;
    
    self.firstResponder = nil;
    
    if (responder.isFirstResponder) {
        [responder resignFirstResponder];
    } else {
        NSLog(@"is not First Responder");
    }
}

@end
