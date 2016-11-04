# RHRSAUtil
RSA一站式解决办法

## 使用指南：
**注意：若使用`Xcode8`及以上请在`Capabilities`中将`KeyChain sharing`设置为`YES`**。

![](/Users/liuning1/Desktop/QQ20161104-0@2x.png)

本工具类直接使用`.pem`文件中字符串类型的密钥，无需导入p12、der之类的证书文件。

本工具类能实现:

1. RSA公钥加密;
2. RSA私钥解密;
3. RSA私钥加签;
4. RSA公钥验签。

**不建议将私钥保存在客户端，会有较大的安全风险**。

**接入方法**：

1. 将工具类导入项目;
2. 导入头文件`IPNRSAUtil.h`;
3. 调用工具类中的方法。

**加密**:

```objc
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;
```

**解密**:

```objc
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;
```

**加签(SHA1)**:

```objc
+ (NSString *)rsaSignString:(NSString *)plainString WithPrivateKey:(NSString *)privateKey;
```

**验签(SHA1)**:

```objc
+ (BOOL)rsaVerifySignature:(NSString *)signature plainString:(NSString *)plainString WithPublicKey:(NSString *)publickey;
```


若有疑问,欢迎提`issue`交流。


