//
//  IPNRSAUtil.h
//  
//
//  Created by 黄睿 on 2016/10/12.
//  Copyright © 2016年 ipaynow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<CommonCrypto/CommonDigest.h>

@interface IPNRSAUtil : NSObject

//*********************************    RSA加密     *******************************************

/**
 RSA公钥加密(返回Base64编码的字符串)

 @param str    待加密字符串
 @param pubKey 公钥

 @return 加密完成后的字符串(Base64编码之后)
 */
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;


/**
 RSA公钥加密(返回二进制数据)

 @param data   待加密数据
 @param pubKey 公钥

 @return 加密完成后的数据
 */
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;

//*********************************    RSA解密     *******************************************


/**
 RSA私钥解密(返回字符串)

 @param str     Base64编码后的加密字符串
 @param privKey 私钥

 @return 解密之后的字符串(原始字符串)
 */
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;


/**
 RSA私钥解密(返回二进制数据)

 @param data    加密之后的二进制数据
 @param privKey  私钥

 @return 解密之后的二进制数据
 */
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;

//*********************************    RSA验签     *******************************************
/**
 RSA验签-SHA1

 @param signature 签名
 @param plainString 待验签字符串
 @param publickey 公钥
 @return 是否通过验签
 */
+ (BOOL)rsaVerifySignature:(NSString *)signature plainString:(NSString *)plainString WithPublicKey:(NSString *)publickey;

//*********************************    RSA签名     *******************************************
/**
 RSA签名-SHA1

 @param plainString 待签名字符串
 @param privateKey 私钥
 @return 签名完成字符串
 */
+ (NSString *)rsaSignString:(NSString *)plainString WithPrivateKey:(NSString *)privateKey;


@end










