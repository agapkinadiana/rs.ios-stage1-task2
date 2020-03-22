#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    
    NSUInteger conditionNumber = [number intValue];
    
    NSUInteger fibPrevious = 0;
    NSUInteger fibCurrent = 1;
    
    while (fibPrevious * fibCurrent < conditionNumber) {
        NSUInteger fibSum = fibPrevious + fibCurrent;
        fibPrevious = fibCurrent;
        fibCurrent = fibSum;
    }
    
    NSArray *result = @[@(fibPrevious), @(fibCurrent), (fibPrevious * fibCurrent == conditionNumber) ? @(1) : @(0)];
    
    return result;
}
@end
