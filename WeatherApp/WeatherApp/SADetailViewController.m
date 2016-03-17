//
//  SADetailViewController.m
//  WeatherApp
//
//  Created by SalahAldin Ghanim on 3/16/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import "SADetailViewController.h"
#import "SAForecastTableViewCell.h"

@implementation SADetailViewController
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.weatherReport){
        [self.cityLabel setCity:self.weatherReport.city];
    }
}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.weatherReport.forecastArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"weatherCell";
    SAForecastTableViewCell *cell = (SAForecastTableViewCell *) [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[SAForecastTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    
    [cell setForecast:[self.weatherReport.forecastArray objectAtIndex:indexPath.row]];
    return cell;
}
@end
