//
//  SACityLabel.h
//  WeatherApp
//
//  Created by SalahAldin Ghanim on 3/17/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WeatherLib/WeatherLib.h>
@interface SACityLabel : UILabel
@property (nonatomic, retain) SACity* city;
@end
