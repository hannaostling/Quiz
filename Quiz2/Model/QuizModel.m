//
//  QuizModel.m
//  Quiz2
//
//  Created by Hanna Östling on 2018-02-12.
//  Copyright © 2018 Hanna Östling. All rights reserved.
//

#import "QuizModel.h"

@interface QuizModel ()
@property (nonatomic) NSMutableArray *questions;
@end

@implementation QuizModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.questions = @[[Question question:@"Hur många landskap finns det i Sverige?"
                                 alternatives:@[@"20", @"25", @"30", @"35"]
                                       answer:@"25"],
                           [Question question:@"Vad heter Sveriges fjärde största stad?"
                                 alternatives:@[@"Sollentuna", @"Solna", @"Malmö", @"Uppsala"]
                                       answer:@"Uppsala"],
                           [Question question:@"Hur säger man \"Sverige\" på latin?"
                                 alternatives:@[@"Sueci", @"Suecia", @"Scueci", @"Scuecia"]
                                       answer:@"Suecia"],
                           [Question question:@"Vad blir 45x6+9?"
                                 alternatives:@[@"675", @"411", @"279", @"278"]
                                       answer:@"279"],
                           [Question question:@"Vilken karaktär återfinns inte i TV-spelet \"Diddy Kong Racing\"?"
                                 alternatives:@[@"Donkey Kong", @"Diddy Kong", @"Pipsy", @"TT"]
                                       answer:@"Donkey Kong"],
                           [Question question:@"Hur stor andel av den europeiska befolkningen uppskattas ha dött av digerdöden?"
                                 alternatives:@[@"1-10%", @"20-40%", @"30-50%", @"70-90%"]
                                       answer:@"30-50%"],
                           [Question question:@"Napoleon blev inte förgiftad av arsenik, som myten säger. Hur dog han egentligen?"
                                 alternatives:@[@"Lunginflammation", @"Aids", @"Hjärntumör", @"Magsäckscanser"]
                                       answer:@"Magsäckscanser"],
                           [Question question:@"Vilket land var först med att skicka en satelit till rymden?"
                                 alternatives:@[@"Sovjet", @"Frankrike", @"USA", @"Japan"]
                                       answer:@"Sovjet"],
                           [Question question:@"Vilket är namnet på den textbaserade nätverksprotokoll till dagens \"World Wide Web\"?"
                                 alternatives:@[@"Gopher", @"Hamster", @"Chipmunk", @"Guineapig"]
                                       answer:@"Gopher"],
                           [Question question:@"Världens längsta bro finns i Kina. Hur lång är den?"
                                 alternatives:@[@"165 km", @"160 km", @"16 km", @"1600 km"]
                                       answer:@"165 km"],
                           [Question question:@"Vad stämmer om spelet \"The Sims\"?"
                                 alternatives:@[@"Är ett skjutspel", @"Blev stor flopp", @"Är ett bilspel", @"Handlar om vardagslivet"]
                                       answer:@"Handlar om vardagslivet"],
                           [Question question:@"Vad är den kliniska termen för perspekt syn?"
                                 alternatives:@[@"Emmetropi", @"Myopi", @"Hyperopi", @"Eufori"]
                                       answer:@"Emmetropi"],
                           [Question question:@"Vilken sjukdom drabbar sjukdomen katarakt?"
                                 alternatives:@[@"Ögat", @"Magen", @"Huden", @"Örat"]
                                       answer:@"Ögat"],
                           [Question question:@"Vad är en nefrolog specialiserad på?"
                                 alternatives:@[@"Njuren", @"Gallan", @"Levern", @"Centrala nervsystemet"]
                                       answer:@"Njuren"],
                           [Question question:@"Vilken spelutvecklare ligger bakom \"Metal Gear\"-spelen?"
                                 alternatives:@[@"Square-Enix", @"Capcom", @"Namco", @"Konami"]
                                       answer:@"Konami"]
                           ].mutableCopy;
    }
    return self;
}

- (Question *) pickRandomQuestion {
    if (self.questions.count == 0) {
        return nil;
    }
    self.numberOfAnsweredQuestions++;
    int i = arc4random_uniform((int)self.questions.count);
    Question *question = self.questions[i];
    [self.questions removeObjectAtIndex:i];
    return question;
}

@end


