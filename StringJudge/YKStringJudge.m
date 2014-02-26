#import "YKStringJudge.h"
#import "AppDelegate.h"

#define NUM_OF_MOBILE_PHONE 11

@implementation YKStringJudge

- (NSUInteger)isAllNumber:(NSString *)_string {
    unsigned int lenOfStrValue = [_string length];
    char ch[lenOfStrValue + 1];
    strcpy(ch, [_string cStringUsingEncoding:NSUTF8StringEncoding]);
    // 判断每个字符是否都是数字
    for (int i = 0; i < [_string length]; ++i) {
        // 如果不是就返回0，并退出循环
        if (ch[i] <= '0' && '9' <= ch[i]) {
            return 0;
        } // end if
    } // end for
    return 1;
}

#pragma mark - Mobile Phone
- (NSUInteger)isRightForMobilePhone:(NSString *)_phoneNum {
    // 判断移动电话的第一个字符是否是1，不是就返回0
//    if (1 != [[_phoneNum substringWithRange:NSMakeRange(0, 1)] intValue]) {
//        return 0;
//    }
//    return 1;
    if ( [self isMobileNumber:_phoneNum] ) {
        return 1;
    }else{
        return 0;
    }
    
}

- (NSUInteger)isMobilePhoneNumber:(NSString *)_mobilePhoneNumber {
    // 判断位数
    if ([_mobilePhoneNumber length] != NUM_OF_MOBILE_PHONE) {
        
        //UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入11位手机号码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        //[alert show];
        
        return 0;
        
    } else {
        // 判断是否全是数字
        if (![self isAllNumber:_mobilePhoneNumber]) {

            //UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"手机号码格式错误,应只包含数字" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            //[alert show];
            
            
            return 0;
        } else {
            if (![self isRightForMobilePhone:_mobilePhoneNumber]) {
                
                //UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"手机号码输入有误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                //[alert show];
                
                return 0;
            }
        }
    }
    return 1;
}
// 判断手机号码是否正确的格式
- (BOOL)isMobileNumber:(NSString *)mobileNum {
    
    NSString  *MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    NSString *CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    NSString *CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    NSString *CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    
    NSString  *MOBILENWE = @"^1(4[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CM];
    
    
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CU];
    
    
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CT];
    
    //添加电信 新的手机号码格式字段
    NSPredicate *regextestmobilenew = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILENWE];
  
    if (([regextestmobile  evaluateWithObject:mobileNum] == YES) ||
        ([regextestcm evaluateWithObject:mobileNum] == YES) ||
        ([regextestmobilenew evaluateWithObject:mobileNum] == YES)|| ([regextestct
           evaluateWithObject:mobileNum] == YES) || ([regextestcu 
           evaluateWithObject:mobileNum] == YES )){
        
        return  YES;
        
    } else{
        
        return  NO;
        
    }
}

#pragma mark - Telephone
- (NSUInteger)isTelephoneNumber:(NSString *)_telephoneNumber {
    
    return 1;
}   
//- (NSArray *)componentsSeparatedByString:(NSString *)separator;

#pragma mark - E-Mail
- (NSUInteger)isEMailString:(NSString *)_eMailString {
    NSArray*  arrForEMail = [_eMailString componentsSeparatedByString:@"@"];
    if (2 != [arrForEMail count]) {

//        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入有效的Email地址" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
//        [alert show];
        
        return 0;
    } else {
        NSArray* arrForEMail_half = [[arrForEMail objectAtIndex:1] componentsSeparatedByString:@"."];
        if (2 != [arrForEMail_half count]) {

//            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入有效的Email地址" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
//            [alert show];
            
            return 0;
        }
    }
    return 1;
}
@end
