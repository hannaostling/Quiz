//
//  ResultsViewController.h
//  Quiz2
//
//  Created by Hanna Östling on 2018-02-12.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizModel.h"

@protocol NewGameProtocol

- (void) startNewGame;

@end

@interface ResultsViewController : UIViewController

@property (nonatomic) QuizModel * model;
@property (nonatomic) id<NewGameProtocol> delegate;

@end
