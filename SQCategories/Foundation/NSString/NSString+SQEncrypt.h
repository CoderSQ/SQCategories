//
//  NSString+SQEncrypt.h
//  SQCategoriesDemo
//
//  Created by apple on 2017/2/9.
//  Copyright © 2017年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SQEncrypt)

//md5
@property (readonly) NSString *sq_md5String;

// sha
@property (readonly) NSString *sq_sha1String;
@property (readonly) NSString *sq_sha256String;
@property (readonly) NSString *sq_sha512String;

// hmac
- (NSString *)sq_hmacMD5StringWithKey:(NSString *)key;
- (NSString *)sq_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)sq_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)sq_hmacSHA512StringWithKey:(NSString *)key;

//AES
- (NSString*)sq_encryptedWithAESUsingKey:(NSString*)key;
- (NSString*)sq_decryptedWithAESUsingKey:(NSString*)key;

//3DES
- (NSString*)sq_encryptedWith3DESUsingKey:(NSString*)key;
- (NSString*)sq_decryptedWith3DESUsingKey:(NSString*)key;

@end
