//
//  Schedule.h
//  Actual
//
//  Created by Rens Verschuren on 07-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Schedule : NSManagedObject

@property BOOL monday;
@property BOOL tuesday;
@property BOOL wednesday;
@property BOOL thursday;
@property BOOL friday;
@property BOOL saturday;
@property BOOL sunday;

@property (readonly) BOOL isValid;

- (BOOL)nowIsWithinValidDateRange;
- (BOOL)nowIsWithinValidDailyTimeRange;
- (BOOL)nowisOnWeekDay;
- (BOOL)nowisValidWeek;
- (BOOL)isValid;

@end
