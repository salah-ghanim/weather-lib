//
//  SACity.h
//  WeatherLib
//
//  Created by SalahAldin Ghanim on 3/17/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SALocation.h"

@interface SACity : NSObject
@property (retain, atomic, readonly) NSString* name;
@property (retain, atomic, readonly) SALocation* location;
@property (retain, atomic, readonly) NSString* countryCode;
- (instancetype) initWithJSON:(NSDictionary *) json;
- (instancetype) initWithName:(NSString *) name WithLocation:(SALocation *) location andCountryCode:(NSString *) code;
@end
