//
//  SAViewController.m
//  WeatherApp
//
//  Created by SalahAldin Ghanim on 3/16/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import "SAViewController.h"
#import <WeatherLib/WeatherLib.h>
#import "SADetailViewController.h"

@implementation SAViewController

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowWeather"]){
        SADetailViewController* dv = (SADetailViewController *) [segue destinationViewController];
        [dv setWeatherReport:[[SAWeather sharedInstance] lastReport]];
    }
}


- (IBAction)didClickGetWeather:(id)sender
{
    [self.button didStartWeatherRequest];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    

    [[SAWeather sharedInstance] getWeather:^(SAWeatherReport *result, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            [self.button didFinishWeatherRequest];
            
            if (error || result == NULL){
                
                
                
                UIAlertController* alert = [UIAlertController
                                            alertControllerWithTitle:@"Failed to get Weather Report"
                                            message:@"Something went wrong, we apologize ..."
                                            preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:cancel];
                
                [self presentViewController:alert animated:YES completion:nil];
                
            } else {
                [self performSegueWithIdentifier:@"ShowWeather" sender:self];
            }
        });
        
    }];
}
@end
