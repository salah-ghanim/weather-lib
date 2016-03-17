//
//  SAWeatherReport.m
//  WeatherLib
//
//  Created by SalahAldin Ghanim on 3/17/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import "SAWeatherReport.h"

#import "api_constants.h"

@implementation SAWeatherReport

- (instancetype) initWithJSON:(NSDictionary *) json
{
    self = [super init];
    if (self){
        
        NSDictionary* cityDic = [json objectForKey:WEATHER_CITY];
        _city = [[SACity alloc] initWithJSON:cityDic];
        NSArray* forecasts = [json objectForKey:WEATHER_LIST];
        NSMutableArray* forecastArr = [[NSMutableArray alloc] initWithCapacity:forecasts.count];
        
        for (NSDictionary* forecast in forecasts){
            
            SAWeatherForecast* forecastObj = [[SAWeatherForecast alloc] initWithJSON:forecast];
            [forecastArr addObject:forecastObj];
        }
        _forecastArray = forecastArr;
    }
    return self;
}

- (instancetype) initWithCity:(SACity *) city andForecastArray:(NSArray *) forecast
{
    self = [super init];
    if (self){
        
        _city = city;
        _forecastArray = forecast;
    }
    return self;
}

@end
