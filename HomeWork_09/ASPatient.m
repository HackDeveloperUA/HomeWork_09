#import "ASPatient.h"

@implementation ASPatient

-(BOOL) worse {
    
    
    BOOL isFeelsBad = arc4random() % 2;
    NSLog(@" %@ how are you ? - %@ ", self.name , isFeelsBad ? @"I am fine\n\n\n" : @"I worse");

    if (!isFeelsBad) {
        
        //Случайно выбираем симптом , генерируя индекс симптома из массива
        NSUInteger numberRandomSimpton = arc4random() % [self.simptomsArray count];
        // Записываем симптом из массива в переменную
        NSString*  simptom = [self.simptomsArray objectAtIndex:numberRandomSimpton];
        [self.delegate patientFeelsBad:self andSimptom:simptom];
    }
  return isFeelsBad;
}


-(void) treat:(NSString*)simptom andMedecine:(NSString*) medecine {
    
    NSString* rateForMyDoctor;
    
    NSLog(@" Patient %@, with simptom %@ take: %@",self.name , simptom,medecine);
    self.ratingForDoctor = (ASRatingForDoctor) (arc4random() % (int) ASRating);
   
    
    switch (self.ratingForDoctor) {

        case ASDontNowThisDoctor:
             rateForMyDoctor = @"Dont know this Doctor";
             break;
       
        case ASBad: rateForMyDoctor = @"Bad";
            break;
            
        case ASGood:
            rateForMyDoctor = @"Good";
            break;
            
        case ASWell:
            rateForMyDoctor = @"Well";
            break;
      };

    NSLog(@" My rate for doctor : %@ ", rateForMyDoctor);
    
    NSLog(@" ---------------------------------");
    NSLog(@"\n\n\n");
}

-(instancetype) initWithName : (NSString*) name {
    
    self = [super init];
    if (self) {
        
        self.name = name;
        self.simptomsArray  = [NSArray arrayWithObjects:@"painHead", @"painThoart",@"painFinger",
                                                        @"painHand", @"painLeg",  @"painFoot",nil];
    }
    return self;
}
@end
