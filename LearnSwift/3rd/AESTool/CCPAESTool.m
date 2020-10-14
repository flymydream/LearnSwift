//
//  CCPAESTool.m
//  CCPAESEncode
//
//  Created by CCP on 16/9/7.
//  Copyright © 2016年 CCP. All rights reserved.
//

#import "CCPAESTool.h"
//#import "GTMBase64.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@implementation CCPAESTool

+ (NSString *)inputDictionary:(NSMutableDictionary *)dict andSecretKey:(NSString *)key{
    
    NSString *jsonString = [CCPAESTool dictionaryToJson:dict];
    
//    NSString *jsonBase64Str = [GTMBase64 encodeBase64String:jsonString];
    
    NSString *encryptStr = [CCPAESTool AES128Encrypt:jsonString andSecretKey:key];
    
    return encryptStr;
}

+ (NSDictionary *)inputBase64String:(NSString *)base64String andSecretKey:(NSString *)key {
    
    NSString * jsonString = [CCPAESTool AES128Decrypt:base64String andSecretKey:key];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\0" withString:@""];

    NSDictionary *dict = [CCPAESTool dictionaryWithJsonString:jsonString];
    
    return dict;
    
}

/**
 *  AES 加密 解密
 */

+(NSString *)AES128Encrypt:(NSString *)plainText andSecretKey:(NSString *)secretKeys
{
   char keyPtr[kCCKeySizeAES128+1];//
   memset(keyPtr, 0, sizeof(keyPtr));
   [secretKeys getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];

   NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
   NSUInteger dataLength = [data length];

   size_t bufferSize = dataLength + kCCBlockSizeAES128; void *buffer = malloc(bufferSize);
   size_t numBytesEncrypted = 0;
   CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                         kCCAlgorithmAES128,
                                         kCCOptionPKCS7Padding|kCCOptionECBMode,
                                         keyPtr,
                                         kCCBlockSizeAES128,
                                         NULL,
                                         [data bytes],
                                         dataLength,
                                         buffer,
                                         bufferSize, &numBytesEncrypted); if (cryptStatus == kCCSuccess) {
       NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];

       NSString *stringBase64 = [resultData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed]; // base64格式的字符串
       return stringBase64;

   }
   free(buffer); return nil;
}


+ (NSString *)AES128Decrypt:(NSString *)encryptText andSecretKey:(NSString *)secretKeys
{
  char keyPtr[kCCKeySizeAES128 + 1];
  memset(keyPtr, 0, sizeof(keyPtr));
  [secretKeys getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];

  NSData *data = [[NSData alloc] initWithBase64EncodedString:encryptText options:NSDataBase64DecodingIgnoreUnknownCharacters];//base64解码

  NSUInteger dataLength = [data length];
  size_t bufferSize = dataLength + kCCBlockSizeAES128; void *buffer = malloc(bufferSize);

  size_t numBytesCrypted = 0;
  CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                        kCCAlgorithmAES128,
                                        kCCOptionPKCS7Padding|kCCOptionECBMode,
                                        keyPtr,
                                        kCCBlockSizeAES128,
                                        NULL,
                                        [data bytes],
                                        dataLength,
                                        buffer,
                                        bufferSize, &numBytesCrypted); if (cryptStatus == kCCSuccess) {
      NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted]; return [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
  }
  free(buffer); return nil;
}


+ (NSString*)dictionaryToJson:(NSMutableDictionary *)dic {
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    
    return dic;
    
}

@end
