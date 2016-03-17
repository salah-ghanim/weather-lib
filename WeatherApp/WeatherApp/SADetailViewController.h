//
//  SADetailViewController.h
//  WeatherApp
//
//  Created by SalahAldin Ghanim on 3/16/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WeatherLib/WeatherLib.h>
#import "SACityLabel.h"

@interface SADetailViewController : UITableViewController
@property (weak, nonatomic) IBOutlet SACityLabel *cityLabel;
@property (retain, atomic) SAWeatherReport* weatherReport;
@end
