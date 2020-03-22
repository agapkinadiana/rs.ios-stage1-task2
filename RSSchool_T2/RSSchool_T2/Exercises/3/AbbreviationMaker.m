#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    NSCharacterSet *validCharSet = [NSCharacterSet characterSetWithCharactersInString:b];
    NSCharacterSet *invertedValidCharSet = [validCharSet invertedSet];
    
    NSString *resultAString = [[[a uppercaseString] componentsSeparatedByCharactersInSet:invertedValidCharSet] componentsJoinedByString:@""];
    
    return [resultAString isEqualToString:b] ? @"YES" : @"NO";
}
@end
