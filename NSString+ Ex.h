//
//  NSString+Ex.h
//
//  Created by Anton Morozov on 11.07.13.
//  Copyright (c) 2013 Anton Morozov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extensions)

-(NSString *)encodingStringFromString:(NSString*)encoding;
-(NSString *)escapedString;
-(NSString *)urlencode;
-(NSString *)URLDecode;
-(BOOL) stringNotEmpty;
+(NSString*)requestStringFromDictionary:(NSDictionary*)dict;
+(NSString *)genRandStringLength: (int) len;
+(NSString *)genUnicStringName;
+(NSString *)JSONString:(NSString *)aString;
+(BOOL) stringIsValidEmail:(NSString *)checkString;
-(BOOL)stringIsValidEmail;
-(NSString*)capsedFirstLetterEnumString;
-(NSString *) stringByStrippingHTML;

@end
