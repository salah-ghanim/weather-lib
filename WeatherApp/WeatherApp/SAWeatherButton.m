//
//  SAWeatherButton.m
//  WeatherApp
//
//  Created by SalahAldin Ghanim on 3/16/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import "SAWeatherButton.h"
#import <WeatherLib/WeatherLib.h>
@interface SAWeatherButton()<SAWeatherAvailabilityDelegate>
- (void) availabilityChanged:(BOOL)available;

@property (atomic) BOOL requestRunning;
@end

@implementation SAWeatherButton


- (void) willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    [[SAWeather sharedInstance] setAvailabilityDelegate:self];
    [self availabilityChanged:[[SAWeather sharedInstance] serviceAvailable]];
}


- (void) availabilityChanged:(BOOL)available {
    if (self.requestRunning) return;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!available){
            [self setTitle:@"Service Unavailable" forState:UIControlStateDisabled];
        }
        [self setEnabled:available];
    });

}

- (void) didStartWeatherRequest
{
    _requestRunning = YES;
    [self setTitle:@"Getting Weather ..." forState:UIControlStateDisabled];
    [self setEnabled:NO];

}

- (void) didFinishWeatherRequest
{
    
    _requestRunning = NO;
    [self setEnabled:YES];

    BOOL aval = [[SAWeather sharedInstance] serviceAvailable];
    if (aval != self.enabled) {
        [self availabilityChanged:aval];
    }
}

@end
