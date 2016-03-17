//
//  SAViewController.h
//  WeatherApp
//
//  Created by SalahAldin Ghanim on 3/16/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "SAWeatherButton.h"

@interface SAViewController : UIViewController
@property (weak, nonatomic) IBOutlet SAWeatherButton *button;
- (IBAction)didClickGetWeather:(id)sender;


@end
