#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {

    NSCharacterSet *setOfAlphabet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    
    NSMutableArray<NSString *> *words = [[self componentsSeparatedByString:@" "] mutableCopy];
    [words filterUsingPredicate:[NSPredicate predicateWithFormat:@"length > 0"]];

    NSString *vowels = @"aeiouy";
    NSString *consonants = @"bcdfghjklmnpqrstvwxz";

    
    BOOL isPangram = [[NSCharacterSet characterSetWithCharactersInString:[self lowercaseString]] isSupersetOfSet:setOfAlphabet];

    NSMutableArray<NSString *> *resultArray = [NSMutableArray new];
    
    if (isPangram) {
        for (NSString *word in words) {
            NSMutableString *resultString = [NSMutableString stringWithString:word];
            NSInteger vowelCount = 0;
            for (NSInteger i = 0; i < resultString.length; i++){
                NSString *ch = [[NSString stringWithFormat:@"%c", [word characterAtIndex:i]] lowercaseString];
                if ([vowels containsString:ch]) {
                    vowelCount++;
                    [resultString replaceCharactersInRange:NSMakeRange(i, 1) withString:[ch uppercaseString]];
                }
            }
            [resultArray addObject:[NSString stringWithFormat:@"%lu%@", vowelCount, resultString]];
        }
    } else {
        for (NSString *word in words) {
            NSMutableString *resultString = [NSMutableString stringWithString:word];
            NSInteger consonantsCount = 0;
            for (NSInteger i = 0; i < resultString.length; i++){
                NSString *ch = [[NSString stringWithFormat:@"%c", [word characterAtIndex:i]] lowercaseString];
                if ([consonants containsString:ch]) {
                    consonantsCount++;
                    [resultString replaceCharactersInRange:NSMakeRange(i, 1) withString:[ch uppercaseString]];
                }
            }
            [resultArray addObject:[NSString stringWithFormat:@"%lu%@", consonantsCount, resultString]];
        }
    }
    
    [resultArray sortUsingComparator:^NSComparisonResult (NSString *left, NSString *right) {
        return [[left substringWithRange:NSMakeRange(0, 1)] compare: [right substringWithRange:NSMakeRange(0, 1)]];
    }];
    
    return [NSString stringWithFormat:@"%@", [resultArray componentsJoinedByString:@" "]];
}

@end
