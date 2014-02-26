
#import <Foundation/Foundation.h>

@interface YKStringJudge : NSObject
// 判断是否是正确的手机号码
- (NSUInteger)isMobilePhoneNumber:(NSString *)_mobilePhoneNumber;
// 判断是否是正确的固话号码
- (NSUInteger)isTelephoneNumber:(NSString *)_telephoneNumber;
// 判断是否是正确的E-Mail地址
- (NSUInteger)isEMailString:(NSString *)_eMailString;

@end
