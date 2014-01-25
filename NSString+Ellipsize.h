
//  Created by Basar Akyelli on 1/25/14.
//  Copyright (c) 2014 Basar Akyelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Ellipsize)

- (NSString *)stringByEllipsizingAtLength:(NSInteger)lengthlimit preserveWords:(BOOL)preserveWords;

@end
