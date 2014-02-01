//
//  TTPatient.m
//  Delegate
//
//  Created by sergey on 2/1/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTPatient.h"

@implementation TTPatient

- (id)initPatientWithName:(NSString *)name patientTemperature:(CGFloat)temperature problemPlace:(TTProblem)problem {
    if (self = [super init]) {
        _name = name;
        _temperature = temperature;
        _problemPlace = problem;
    }
    return self;
}

- (BOOL)patientCondition {
    BOOL state = arc4random()%2;

    if (!state){
        [self.delegate patientBad:self problemPlace:self.problemPlace];
    }
    return state;
}

- (void)makeInjection {
    NSLog(@"Doctor %@  say make injection %@",[self.delegate doctorName],self.name);
}

- (void)takePill {
    NSLog(@"Doctor %@  say take pill %@",[self.delegate doctorName],self.name);
}

- (void)pretender {
    NSLog(@"Doctor %@  say pretender exit %@",[self.delegate doctorName],self.name);
}

- (void)giveIceScream {
    NSLog(@"Doctor %@  giving IceScream %@",[self.delegate doctorName],self.name);
}

- (void)giveWrongPill {
    NSLog(@"Doctor %@  giving wrong pill %@",[self.delegate doctorName],self.name);
}

- (void)giveNothing {
    NSLog(@"Doctor %@  giving  nothing %@",[self.delegate doctorName],self.name);
}

- (void)takeRoentgen {
    NSLog(@"Doctor %@  say take roentgen %@",[self.delegate doctorName],self.name);
}

@end
