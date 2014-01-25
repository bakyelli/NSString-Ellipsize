
//  Created by Basar Akyelli on 1/25/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import "NSString+Ellipsize.h"

NSString *const Ellipsis =  @"...";

@implementation NSString (Ellipsize)

// A method to truncate a string at a predetermined length and append ellipsis to the end

- (NSString *)stringByEllipsizingAtLength:(NSInteger)lengthlimit preserveWords:(BOOL)preserveWords{
    
    NSInteger currentLength = [self length];
    NSString *result = @"";
    NSString *temp = @"";
    
    if(currentLength <= lengthlimit){ //If the string is already within limits
        return self;
    }
    else if(lengthlimit > 0){ //If the string is longer than the limit, and the limit is larger than 0.
        
        NSInteger newLimitWithoutEllipsis = lengthlimit - [Ellipsis length];
        
        if(preserveWords){
            
            NSMutableArray *wordsSeperated = [[self componentsSeparatedByString:@" "] mutableCopy];
            
            for(NSString *word in wordsSeperated){
                
                if([temp isEqualToString:@""]){
                    temp = word;
                }
                else{
                    temp = [NSString stringWithFormat:@"%@ %@", temp, word];
                }
                
                if([temp length] <= newLimitWithoutEllipsis){
                    result = [temp copy];
                }
                else{
                    return [NSString stringWithFormat:@"%@%@",result,Ellipsis];
                }
            }
        }
        else{
            return [NSString stringWithFormat:@"%@%@", [self substringToIndex:newLimitWithoutEllipsis], Ellipsis];
        }
        
    }
    else{ //if the limit is 0.
        return @"";
    }
    
    return self;
}


@end
