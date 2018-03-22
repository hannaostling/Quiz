//
//  Question.m
//  Quiz2
//
//  Created by Hanna Östling on 2018-02-12.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

#import "Question.h"

@implementation Question

+ (Question *) question:(NSString *) text alternatives:(NSArray *) alts answer:(NSString *) answer {
    Question *newQuestion = [[Question alloc] init];
    newQuestion.text = text;
    newQuestion.alternatives = alts;
    newQuestion.correctAnswer = answer;
    return newQuestion;
}

- (BOOL)isCorrect:(NSString *) answer {
    return [answer isEqualToString:self.correctAnswer];
}

@end
