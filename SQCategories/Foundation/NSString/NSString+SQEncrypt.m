//
//  NSString+SQEncrypt.m
//  SQCategoriesDemo
//
//  Created by apple on 2017/2/9.
//  Copyright © 2017年 zsq. All rights reserved.
//

#import "NSString+SQEncrypt.h"
#import "NSString+SQBase64.h"
#import "NSData+SQEncrypt.h"

#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

@implementation NSString (SQEncrypt)

- (NSString *)sq_md5String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(string, length, bytes);
    return [self sq_stringFromBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}
- (NSString *)sq_sha1String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(string, length, bytes);
    return [self sq_stringFromBytes:bytes length:CC_SHA1_DIGEST_LENGTH];
}
- (NSString *)sq_sha256String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(string, length, bytes);
    return [self sq_stringFromBytes:bytes length:CC_SHA256_DIGEST_LENGTH];
}
- (NSString *)sq_sha512String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(string, length, bytes);
    return [self sq_stringFromBytes:bytes length:CC_SHA512_DIGEST_LENGTH];
}

- (NSString *)sq_hmacMD5StringWithKey:(NSString *)key {
    return [self sq_hmacStringUsingAlg:kCCHmacAlgMD5 withKey:key];
}
- (NSString *)sq_hmacSHA1StringWithKey:(NSString *)key
{
    return [self sq_hmacStringUsingAlg:kCCHmacAlgSHA1 withKey:key];
    
}
- (NSString *)sq_hmacSHA256StringWithKey:(NSString *)key
{
    return [self sq_hmacStringUsingAlg:kCCHmacAlgSHA256 withKey:key];
    
}
- (NSString *)sq_hmacSHA512StringWithKey:(NSString *)key
{
    return [self sq_hmacStringUsingAlg:kCCHmacAlgSHA512 withKey:key];
    
}
#pragma mark - Helpers
- (NSString *)sq_hmacStringUsingAlg:(CCHmacAlgorithm)alg withKey:(NSString *)key {
    size_t size;
    switch (alg) {
        case kCCHmacAlgMD5: size = CC_MD5_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA1: size = CC_SHA1_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA224: size = CC_SHA224_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA256: size = CC_SHA256_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA384: size = CC_SHA384_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA512: size = CC_SHA512_DIGEST_LENGTH; break;
        default: return nil;
    }
    
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData *messageData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData *mutableData = [NSMutableData dataWithLength:size];
    CCHmac(alg, keyData.bytes, keyData.length, messageData.bytes, messageData.length, mutableData.mutableBytes);
    return [self sq_stringFromBytes:(unsigned char *)mutableData.bytes length:(int)mutableData.length];
}
- (NSString *)sq_stringFromBytes:(unsigned char *)bytes length:(int)length
{
    NSMutableString *mutableString = @"".mutableCopy;
    for (int i = 0; i < length; i++)
        [mutableString appendFormat:@"%02x", bytes[i]];
    return [NSString stringWithString:mutableString];
}


-(NSString*)sq_encryptedWithAESUsingKey:(NSString*)key {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] sq_encryptedWithAESUsingKey:key];
    NSString *encryptedString = [encrypted sq_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)sq_decryptedWithAESUsingKey:(NSString*)key {
    NSData *decrypted = [[NSData sq_dataWithBase64EncodedString:self] sq_decryptedWithAESUsingKey:key];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

- (NSString*)sq_encryptedWith3DESUsingKey:(NSString*)key {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] sq_encryptedWith3DESUsingKey:key];
    NSString *encryptedString = [encrypted sq_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)sq_decryptedWith3DESUsingKey:(NSString*)key {
    NSData *decrypted = [[NSData sq_dataWithBase64EncodedString:self] sq_decryptedWith3DESUsingKey:key];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}


@end
