#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:[day integerValue]];
    [components setMonth:[month integerValue]];
    [components setYear:[year integerValue]];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    if ([components isValidDateInCalendar:gregorian]) {
        NSDate *date = [gregorian dateFromComponents:components];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale: [[NSLocale alloc] initWithLocaleIdentifier:@"ru"]];
        [dateFormatter setDateFormat:@"d MMMM, EEEE"];
        
        NSString *result = [dateFormatter stringFromDate:date];
        
        return result;
    }
    else {
        return @"Такого дня не существует";
    }
}

@end
