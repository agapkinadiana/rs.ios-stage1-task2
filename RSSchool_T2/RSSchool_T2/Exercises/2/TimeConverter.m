#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    NSUInteger hoursCondition = [hours intValue];
    NSUInteger minutesCondition = [minutes intValue];
    
    NSDictionary *numbers = @{
        @"1" : @"one", @"2" : @"two", @"3" : @"three", @"4" : @"four",
        @"5" : @"five", @"6" : @"six", @"7" : @"seven", @"8" : @"eight",
        @"9" : @"nine", @"10" : @"ten", @"11" : @"eleven", @"12" : @"twelve",
        @"13" : @"thirteen", @"14" : @"fourteen", @"15" : @"fifteen", @"16" : @"sixteen",
        @"17" : @"seventeen", @"18" : @"eighteen", @"19" : @"nineteen", @"20" : @"twenty",
        @"21" : @"twenty one", @"22" : @"twenty two", @"23" : @"twenty three",
        @"24" : @"twenty four", @"25" : @"twenty five", @"26" : @"twenty six",
        @"27" : @"twenty seven", @"28" : @"twenty eight", @"29" : @"twenty nine"
    };
    
    if (hoursCondition < 0 || hoursCondition > 12 || minutesCondition < 0 || minutesCondition >= 60) {
        return @"";
    }
    
    if ([[minutes substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"0"]) {
        minutes = [NSString stringWithFormat:@"%lu", minutesCondition];
    }
    
    NSString *wordOclock = @"o' clock";
    NSString *wordQuarter = @"quarter";
    NSString *wordHalf = @"half";
    NSString *wordPast = @"past";
    NSString *wordMinutes = @"minutes";
    NSString *wordTo = @"to";
    
    if (minutesCondition <= 30) {
        NSString *convertHoursToWord = [numbers objectForKey:hours];
        NSString *convertMinutesToWord = [numbers objectForKey:minutes];
        
        switch (minutesCondition) {
            case 0:
                return [NSString stringWithFormat:@"%@ %@", convertHoursToWord, wordOclock];
                break;
            case 15:
                return [NSString stringWithFormat:@"%@ %@ %@", wordQuarter, wordPast, convertHoursToWord];
                break;
            case 30:
                return [NSString stringWithFormat:@"%@ %@ %@", wordHalf, wordPast, convertHoursToWord];
                break;
                
            default:
                return [NSString stringWithFormat:@"%@ %@ %@ %@", convertMinutesToWord, wordMinutes, wordPast, convertHoursToWord];
                break;
        }
    }
    else {
        hours = [NSString stringWithFormat:@"%lu", hoursCondition + 1];
        minutes = [NSString stringWithFormat:@"%lu", 60 - minutesCondition];
        
        NSString *convertHoursToWord = [numbers objectForKey:hours];
        NSString *convertMinutesToWord = [numbers objectForKey:minutes];
        
        switch (minutesCondition) {
            case 45:
                return [NSString stringWithFormat:@"%@ %@ %@", wordQuarter, wordTo, convertHoursToWord];
                break;
                
            default:
                return [NSString stringWithFormat:@"%@ %@ %@ %@", convertMinutesToWord, wordMinutes, wordTo, convertHoursToWord];
                break;
        }
    }
    
    return @"";
}
@end
