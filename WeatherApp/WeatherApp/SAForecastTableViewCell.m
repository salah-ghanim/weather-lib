//
//  SAForecastTableViewCellContent.m
//  WeatherApp
//
//  Created by SalahAldin Ghanim on 3/17/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import "SAForecastTableViewCell.h"

@implementation SAForecastTableViewCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        _minLabel = (UILabel *) [self viewWithTag:1];
        _maxLabel = (UILabel *) [self viewWithTag:2];
        _tempLabel = (UILabel *) [self viewWithTag:3];

    }
    return self;
}

- (void) setForecast:(SAWeatherForecast *)forecast
{
    _forecast = forecast;
    NSString* minStr = @"";
    NSString* maxStr = @"";
    NSString* tmpStr = @"";
    
    if (forecast){
        minStr = [NSString stringWithFormat:@"Min: %d", [forecast forecastFor:SATemperatureMin]];
        maxStr = [NSString stringWithFormat:@"Max: %d", [forecast forecastFor:SATemperatureMax]];
        
        tmpStr = [NSString stringWithFormat:@"Day: %d\t\tNight:%d\nMorning: %d\t\tEvening:%d", [forecast forecastFor:SATemperatureDay],
                  [forecast forecastFor:SATemperatureNight],
                  [forecast forecastFor:SATemperatureMorning],
                  [forecast forecastFor:SATemperatureEvening]];
        
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tempLabel setText:tmpStr];
        [self.maxLabel setText:maxStr];
        [self.minLabel setText:minStr];
        [self.tempLabel setNeedsDisplay];
        [self setNeedsDisplay];
    });
    
    
}
@end
