

#import <Foundation/Foundation.h>
#import "ASPatient.h"


@interface ASDoctor : NSObject <ASPatientDelegate>


@property (strong, nonatomic) NSString* name;
@property (retain, nonatomic) NSMutableDictionary *reportDict;
@property (retain, nonatomic) NSDictionary*simptomsAndMedecineDict;

-(void) report;
-(instancetype) initWithName : (NSString*) name;

@end
