//
//  SAWeatherForecast.h
//  WeatherLib
//
//  Created by SalahAldin Ghanim on 3/17/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum SATempretureType  {
    SATemperatureMax,
    SATemperatureMin,
    SATemperatureDay,
    SATemperatureNight,
    SATemperatureMorning,
    SATemperatureEvening,
} SATempretureType;

@interface SAWeatherForecast : NSObject
@property (retain, atomic, readonly) NSDate* date;
@property (retain, atomic, readonly) NSString* weatherName;
@property (retain, atomic, readonly) NSString* weatherDescription;
@property (atomic, readonly) NSInteger pressure;
@property (atomic, readonly) short clouds;
@property (atomic, readonly) float windSpeed;
@property (atomic, readonly) short windDirection;

@property (atomic, readonly) short humidity;
@property (atomic, readonly) short rain;


- (instancetype) initWithJSON:(NSDictionary *) json;
- (short) forecastFor:(SATempretureType) type;

@end
