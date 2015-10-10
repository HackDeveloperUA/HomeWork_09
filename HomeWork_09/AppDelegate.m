
#import "AppDelegate.h"
#import "ASPatient.h"
#import "ASDoctor.h"
#import "ASBadDoctor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ASPatient* patient1 = [[ASPatient alloc] initWithName:@"Andrew"];
    ASPatient* patient2 = [[ASPatient alloc] initWithName:@"Artem"];
    ASPatient* patient3 = [[ASPatient alloc] initWithName:@"Oleg"];
    ASPatient* patient4 = [[ASPatient alloc] initWithName:@"Jeka"];
    ASPatient* patient5 = [[ASPatient alloc] initWithName:@"Jacob"];
    
    ASPatient* patient6  = [[ASPatient alloc] initWithName:@"Michael"];
    ASPatient* patient7  = [[ASPatient alloc] initWithName:@"William"];
    ASPatient* patient8  = [[ASPatient alloc] initWithName:@"Tyler"];
    ASPatient* patient9  = [[ASPatient alloc] initWithName:@"David"];
    ASPatient* patient10 = [[ASPatient alloc] initWithName:@"Nicholas"];
    
    ASDoctor*    doctor     = [[ASDoctor alloc]    initWithName:@"Mr.Doctor"];
    ASBadDoctor* badDoctor1 = [[ASBadDoctor alloc] initWithName:@"Mr.Bad Doctor1"];
    ASBadDoctor* badDoctor2 = [[ASBadDoctor alloc] initWithName:@"Mr.Bad Doctor2"];

    NSArray* doctorArray = [NSArray arrayWithObjects:doctor,badDoctor1,badDoctor2, nil];

    NSArray* arrayForPatient = [NSArray arrayWithObjects:patient1,patient2,patient3,patient4,
                                                         patient5,patient6,patient7,patient8,
                                                         patient9,patient10, nil];

    
    NSLog(@" *********** THE DAY ONE *********** \n");
    
    for (id obj in arrayForPatient) {
        // cлучайно выбираем доктора
        NSUInteger randomDoctor = arc4random() % [doctorArray count];
       
        [obj setIDDoctor:randomDoctor];
        [obj setDelegate:[doctorArray objectAtIndex:randomDoctor]];
        [obj worse];
    }
    
    
    for (id obj in doctorArray)
        [obj report];
   
    // Если доктор не понравился пациенту , то меняем его
    for (ASPatient* obj in arrayForPatient) {
       
        if (obj.ratingForDoctor > ASDontNowThisDoctor && obj.ratingForDoctor < ASGood) {
        
            NSUInteger newDoctor;
            
            do { newDoctor = arc4random() % [doctorArray count];
               } while (newDoctor == [obj IDDoctor]);
            
            [obj setDelegate:[doctorArray objectAtIndex:newDoctor]];
            NSLog(@" Доктора ПОМЕНЯЛИ !!!!!!");
        }
    }
   
    
    NSLog(@" *********** THE DAY TWO *********** \n");

    for (id obj in arrayForPatient) {
        [obj worse];
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
