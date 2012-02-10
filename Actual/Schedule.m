//
//  Schedule.m
//  Actual
//
//  Created by Rens Verschuren on 07-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Schedule.h"

@implementation Schedule

@synthesize monday = _monday;
@synthesize tuesday = _tuesday;
@synthesize wednesday = _wednesday;
@synthesize thursday = _thursday;
@synthesize friday = _friday;
@synthesize saturday = _saturday;
@synthesize sunday = _sunday;

//setting all the default values for a schedule
- (void)awakeFromInsert {
    //set every_week to YES
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"every_week"];
    
    //set valid_from and valid_to
    [self setValue:[NSDate date] forKey:@"valid_from"];
    [self setValue:[NSDate date] forKey:@"valid_to"];
    //set valid_from_enabled and valid_to_enabled to NO
    [self setValue:[NSNumber numberWithBool:NO] forKey:@"valid_from_enabled"];
    [self setValue:[NSNumber numberWithBool:NO] forKey:@"valid_to_enabled"];
    
    //set valid daily times
    [self setValue:[NSDate dateWithString:@"1982-02-12 00:00:00 +0100"] forKey:@"daily_from"];
    [self setValue:[NSDate dateWithString:@"1982-02-12 23:59:59 +0100"] forKey:@"daily_to"];
    
    //setting up weeks array
    NSMutableArray *weeks = [NSMutableArray array];
    int i;
    //setting the arrayIndex 0 to 'nothing', to match up the week numbers with the array indexes
    [weeks addObject:[NSString stringWithFormat:@"nothing"]];
    //all weeks to YES
    for (i = 1; i <= 52; i++) {
        [weeks addObject:[NSNumber numberWithBool:YES]];        
    }
    [self setValue:weeks forKey:@"weeks"];    
    
    //set default description text
    [self setValue:@"New schedule" forKey:@"text"];
    
    //schedules are enabled by default
    [self setValue:[NSNumber numberWithBool:YES] forKey:@"enabled"];
}

- (BOOL)nowIsWithinValidDateRange {
    //declaring date objects
    NSDate *now = [NSDate date];   
    NSDate *date_from;
    NSDate *date_to;
    
    //checking if valid_from or valid_to are enabled, when this is the case: return inserted date. 
    //Else: return a date that's in the distant future or past
    date_from = ([self valueForKeyPath:@"valid_from_enabled"]) ? [self valueForKeyPath:@"valid_from"] : [NSDate distantPast];
    date_to = ([self valueForKeyPath:@"valid_to_enabled"]) ? [self valueForKeyPath:@"valid_to"] : [NSDate distantFuture];    
    
    //comparing dates
    NSComparisonResult result1 = [now compare:date_from];
    NSComparisonResult result2 = [now compare:date_to];
    
    //check if 'now' is between two dates
    if(result1 == NSOrderedDescending && result2 == NSOrderedAscending) {          
        return YES;       
    }
    else {
        return NO;        
    }
}

- (BOOL)nowisOnWeekDay {
    //check if 'all days' is enabled, if YES -> return YES
    if([self valueForKeyPath:@"every_day"]) {
        return YES;
    }
    else { //if a specific day or days is/are enabled
        //get now
        NSDate *date = [NSDate date];
        //setting op the calendar
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        //getting the components    
        NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit fromDate:date];
        //getting day of the week
        NSInteger weekday = [components weekday];    
        
        //setting up days array
        NSMutableArray *days = [NSMutableArray array];    
        
        //adding days to the array
        [days addObject:[NSNumber numberWithInt:1]]; //to set the arrayIndex of sunday to 1
        [days addObject:[self valueForKeyPath:@"sunday"]];
        [days addObject:[self valueForKeyPath:@"monday"]];
        [days addObject:[self valueForKeyPath:@"tuesday"]];
        [days addObject:[self valueForKeyPath:@"wednesday"]];
        [days addObject:[self valueForKeyPath:@"thursday"]];
        [days addObject:[self valueForKeyPath:@"friday"]];
        [days addObject:[self valueForKeyPath:@"saturday"]];
        
        NSLog(@"%@", days);
        
        //check if today is valid
        if([[days objectAtIndex:weekday] boolValue]) {        
            return YES;        
        }
        else {        
            return NO;
        }    
    }
}

- (BOOL)nowIsWithinValidDailyTimeRange {
    //check if 'valid in range' or 'not valid in range' is selected
    if([self valueForKey:@"event"] == @"interrupt") {
        return YES;
    }
    else {
        //setting up three dates
        NSDate *now         = [NSDate date];
        NSDate *daily_from  = [self valueForKey:@"daily_from"]; //2012-01-25 10:40:00 +0100
        NSDate *daily_to    = [self valueForKey:@"daily_to"];   //2012-01-25 10:47:00 +0100
        
        //setting op the calendar
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        //getting the date components (hour, minute, second)  
        unsigned units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
        
        //setting the units         
        NSDateComponents *componentsNow         = [gregorian components:units fromDate:now];
        NSDateComponents *componentsDaily_from  = [gregorian components:units fromDate:daily_from];   
        NSDateComponents *componentsDaily_to    = [gregorian components:units fromDate:daily_to];
        
        now         = [gregorian dateFromComponents:componentsNow];
        daily_from  = [gregorian dateFromComponents:componentsDaily_from];
        daily_to    = [gregorian dateFromComponents:componentsDaily_to];        
        
        //comparing dates
        NSComparisonResult result1 = [now compare:daily_from];
        NSComparisonResult result2 = [now compare:daily_to];
        
        //logging...
        NSLog(@"%@", [self valueForKey:@"daily_from"]);
        NSLog(@"%@", [self valueForKey:@"daily_to"]);
        NSLog(@"------------------------");        
        NSLog(@"%@", daily_from);
        NSLog(@"%@", now);
        NSLog(@"%@", daily_to);
        
        //check if 'now' is between two dates (times)
        if(result1 == NSOrderedDescending && result2 == NSOrderedAscending) {        
            NSLog(@"YES");
            return YES;       
        }
        else {
            NSLog(@"NO");
            return NO;        
        }        
    }    
}

- (BOOL)nowisValidWeek {
    //if every_week is enabled
    if([self valueForKey:@"every_week"]) {
        return YES;
    }
    else {
        //get weeks array
        NSArray *weeks = [self valueForKey:@"weeks"];    
        //get now
        NSDate *date = [NSDate date];
        //setting op the calendar
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        //getting the components    
        NSDateComponents *components = [gregorian components:NSWeekCalendarUnit fromDate:date];
        //getting day of the week
        NSInteger week = [components week];    
        
        //checks if current week number is valid
        if([[weeks objectAtIndex:week] boolValue]) {
            return YES;
        }
        else {
            return NO;
        }
    }
}

- (BOOL)isValid {
    //checks if all schedule conditions are true
    if([self nowIsWithinValidDailyTimeRange] && 
       [self nowIsWithinValidDateRange] && 
       [self nowisOnWeekDay] && 
       [self nowisValidWeek]) {
        
        NSLog(@"YES");
        return YES;
    }
    else {
        NSLog(@"NO");
        return NO;
    }
}

@end
