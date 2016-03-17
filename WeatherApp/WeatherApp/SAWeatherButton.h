//
//  SAWeatherButton.h
//  WeatherApp
//
//  Created by SalahAldin Ghanim on 3/16/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAWeatherButton : UIButton
- (void) didStartWeatherRequest;
- (void) didFinishWeatherRequest;
@end
