//
//  QuizModel.h
//  Quiz2
//
//  Created by Hanna Östling on 2018-02-12.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface QuizModel : NSObject

@property (nonatomic) int numberOfAnsweredQuestions;
@property (nonatomic) int numberOfCorrectAnswers;

- (Question *) pickRandomQuestion;

@end
