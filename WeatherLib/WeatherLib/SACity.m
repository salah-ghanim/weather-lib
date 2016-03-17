//
//  SACity.m
//  WeatherLib
//
//  Created by SalahAldin Ghanim on 3/17/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import "SACity.h"
#import "api_constants.h"

@implementation SACity

- (instancetype) initWithJSON:(NSDictionary *) json
{
    self =  [super init];
    if (self){
        _name = [json objectForKey:WEATHER_CITY_NAME];
        NSDictionary* coord = [json objectForKey:WEATHER_COORDINATES];
        double lat = [[coord objectForKey:WEATHER_LATITUDE] doubleValue];
        double lng = [[coord objectForKey:WEATHER_LONGITUDE] doubleValue];

        _location = [[SALocation alloc] initWithLatitude:lat longitude:lng];
        _countryCode = [json objectForKey:WEATHER_COUNTRY];
    }
    return self;
}

- (instancetype) initWithName:(NSString *)name WithLocation:(SALocation *)location andCountryCode:(NSString *)code
{
    self = [super init];
    if (self){
        _name = name;
        _location = location;
        _countryCode = code;
    }
    return self;
}
@end
