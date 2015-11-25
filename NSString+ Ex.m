//
//  NSString+Ex.m
//
//  Created by Anton Morozov on 11.07.13.
//  Copyright (c) 2013 Anton Morozov. All rights reserved.
//

#import "NSString+ Ex.h"

@implementation NSString (Extensions)

-(NSString *)encodingStringFromString:(NSString*)encoding {
    return  (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                          NULL,
                                                                          (__bridge CFStringRef) encoding,
                                                                          NULL,
                                                                          CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                          kCFStringEncodingUTF8));
}

-(NSString *)escapedString {
    
    // from docs, these are all reserved
//    NSArray *reserved = [NSArray arrayWithObjects:@"\\", @"&", @"|", @"!", @"{", @"}", @"[", @"]", @"^", @"~", @"*:", @":", @"'" ,@"\"", @"+", @"-", nil];
     NSArray *reserved = [NSArray arrayWithObjects:@"\"", nil];
    NSMutableString *s = [NSMutableString stringWithString:self];
    NSString *r;
    NSEnumerator *e = [reserved objectEnumerator];
    while (r = [e nextObject])
        [s replaceOccurrencesOfString:r withString:[NSString stringWithFormat:@"\\%@", r] options:NSLiteralSearch range:NSMakeRange(0, [s length])];
    return s;
}

-(NSString *)urlencode {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    NSInteger sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

- (NSString *)URLDecode
{
    NSString *result = [(NSString *)self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

-(BOOL)stringNotEmpty
{
    if (self && self.length) {
        return YES;
    } else {
        return NO;
    }
}

+(NSString *)requestStringFromDictionary:(NSDictionary *)dict
{
    NSMutableString *resultString = [NSMutableString string];
    for (NSString* key in [dict allKeys]){
        if ([resultString length]>0)
            [resultString appendString:@"&"];
        [resultString appendFormat:@"%@=%@", key, [dict objectForKey:key]];
    }     
    return resultString;
}

+(NSString *)genRandStringLength: (int) len {
    
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";     
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    return randomString;
}

+(NSString *)genUnicStringName
{
//    NSString *timestampStr = [NSString stringWithFormat:@"%d", (int)[[NSDate date] timeIntervalSince1970]];
    NSString *timestampStr = [NSString stringWithFormat:@"%ld", (time_t)[[NSDate date] timeIntervalSince1970]];
    NSString *randStr = [NSString genRandStringLength:20];
    
    return [NSString stringWithFormat:@"%@%@", timestampStr, randStr];
}

+(NSString *)JSONString:(NSString *)aString {
    NSMutableString *s = [NSMutableString stringWithString:aString];
    [s replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"/" withString:@"\\/" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\n" withString:@"\\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\b" withString:@"\\b" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\f" withString:@"\\f" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\r" withString:@"\\r" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    [s replaceOccurrencesOfString:@"\t" withString:@"\\t" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [s length])];
    return [NSString stringWithString:s];
}

+(BOOL) stringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

-(BOOL)stringIsValidEmail
{
    if (!self || !self.length) {
        return NO;
    }
    
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

-(NSString *)capsedFirstLetterEnumString
{
    if ([self stringNotEmpty]) {
        NSString *noCaps = [[self stringByReplacingOccurrencesOfString:@"_" withString:@" "] lowercaseString];
        NSString *capitalized = [noCaps stringByReplacingCharactersInRange:NSMakeRange(0,1)
                                                                withString:[[noCaps substringToIndex:1] capitalizedString]];
        return capitalized;
    }
    return self;
}

-(NSString *) stringByStrippingHTML {
    NSRange r;
    NSString *s = [self copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

@end
