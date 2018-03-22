//
//  Question.h
//  Quiz2
//
//  Created by Hanna Östling on 2018-02-12.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic) NSString * text;
@property (nonatomic) NSArray * alternatives;
@property (nonatomic) NSString * correctAnswer;

+(Question *) question:(NSString*)text alternatives:(NSArray*)alts answer:(NSString*)answer;
-(BOOL)isCorrect:(NSString*)answer;

@end
