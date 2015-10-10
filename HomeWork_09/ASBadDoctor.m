#import "ASBadDoctor.h"

@implementation ASBadDoctor 

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
        self.simptomsAndMedecineDict = @{@"painHead"   : @"Dance with tambourine 1",
                                         @"painThoart" : @"Dance with tambourine 2",
                                         @"painFinger" : @"Dance with tambourine 3",
                                         @"painHand"   : @"Dance with tambourine 4",
                                         @"painLeg"    : @"Dance with tambourine 5",
                                         @"painFoot"   : @"Dance with tambourine 6"};
        
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
    
     NSLog(@" The Report of Bad Doctor name %@ %@",self.name, self.reportDict);
    
}

@end
