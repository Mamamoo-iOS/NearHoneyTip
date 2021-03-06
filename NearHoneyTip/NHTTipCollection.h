//
//  NHTTipCollection.h
//  NearHoneyTip
//
//  Created by Kate KyuWon on 11/30/15.
//  Copyright © 2015 Mamamoo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NHTTip;

@interface NHTTipCollection : NSObject

@property(strong, nonatomic) NSMutableArray* tips;
@property(strong, nonatomic) NSMutableArray* tipsForSearch;

-(id) init;
-(void) addTip: (NSDictionary*) tip;
-(void) addMyTip: (NSDictionary*) tip;
-(NSInteger)countOfTips;
-(NSObject*)objectAtIndex:(NSUInteger)index;
//-(BOOL)containsTip:(NSDictionary*)newTip;


-(NSArray*)filteredArrayUsingPredicate:(NSPredicate *)predicate;
@end
