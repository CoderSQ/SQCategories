//
//  NSData+SQEncrypt.h
//  SQCategoriesDemo
//
//  Created by apple on 2017/2/9.
//  Copyright © 2017年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (SQEncrypt)
/**
 *  @brief  md5 NSData
 */
@property (readonly) NSData *sq_md5Data;
/**
 *  @brief  sha1Data NSData
 */
@property (readonly) NSData *sq_sha1Data;
/**
 *  @brief  sha256Data NSData
 */
@property (readonly) NSData *sq_sha256Data;
/**
 *  @brief  sha512Data NSData
 */
@property (readonly) NSData *sq_sha512Data;

/**
 *  @brief  md5 NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)sq_hmacMD5DataWithKey:(NSData *)key;
/**
 *  @brief  sha1Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)sq_hmacSHA1DataWithKey:(NSData *)key;
/**
 *  @brief  sha256Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)sq_hmacSHA256DataWithKey:(NSData *)key;
/**
 *  @brief  sha512Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)sq_hmacSHA512DataWithKey:(NSData *)key;

/**
 *  利用AES加密数据
 *
 *  @param key key
 *  @return data
 */
- (NSData *)sq_encryptedWithAESUsingKey:(NSString*)key ;
/**
 *  @brief  利用AES解密据
 *  @param key key
 *  @return 解密后数据
 */
- (NSData *)sq_decryptedWithAESUsingKey:(NSString*)key ;

/**
 *  利用3DES加密数据
 *
 *  @param key key
 *  @return data
 */
- (NSData *)sq_encryptedWith3DESUsingKey:(NSString*)key ;
/**
 *  @brief   利用3DES解密数据
 *
 *  @param key key
 *
 *  @return 解密后数据
 */
- (NSData *)sq_decryptedWith3DESUsingKey:(NSString*)key ;

/**
 *  @brief  NSData 转成UTF8 字符串
 *
 *  @return 转成UTF8 字符串
 */
- (NSString *)sq_UTF8String;
@end
