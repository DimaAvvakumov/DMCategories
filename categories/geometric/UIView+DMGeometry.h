//
//  UIView+DMGeometry.h
//  DMCategories
//
//  Created by Dmitry Avvakumov on 22.05.17.
//  Copyright © 2017 Dmitry Avvakumov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DMGeometry)

#pragma mark - Origin
- (void)setFrameOriginX:(CGFloat)value;
- (void)setFrameOriginY:(CGFloat)value;

#pragma mark - Size
- (void)setFrameSizeWidth:(CGFloat)value;
- (void)setFrameSizeHeight:(CGFloat)value;

@end
