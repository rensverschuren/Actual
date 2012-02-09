//
//  Item.h
//  Actual
//
//  Created by Rens Verschuren on 07-02-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Item : NSManagedObject

- (void)awakeFromInsert;

@end
