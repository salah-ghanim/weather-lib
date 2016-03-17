//
//  api_constants.h
//  WeatherLib
//
//  Created by SalahAldin Ghanim on 3/17/16.
//  Copyright © 2016 Salah. All rights reserved.
// reference http://openweathermap.org/forecast16
//

#ifndef api_constants_h
#define api_constants_h

#define WEATHER_CITY                @"city"
#define WEATHER_CITY_NAME           @"name"
#define WEATHER_COORDINATES         @"coord"
#define WEATHER_LATITUDE            @"lat"
#define WEATHER_LONGITUDE           @"lon"
#define WEATHER_COUNTRY             @"country"
#define WEATHER_LIST                @"list"
#define WEATHER_DAY                 @"dt"
#define WEATHER_DAY_TEMPRETURES     @"temp"
#define WEATHER_TEMPRETURE_MAX      @"max"
#define WEATHER_TEMPRETURE_MIN      @"min"
#define WEATHER_TEMPRETURE_DAY      @"day"
#define WEATHER_TEMPRETURE_NIGHT    @"night"
#define WEATHER_TEMPRETURE_MORNING  @"morn"
#define WEATHER_TEMPRETURE_EVENING  @"eve"
#define WEATHER_PRESSURE            @"pressure"
#define WEATHER_HUMIDITY            @"humidity"
#define WEATHER_DAY_WEATHER         @"weather"
#define WEATHER_DAY_WEATHER_NAME    @"main"
#define WEATHER_DAY_WEATHER_DESC    @"description"
#define WEATHER_WIND_SPEED          @"speed"
#define WEATHER_WIND_DIRECTION      @"deg"
#define WEATHER_CLOUDS              @"clouds"
#define WEATHER_RAIN                @"rain"




//city
//city.id City ID
//city.name City name
//city.coord
//city.coord.lat City geo location, latitude
//city.coord.lon City geo location, longitude
//city.country Country code (GB, JP etc.)
//cod Internal parameter
//message Internal parameter
//cnt Number of lines returned by this API call
//list
//list.dt Time of data forecasted
//list.temp
//list.temp.day Day temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
//list.temp.min Min daily temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
//list.temp.max Max daily temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
//list.temp.night Night temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
//list.temp.eve Evening temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
//list.temp.morn Morning temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
//list.pressure Atmospheric pressure on the sea level, hPa
//list.humidity Humidity, %
//list.weather (more info Weather condition codes)
//list.weather.id Weather condition id
//list.weather.main Group of weather parameters (Rain, Snow, Extreme etc.)
//list.weather.description Weather condition within the group
//list.weather.icon Weather icon id
//list.speed Wind speed. Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
//list.deg Wind direction, degrees (meteorological)
//list.clouds Cloudiness, %


#endif /* api_constants_h */
