#import "Blocks.h"

@interface Blocks ()

@property (nonatomic, copy) NSArray *array;

@end

@implementation Blocks

- (BlockA)blockA {
    return [^(NSArray *array) {
        self.array = array;
    } copy];
}

- (BlockB)blockB {
    return [^(Class class) {
        NSMutableArray *resultArray = [self.array mutableCopy];
        
        [resultArray removeObjectIdenticalTo:[NSNull null]];
        [resultArray filterUsingPredicate:[NSPredicate predicateWithFormat: @"self isKindOfClass: %@", class]];
        
        if (class == [NSString class]) {
            self.blockC([resultArray componentsJoinedByString:@""]);
        } else if (class == [NSNumber class]) {
            self.blockC([resultArray valueForKeyPath:@"@sum.self"]);
        } else if (class == [NSDate class]) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"dd.MM.yyyy"];
            
            [resultArray sortedArrayUsingDescriptors:@[[[NSSortDescriptor alloc] initWithKey:nil ascending:YES]]];
            
            self.blockC([dateFormatter stringFromDate:resultArray.firstObject]);
        }
        
    } copy];
}


@end

