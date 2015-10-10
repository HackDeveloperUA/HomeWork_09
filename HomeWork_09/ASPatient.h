
#import <Foundation/Foundation.h>
#include <UIKit/UIKit.h>


@protocol ASPatientDelegate;

typedef enum {
    
    ASDontNowThisDoctor = 0,
    ASBad,
    ASGood,
    ASWell,
    ASRating
    
} ASRatingForDoctor;

@interface ASPatient : NSObject

@property (strong, nonatomic) NSString* name;
@property (retain, nonatomic) NSArray*  simptomsArray; // Массив который содержит все симптомы


@property (assign, nonatomic) NSUInteger IDDoctor;
@property (assign, nonatomic) ASRatingForDoctor ratingForDoctor;
@property (weak,   nonatomic) id <ASPatientDelegate> delegate;


// метод говорит , болен пациент или нет
-(BOOL) worse;

// метод лечения
-(void) treat:(NSString*)simptom andMedecine:(NSString*) medecine; 

-(instancetype) initWithName : (NSString*) name;
@end


@protocol ASPatientDelegate <NSObject>

@property (strong, nonatomic) NSString* name;
// словарь с симптомами и способами их лечения
@property (retain, nonatomic) NSDictionary *simptomsAndMedecineDict;

-(void) patientFeelsBad : (ASPatient*) patient andSimptom:(NSString*) simptom;
-(void) report;
@end