
#import "ASDoctor.h"

@implementation ASDoctor

-(void) patientFeelsBad : (ASPatient*) patient andSimptom:(NSString*) simptom {
    
    NSString* medecine;
    medecine = [self.simptomsAndMedecineDict objectForKey:simptom];
    
    NSLog(@" This %@ ",self.name);
    NSLog(@" The patient %@ is hurts - %@",patient.name , simptom);
    
    
    [[self.reportDict objectForKey:simptom] addObject:patient.name];
    
    [patient treat:simptom andMedecine:medecine];
}

-(instancetype) initWithName : (NSString*) name {
    
    self = [super init];
    if (self) {
        self.name = name;
        self.simptomsAndMedecineDict = @{@"painHead"   : @"Tablet 1",
                                         @"painThoart" : @"Tablet 2",
                                         @"painFinger" : @"Tablet 3",
                                         @"painHand"   : @"Tablet 4",
                                         @"painLeg"    : @"Tablet 5",
                                         @"painFoot"   : @"Tablet 6"};
        
        
        NSArray* arrayForKeySimptoms = [self.simptomsAndMedecineDict allKeys];
        _reportDict = [NSMutableDictionary new];
        
        for (int i = 0; i <= [arrayForKeySimptoms count]-1; ++i) {
        
            NSMutableArray* arrayValue = [NSMutableArray new];
            
            [self.reportDict setObject: arrayValue forKey: [arrayForKeySimptoms objectAtIndex:i]];
        }
        NSLog(@" Creat dictionary for Doctor name =%@  %@", _name, self.reportDict);
    }
    return self;
}


-(void) report {
    
    NSLog(@" The Report of Doctor name %@ %@",self.name, self.reportDict);

}

@end
