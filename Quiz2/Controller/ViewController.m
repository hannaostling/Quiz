//
//  ViewController.m
//  Quiz2
//
//  Created by Hanna Östling on 2018-02-12.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

#import "ViewController.h"
#import "QuizModel.h"
#import "ShuffleQuestion.h"
#import "ResultsViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel * questionLabel;
@property (weak, nonatomic) IBOutlet UIButton * ButtonA;
@property (weak, nonatomic) IBOutlet UIButton * ButtonB;
@property (weak, nonatomic) IBOutlet UIButton * ButtonC;
@property (weak, nonatomic) IBOutlet UIButton * ButtonD;
@property (nonatomic) QuizModel * model;
@property (nonatomic) Question * activeQuestion;
@property (nonatomic) NSTimer * timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self nextQuestion];
    [self toggleButtons];
}

- (void) toggleButtons {
    _ButtonA.layer.cornerRadius = 10;
    _ButtonB.layer.cornerRadius = 10;
    _ButtonC.layer.cornerRadius = 10;
    _ButtonD.layer.cornerRadius = 10;
    [_ButtonA setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8]];
    [_ButtonB setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8]];
    [_ButtonC setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8]];
    [_ButtonD setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8]];
}

- (void) startNewGame {
    self.model = [[QuizModel alloc] init];
    [self nextQuestion];
}

- (QuizModel *) model {
    if (!_model) {
        _model = [[QuizModel alloc] init];
    }
    return _model;
}

- (NSArray *) buttons {
    return @[self.ButtonA, self.ButtonB, self.ButtonC, self.ButtonD];
}

- (void)nextQuestion {
    if (self.model.numberOfAnsweredQuestions < 5) {
        [self presentNextQuestion];
    } else {
        [self performSegueWithIdentifier:@"Results" sender:self];
    }
}

- (void) presentNextQuestion {
    self.activeQuestion = [self.model pickRandomQuestion];
    if (self.activeQuestion) {
        self.questionLabel.text = self.activeQuestion.text;
        NSArray * shuffledAlternatives = [self.activeQuestion.alternatives shuffled];
        for(int i = 0; i < self.buttons.count; i++) {
            UIButton * button = self.buttons[i];
            [button setTitle:shuffledAlternatives[i] forState:UIControlStateNormal];
        }
        [self setButtonsEnabledState:YES];
    } else {
        self.questionLabel.text = @"Slut på frågor!";
    }
    [self toggleButtons];
}

- (IBAction) onButtonClick:(UIButton *) button {
    [self setButtonsEnabledState:NO];
    self.questionLabel.text = [NSString stringWithFormat:@"Rätt svar är: %@", self.activeQuestion.correctAnswer];
    [NSTimer scheduledTimerWithTimeInterval:2.0 repeats:NO block:^(NSTimer * _Nonnull timer) { [self nextQuestion];}];
    if ([self.activeQuestion isCorrect:button.titleLabel.text]) {
        [button setBackgroundColor:[UIColor colorWithRed:0.74 green:0.95 blue:0.71 alpha:1.0]];
        self.model.numberOfCorrectAnswers++;
    } else {
        [button setBackgroundColor:[UIColor colorWithRed:0.91 green:0.84 blue:0.84 alpha:1.0]];
    }
}

- (void) setButtonsEnabledState:(BOOL)enabled {
    for (UIButton *button in self.buttons) {
        button.enabled = enabled;
    }
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *) segue sender:(id)sender {
    ResultsViewController * resultsVC = segue.destinationViewController;
    resultsVC.model = self.model;
    resultsVC.delegate = self;
}

@end
