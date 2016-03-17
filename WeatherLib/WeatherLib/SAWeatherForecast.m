//
//  SAWeatherForecast.m
//  WeatherLib
//
//  Created by SalahAldin Ghanim on 3/17/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import "SAWeatherForecast.h"
#import "limits.h"
#import "api_constants.h"

@interface SAWeatherForecast()

@property (atomic, readonly) short dayTemp;
@property (atomic, readonly) short nightTemp;
@property (atomic, readonly) short morningTemp;
@property (atomic, readonly) short eveningTemp;
@property (atomic, readonly) short minTemp;
@property (atomic, readonly) short maxTemp;

@end

@implementation SAWeatherForecast

- (instancetype) initWithJSON:(NSDictionary *)json
{
    self = [super init];
    if (self){
        NSDictionary* temp = [json objectForKey:WEATHER_DAY_TEMPRETURES];
        _dayTemp     = [[temp objectForKey:WEATHER_TEMPRETURE_DAY] shortValue];
        _nightTemp   = [[temp objectForKey:WEATHER_TEMPRETURE_NIGHT] shortValue];
        _morningTemp = [[temp objectForKey:WEATHER_TEMPRETURE_MORNING] shortValue];
        _eveningTemp = [[temp objectForKey:WEATHER_TEMPRETURE_EVENING] shortValue];
        _minTemp     = [[temp objectForKey:WEATHER_TEMPRETURE_MIN] shortValue];
        _maxTemp     = [[temp objectForKey:WEATHER_TEMPRETURE_MAX] shortValue];

    }
    return self;
}

- (short) forecastFor:(SATempretureType)type
{
    switch (type) {
        case SATemperatureDay: return self.dayTemp;
        case SATemperatureEvening: return self.eveningTemp;
        case SATemperatureMax: return self.maxTemp;
        case SATemperatureMin: return self.minTemp;
        case SATemperatureMorning: return self.morningTemp;
        case SATemperatureNight: return self.nightTemp;
    }
    return SHRT_MIN;
}

@end
