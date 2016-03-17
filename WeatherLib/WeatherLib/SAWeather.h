//
//  SAWeather.h
//  WeatherLib
//
//  Created by SalahAldin Ghanim on 3/16/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SAWeatherReport.h"

FOUNDATION_EXPORT NSString *const SAWeatherErrorDomain;

typedef void (^WeatherResultBlock)(SAWeatherReport* result, NSError* error);

typedef enum SAWeatherErrorCode {
    SAWeatherErrorUndefined = 0,
    SAWeatherErrorMissingKey,
    SAWeatherErrorInvalidKey,
    SAWeatherErrorConnectivity,
    SAWeatherErrorInvalidResponse
} SAWeatherErrorCode;

@protocol SAWeatherAvailabilityDelegate <NSObject>

- (void) availabilityChanged:(BOOL) available;

@end

@interface  SAWeather: NSObject
@property (retain, atomic, readonly) NSString* apiKey;
@property (atomic, readonly) BOOL serviceAvailable;
@property (atomic, weak) id<SAWeatherAvailabilityDelegate> availabilityDelegate;
@property (atomic, retain, readonly) SAWeatherReport* lastReport;
+ (instancetype) sharedInstance;
- (void) initWithKey:(NSString *) key;
- (void) getWeather:(WeatherResultBlock) resultBlock;

@end

