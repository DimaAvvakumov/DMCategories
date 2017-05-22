//
//  UIView+DMGeometry.m
//  DMCategories
//
//  Created by Dmitry Avvakumov on 22.05.17.
//  Copyright © 2017 Dmitry Avvakumov. All rights reserved.
//

#import "UIView+DMGeometry.h"

@implementation UIView (DMGeometry)

#pragma mark - Origin

- (void)setFrameOriginX:(CGFloat)value {
    CGRect frame = self.frame;
    frame.origin.x = value;
    self.frame = frame;
}

- (void)setFrameOriginY:(CGFloat)value {
    CGRect frame = self.frame;
    frame.origin.y = value;
    self.frame = frame;
}

#pragma mark - Size

- (void)setFrameSizeWidth:(CGFloat)value {
    CGRect frame = self.frame;
    frame.size.width = value;
    self.frame = frame;
}

- (void)setFrameSizeHeight:(CGFloat)value {
    CGRect frame = self.frame;
    frame.size.height = value;
    self.frame = frame;
}

@end
