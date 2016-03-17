//
//  SAWeather.m
//  WeatherLib
//
//  Created by SalahAldin Ghanim on 3/16/16.
//  Copyright © 2016 Salah. All rights reserved.
//


#import "SAWeather.h"
#define API_URL @"REQUEST_URL"
NSString *const SAWeatherErrorDomain = @"com.salah.weather";
#import "Reachability/Reachability.h"
@interface SAWeather()
@property (retain, atomic) NSString* url;
@property (retain, atomic, readonly) NSString* originalURL;
@property (retain, atomic, readonly) Reachability* reachability;
- (void) performRequestWithURL:(NSURL *) url andResultBlock:(WeatherResultBlock) resultBlock;
- (SAWeatherReport *) parseJSON:(NSData *) response;
- (void) connectivityChanged:(NSNotification *) notification;
@end

@implementation SAWeather

- (instancetype) init
{
    self = [super init];
    if (self){
        _originalURL = (NSString *) [[NSBundle bundleForClass:[self class]] objectForInfoDictionaryKey:API_URL];
        NSString* str = [[_originalURL componentsSeparatedByString:@"?"] firstObject];
        NSURL* url = [NSURL URLWithString:str];
        NSString* host = [url host];
        _reachability = [Reachability reachabilityWithHostName:host];
     //   _reachability = [Reachability reachabilityForInternetConnection];
        [_reachability startNotifier];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(connectivityChanged:) name:kReachabilityChangedNotification object:self.reachability];
        [self connectivityChanged:nil];
    }
    return self;
}

+ (instancetype) sharedInstance
{
    static SAWeather *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[self alloc] init];
    });
    return obj;
}

- (void) getWeather:(WeatherResultBlock)resultBlock
{
    NSError* error = NULL;
    if (self.apiKey){
        if (self.serviceAvailable == NO){
            error = [[NSError alloc] initWithDomain:SAWeatherErrorDomain code:SAWeatherErrorConnectivity userInfo:nil];
            
        } else {
        
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                NSURL* url = [NSURL URLWithString:self.url];
                [self performRequestWithURL:url andResultBlock:resultBlock];
            });
        }
        
    } else {
        error = [[NSError alloc] initWithDomain:SAWeatherErrorDomain code:SAWeatherErrorMissingKey userInfo:nil];
    }

    
   // report error synchronously
    if (resultBlock && error){
        resultBlock(nil, error);
        
    }
}

- (void) performRequestWithURL:(NSURL *) url andResultBlock:(WeatherResultBlock) resultBlock
{
    id completionBlock = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        SAWeatherReport* report = NULL;

        if (response && !error){
            NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse *) response;
            // Invalid response
            if ([httpResponse statusCode] != 200 || [data length] == 0){
                error = [NSError errorWithDomain:SAWeatherErrorDomain code:SAWeatherErrorInvalidResponse userInfo:nil];
            } else {
              
                report = [self parseJSON:data];
                _lastReport = report;
                
            }
            
        } else {
            // connection issue
            error = [NSError errorWithDomain:SAWeatherErrorDomain code:SAWeatherErrorConnectivity userInfo:nil];
        }
        
        if (resultBlock){
            resultBlock(report, error);
        }
    };
    
    NSURLSessionDataTask* task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:completionBlock];
    [task resume];
    
}

- (void) initWithKey:(NSString *)key
{
    _apiKey = key;
    _url = [self.originalURL stringByReplacingOccurrencesOfString:@"@{KEY}" withString:self.apiKey];
    
}


- (SAWeatherReport *) parseJSON:(NSData *) response
{
    NSError* parseError;
    NSDictionary* jsonData = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&parseError];
    if (parseError){
        // invalid JSON
        return NULL;
    }
    //TODO
        
    return [[SAWeatherReport alloc] initWithJSON:jsonData];
}


- (void) connectivityChanged:(NSNotification *)notification
{
    BOOL val = self.serviceAvailable;
    if (self.reachability.currentReachabilityStatus == NotReachable){
        val = NO;
    } else {
        val = YES;
    }
    if (val != self.serviceAvailable){
        [self willChangeValueForKey:@"serviceAvailable"];
        _serviceAvailable = val;
        [self didChangeValueForKey:@"serviceAvailable"];
        if (self.availabilityDelegate){
            [self.availabilityDelegate availabilityChanged:val];
        }
    }
}

- (void) dealloc
{
    [self.reachability stopNotifier];
}

@end
