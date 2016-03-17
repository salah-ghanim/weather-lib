//
//  SAForecastTableViewCellContent.h
//  WeatherApp
//
//  Created by SalahAldin Ghanim on 3/17/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WeatherLib/WeatherLib.h>

@interface SAForecastTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;
@property (retain, nonatomic) SAWeatherForecast* forecast;

@end
