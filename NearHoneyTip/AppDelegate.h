//
//  AppDelegate.h
//  NearHoneyTip
//
//  Created by Kate KyuWon on 11/4/15.
//  Copyright © 2015 Mamamoo. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <ADSupport/ASIdentifierManager.h>
#import <CoreLocation/CoreLocation.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *sUDID;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) CLLocationManager *locationManager;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

- (void)setUserDefault;
- (void)getAdvertisingIdentifier;
- (void)getUserGPS;



@end

