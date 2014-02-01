//
//  TTDoctor.m
//  Delegate
//
//  Created by sergey on 2/1/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTDoctor.h"

@implementation TTDoctor

- (id)initDoctorWithName:(NSString *)name {

    if (self = [super init]) {
        _doctorName = name;
        _report = [[[NSMutableDictionary alloc]init]autorelease];
    }
    
    return self;
}

- (void)patientBad:(TTPatient *)patient problemPlace:(TTProblem)problem{
    
    NSLog(@"name = %@ temperature = %f",patient.name , patient.temperature);

    
    if ((patient.temperature < 35.9f) || (patient.temperature > 37.f && patient.temperature < 38.f)) {
        [patient takePill];
        
    } else if (patient.temperature > 38.f ) {
        [patient makeInjection];
        
    } else if (problem == TTProblemLeg) {
        [patient takeRoentgen];
        
    } else if (problem == TTProblemHead) {
        [patient takePill];
        
    } else if (problem == TTProblemAbdomen) {
        [patient takePill];
        
    } else {
        [patient pretender];
        
    }
    
    [self.report setObject:patient forKey:[NSString stringWithFormat:@"%d",problem]];
}
@end
