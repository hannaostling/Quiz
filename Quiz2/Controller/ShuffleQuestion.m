//
//  ShuffleQuestion.m
//  Quiz2
//
//  Created by Hanna Östling on 2018-02-12.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

#import "ShuffleQuestion.h"

@implementation NSArray (ShuffleQuestion)

- (NSArray *) shuffled {
    NSMutableArray * origin = self.mutableCopy;
    NSMutableArray * target = [[NSMutableArray alloc] init];
    long count = origin.count;
    
    for(int i = 0; i < count; i++) {
        int r = arc4random_uniform((int)origin.count);
        id element = origin[r];
        [target addObject:element];
        [origin removeObjectAtIndex:r];
    }
    
    return target;
}

@end
