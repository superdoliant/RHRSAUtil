//
//  ViewController.m
//  RHRSAUtil
//
//  Created by 黄睿 on 2016/11/4.
//  Copyright © 2016年 Ryan.Huang. All rights reserved.
//

#import "ViewController.h"
#import "IPNRSAUtil.h"
@interface ViewController ()

@end

@implementation ViewController{
    NSString *_publickey;
    NSString *_privatekey;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self doRSAEncrypt];
    [self doRSASignAndVerify];
}


/**
 加密和解密
 */
- (void)doRSAEncrypt{
    NSString *string = @"doRSAEncrypt";
    
    NSString *publickey = @"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA61sODmFj/OXnrHUYzams\
                            c/6XLni9G0HYv9sBewaPjF6qlu845nwmYSA6dQ9zPk231o5l3tmHLpUQGNnp/5rH\
                            +84iB/tM+Y+2kTI8uILGbmby2DL3rgzBG+I9h7e3w3QktpdcD8Z+ZuEVa/CY3Xez\
                            8X1uknEVzIIhDKY7ipAoebchVdELbTlH1BRLz8RH6mQ+Z8REH4UL0TiQLfSfTotv\
                            1G5ZerNxVZ7Toi4K9KFDA+1UD+LeDGg8PY/sdg0AJpR4o6bfDBko50wKLDz4UYyp\
                            7EFZv661o2Mr7+KoQ6Tpb7w8bTl7wrRKz9ugB5+tM2F7aDvv1mzr7STIF+2c7tEx\
                            DQIDAQAB";
    _publickey = publickey;
    
    NSString *privatekey = @"MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDrWw4OYWP85ees\
                            dRjNqaxz/pcueL0bQdi/2wF7Bo+MXqqW7zjmfCZhIDp1D3M+TbfWjmXe2YculRAY\
                            2en/msf7ziIH+0z5j7aRMjy4gsZuZvLYMveuDMEb4j2Ht7fDdCS2l1wPxn5m4RVr\
                            8Jjdd7PxfW6ScRXMgiEMpjuKkCh5tyFV0QttOUfUFEvPxEfqZD5nxEQfhQvROJAt\
                            9J9Oi2/Ubll6s3FVntOiLgr0oUMD7VQP4t4MaDw9j+x2DQAmlHijpt8MGSjnTAos\
                            PPhRjKnsQVm/rrWjYyvv4qhDpOlvvDxtOXvCtErP26AHn60zYXtoO+/WbOvtJMgX\
                            7Zzu0TENAgMBAAECggEBAOMf6w+ror9y6sE9+6K1hEwoO6NIN06vm8mCQwqDiVIw\
                            JTYlQ+cBllQSsvc24sMUYz32C48ko1Ur2u3wleXqa+Wvxp2nQWBw9QFn1rtE0NPI\
                            G8DSZr0bZ9xN1406mWdQlQF0Tg6XQnJr8q1I8WyAUTHSFzvRT/Uc+2Hmpf0RI05Y\
                            t0dt5bsGn/g+ijGbCm63Z2U8u5yWXidxWfU/KyYf1Y3mw9lGLR6IJc/q9N+TO4ih\
                            JM5pCraMFI4zWblGobkN2WKy7MrQ45FLSKul4W00+VyM/rVivW/fYUaqFEnlBog3\
                            /4hgI6Bsw2IuSk2Ubhbc4fp//146vJf6oL4WAJHmAiECgYEA+e3AFph8joC5gC1Q\
                            ok97tLJqt95fZCx4VCw6lPPbWxOHG6TJlvlo7kZIeUfKrGIlOWn38yuw5thEZKwW\
                            bzE8kn5WGlUgkOQ7hJ6Iiw/TzCFPRHxV63WBKa8OnyFIn3w91zI8ZTcUgrgyns+F\
                            gE5uxkEjb6iIyxxnpqC7Fk3lnikCgYEA8RKtn7kqoe0T/Yv7UsPLm7KzuWn3/01r\
                            LGA+x+GCp4rP2Lf0u1K+7VY6Dv/ceTBuA/2Yujenkjt0LaF+Bz0tLWFB5BTw3n+u\
                            6QshVdP3O1im4w6p3e8O9mfBCSV/CX5oBkbamemyQ7DTB9VtYNNmtGTs2aySuoel\
                            zPU0czETEEUCgYAjVhwclb62nzibCM0nxbkl2TwBdy1hinAQ5pf5y2iuPdqSbAAc\
                            mnLdjY5dp2reaJn+vh7SgNDoMpeo7DPX0MxRog8mdfa+xaYsoAWKM9isOeFtO28i\
                            dWCnthqJITmVYwmTTYUAgoMh4E036vtjIrPC0B7kgJ2mqgN1qbAJ/UWD0QKBgFSO\
                            U53hacWwDUHydm2aRXFQJd/T/mtq8Tt4aqzbOWOgubRvGYUWyecfRm/6aI+NYBlA\
                            OvCeEsWk2uQib70ERTNUmLLycWXpbSVKhR/AoEgNmUOs4gH5FstwqvGVWFCxKLWC\
                            5qvzn1ZE0FBAGQRMQgrmF3lmIXURnSMdoo8A2IntAoGAVCFmPpXvI8rMk2N3CvQ4\
                            dkDfP3W6w1KpyMzuQRZE9N1IUBYh3KN25HfzeW1OIFHPuxInMm/6zaU/rUHJSy/b\
                            ynVdQ6jvM4ZIt3rYUXZN6+a14AeA/MNNrY2LzCYlCxWIbVyNj9UN8/uda0zEtZ73\
                            RWYX1BlKVMSIx5Bf7eNH4fI=";
    
    _privatekey = privatekey;
    
    // 公钥加密
    NSString *encryptString = [IPNRSAUtil encryptString:string publicKey:publickey];
    
    // 私钥解密
    NSString *decryptString =  [IPNRSAUtil decryptString:encryptString privateKey:privatekey];
    
    NSLog(@"encryptString:%@",encryptString);
    NSLog(@"decryptString:%@",decryptString);
    
    // 分段加密:不同密钥长度单次加密的长度是有限的，比如1024位的密钥单次能加密117字节长度的数据，2048位的密钥单次能加密
    // 245字节长度的数据。若待加密的数据大于单次能加密的最大长度，则需要对数据进行分段加密。
    
    // n为密钥单次加密长度，这里使用的是2048位的密钥，因此n的值为245(2048/8 - 11)。
    NSInteger n = 245;
    
    string = @"这是一段超级长的待加密数据:pid=WSP161159ea43406&reqDate=20161104&version=3.0&amount=10&mobileId=&retMsg=交易成功。&userId=&expand=merId:ODU1MA==;orderId:MjAxNjExMDQwNDY1NzM3Ng==;goodsInf:&retUrl=https://pay.soopay.net/upay/wyPayReturn.do&notifyUrl=http://10.110.11.182:9090/upay/wyPayNotify.do&bankCardType=0&cardId=&gateId=&instId=20000001&trace=3611041611940335&merId=8550&cardType=&servType=&productId=P14M0000&bankId=EBD01101&sign=OuGsgcc92cm80RM5CwIJcByP4PdBE+EHruEmtV+WuP1EpOnVTHuPBnJ479qnd2bIhXaBjpeqs1b5iNWEjmVKfbpFwk/6ZMSba+kZtX45s23Zl8M/jgu09VGBXFgphUzh7B5wzMGJ/i4NK+No5fw93+t1qdozH3rcauGEmlvz6Do=&retCode=0000&bank_payurl=&binBankId=B007&reqTime=161202&funCode=020120&Memo=asdfakldlf。&payerName=&accessTypepid=WSP161159ea43406&reqDate=20161104&version=3.0&amount=10&mobileId=&retMsg=交易成功。&userId=&expand=merId:ODU1MA==;orderId:MjAxNjExMDQwNDY1NzM3Ng==;goodsInf:&retUrl=https://pay.soopay.net/upay/wyPayReturn.do&notifyUrl=http://10.110.11.182:9090/upay/wyPayNotify.do&bankCardType=0&cardId=&gateId=&instId=20000001&trace=3611041611940335&merId=8550&cardType=&servType=&productId=P14M0000&bankId=EBD01101&sign=OuGsgcc92cm80RM5CwIJcByP4PdBE+EHruEmtV+WuP1EpOnVTHuPBnJ479qnd2bIhXaBjpeqs1b5iNWEjmVKfbpFwk/6ZMSba+kZtX45s23Zl8M/jgu09VGBXFgphUzh7B5wzMGJ/i4NK+No5fw93+t1qdozH3rcauGEmlvz6Do=&retCode=0000&bank_payurl=&binBankId=B007&reqTime=161202&funCode=020120&Memo=adfasdfadf。&payerName=&accessTypepid=WSP161159ea43406&reqDate=20161104&version=3.0&amount=10&mobileId=&retMsg=dsafadfaf。&userId=&expand=merId:ODU1MA==;orderId:MjAxNjExMDQwNDY1NzM3Ng==;goodsInf:&retUrl=https://pay.soopay.net/upay/wyPayReturn.do&notifyUrl=http://10.110.11.182:9090/upay/wyPayNotify.do&bankCardType=0&cardId=&gateId=&instId=20000001&trace=3611041611940335&merId=8550&cardType=&servType=&productId=P14M0000&bankId=EBD01101&sign=OuGsgcc92cm80RM5CwIJcByP4PdBE+EHruEmtV+WuP1EpOnVTHuPBnJ479qnd2bIhXaBjpeqs1b5iNWEjmVKfbpFwk/6ZMSba+kZtX45s23Zl8M/jgu09VGBXFgphUzh7B5wzMGJ/i4NK+No5fw93+t1qdozH3rcauGEmlvz6Do=&retCode=0000&bank_payurl=&binBankId=B007&reqTime=161202&funCode=020120&Memo=123dafsdf。&payerName=&accessType";
    
    NSMutableData *preData = [[NSMutableData alloc] init];
    for (NSInteger i=0; i<=ceilf(string.length / n); i++){
        NSString *subString = [string substringWithRange:NSMakeRange(i * n, MIN(n, string.length - i * 245))];
        NSData *encryptData = [IPNRSAUtil encryptData:[subString dataUsingEncoding:NSUTF8StringEncoding]  publicKey:publickey];
        // 分段加密需要拼接加密后的data数据，不要将data转换成字符串再拼接，这样会导致结果错误。
        [preData appendData:encryptData];
    }
    NSData *finalData = [[NSData alloc] initWithData:preData];
    finalData = [finalData base64EncodedDataWithOptions:0];
    NSString *result = [[NSString alloc] initWithData:finalData encoding:NSUTF8StringEncoding];
    NSLog(@"result:%@",result);
}


/**
 加签和验签
 */
- (void)doRSASignAndVerify{
    
    NSString *string = @"doRSASignAndeVerify";
    
    // 私钥加签
    NSString *signature = [IPNRSAUtil rsaSignString:string WithPrivateKey:_privatekey];
    
    // 公钥验签
    BOOL result = [IPNRSAUtil rsaVerifySignature:signature plainString:string WithPublicKey:_publickey];
    
    NSLog(@"signature:%@",signature);
    
    if (result) {
        NSLog(@"验签成功");
    }else{
        NSLog(@"验签失败");
    }
}

@end






















