//
//  ResultsViewController.m
//  Quiz2
//
//  Created by Hanna Östling on 2018-02-12.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@property (weak, nonatomic) IBOutlet UILabel * result;

@end

@implementation ResultsViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.result.text = [NSString stringWithFormat:@"%d / %d", self.model.numberOfCorrectAnswers, self.model.numberOfAnsweredQuestions];
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) PlayAgain:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate startNewGame];
}

- (IBAction) notPlayAgain:(id)sender {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Varning!"
                                 message:@"Vill du verkligen avsluta?"
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * yes = [UIAlertAction
                           actionWithTitle:@"Avbryt"
                           style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * action){}];
    UIAlertAction * no = [UIAlertAction actionWithTitle:@"OK"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * action) {
                                                    UIApplication * app = [UIApplication sharedApplication];
                                                    [app performSelector:@selector(suspend)];
                                                    exit(0);}];
    [alert addAction:yes];
    [alert addAction:no];
    [self presentViewController:alert animated:YES completion:nil];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
