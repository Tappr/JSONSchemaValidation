//
//  VVJSONSchemaErrors.m
//  VVJSONSchemaValidation
//
//  Created by Vlas Voloshin on 29/12/2014.
//  Copyright (c) 2015 Vlas Voloshin. All rights reserved.
//

#import "VVJSONSchemaErrors.h"

NSString * const VVJSONSchemaErrorDomain = @"com.argentumko.JSONSchemaValidationError";
NSString * const VVJSONSchemaErrorFailingObjectKey = @"object";
NSString * const VVJSONSchemaErrorFailingValidatorKey = @"validator";
NSString * const VVJSONSchemaErrorFailingJSONNameKey = @"name";
NSString * const VVJSONSchemaErrorFailingJSONValueKey = @"value";

@implementation NSError (VVJSONSchemaError)

+ (instancetype)vv_JSONSchemaErrorWithCode:(VVJSONSchemaErrorCode)code failingObject:(id)failingObject failingValidator:(id<VVJSONSchemaValidator>)failingValidator
{
    NSMutableDictionary *userInfo = [NSError userInfoDictionaryWithFailingObject:failingObject failingValidator:failingValidator failingName:nil failingValue:nil];
    return [NSError errorWithDomain:VVJSONSchemaErrorDomain code:code userInfo:[userInfo copy]];
}

+ (instancetype)vv_JSONSchemaErrorWithCode:(VVJSONSchemaErrorCode)code failingObject:(id)failingObject failingValidator:(id <VVJSONSchemaValidator>)failingValidator failingName:(NSString *)failingName failingValue:(NSString *)failingValue
{
    NSMutableDictionary *userInfo = [NSError userInfoDictionaryWithFailingObject:failingObject failingValidator:failingValidator failingName:failingName failingValue:failingValue];
    return [NSError errorWithDomain:VVJSONSchemaErrorDomain code:code userInfo:[userInfo copy]];
}

+ (NSMutableDictionary *)userInfoDictionaryWithFailingObject:(id)failingObject failingValidator:(id <VVJSONSchemaValidator>)failingValidator failingName:(NSString *)failingName failingValue:(NSString *)failingValue
{
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    if (failingObject != nil) {
        userInfo[VVJSONSchemaErrorFailingObjectKey] = failingObject;
    }
    if (failingValidator != nil) {
        userInfo[VVJSONSchemaErrorFailingValidatorKey] = failingValidator;
    }
    if (failingName != nil) {
        userInfo[VVJSONSchemaErrorFailingJSONNameKey] = failingName;
    }
    if (failingName != nil) {
        userInfo[VVJSONSchemaErrorFailingJSONValueKey] = failingValue;
    }
    return userInfo;
}

@end
