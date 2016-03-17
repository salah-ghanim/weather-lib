//
//  SACityLabel.m
//  WeatherApp
//
//  Created by SalahAldin Ghanim on 3/17/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import "SACityLabel.h"

@implementation SACityLabel



- (void) setCity:(SACity *)city
{
    _city = city;
    NSString* text = @"";
    if (city){
        
        text = [NSString stringWithFormat:@"%@, %@", city.name, city.countryCode];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setText:text];
    });
}


@end
