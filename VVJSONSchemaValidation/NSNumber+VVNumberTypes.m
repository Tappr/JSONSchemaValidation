//
//  NSNumber+VVNumberTypes.m
//  VVJSONSchemaValidation
//
//  Created by Vlas Voloshin on 30/12/2014.
//  Copyright (c) 2014 Vlas Voloshin. All rights reserved.
//

#import "NSNumber+VVNumberTypes.h"

@implementation NSNumber (VVNumberTypes)

- (BOOL)vv_isInteger
{
    if (self.vv_isBoolean == NO) {
        return self.vv_isFloat == NO;
    } else {
        return NO;
    }
}

- (BOOL)vv_isFloat
{
    CFNumberRef underlyingNumberRef = (__bridge CFNumberRef)self;
    return CFNumberIsFloatType(underlyingNumberRef);
}

- (BOOL)vv_isBoolean
{
    // this is a bit fragile, but works!
    return [self isKindOfClass:[@YES class]];
}

- (BOOL)vv_isStrictEqualToNumber:(NSNumber *)otherNumber
{
    if ([self isEqualToNumber:otherNumber]) {
        // no need to check for "is integer" since it's itself derived from boolean and float checks
        return self.vv_isFloat == otherNumber.vv_isFloat && self.vv_isBoolean == otherNumber.vv_isBoolean;
    } else {
        return NO;
    }
}

@end
