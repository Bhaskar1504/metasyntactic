// Copyright 2008 Cyrus Najmabadi
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "SettingsViewController.h"

#import "Application.h"
#import "AlertUtilities.h"
#import "ColorCache.h"
#import "CreditsViewController.h"
#import "DateUtilities.h"
#import "DVDFilterViewController.h"
#import "GlobalActivityIndicator.h"
#import "Location.h"
#import "LocationManager.h"
#import "LocationUtilities.h"
#import "AppDelegate.h"
#import "Controller.h"
#import "Model.h"
#import "NetflixThemeViewController.h"
#import "ScoreProviderViewController.h"
#import "SearchDatePickerViewController.h"
#import "SettingCell.h"
#import "SettingsNavigationController.h"
#import "TextFieldEditorViewController.h"
#import "UserLocationCache.h"
#import "Utilities.h"

@interface SettingsViewController()
@property (assign) SettingsNavigationController* navigationController;
@end


@implementation SettingsViewController

@synthesize navigationController;

- (void) dealloc {
    self.navigationController = nil;

    [super dealloc];
}


- (Model*) model {
    return navigationController.model;
}


- (Controller*) controller {
    return navigationController.controller;
}


- (id) initWithNavigationController:(SettingsNavigationController*) controller {
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        self.navigationController = controller;

        NSString* appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
        NSString* appVersion = [Model version];
        appVersion = [appVersion substringToIndex:[appVersion rangeOfString:@"." options:NSBackwardsSearch].location];

        self.title = [NSString stringWithFormat:@"%@ v%@", appName, appVersion];
    }

    return self;
}


- (void) majorRefresh {
    self.tableView.rowHeight = 42;
    [self.tableView reloadData];
}


- (void) minorRefresh {
    [self majorRefresh];
}


- (void) viewWillAppear:(BOOL) animated {
    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:animated];
    [self.controller.locationManager addLocationSpinner:self.navigationItem];

    [self majorRefresh];
}


- (NSInteger) numberOfSectionsInTableView:(UITableView*) tableView {
    return 5;
}


- (NSInteger)     tableView:(UITableView*) tableView
      numberOfRowsInSection:(NSInteger) section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 8;
    } else if (section == 2) {
        return 1;
    } else if (section == 3) {
        if (self.model.dvdBlurayEnabled) {
            return 2;
        } else {
            return 1;
        }
    } else if (section == 4) {
        if (self.model.netflixEnabled) {
            return 2;
        } else {
            return 1;
        }
    }

    return 0;
}


- (UITableViewCell*) cellForHeaderRow:(NSInteger) row {
    UITableViewCell* cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    //NSString* text = [NSString stringWithFormat:@"%@ / %@", NSLocalizedString(@"Send Feedback", nil), NSLocalizedString(@"Write Review", nil)];
    NSString* text = [NSString stringWithFormat:@"%@ / %@", NSLocalizedString(@"Send Feedback", nil), NSLocalizedString(@"Vote for Icon", nil)];
    cell.text = text;

    return cell;
}


- (UITableViewCell*) createToggleCellWithText:(NSString*) text
                                           on:(BOOL) on
                                     selector:(SEL) selector {
    UITableViewCell* cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.font = [UIFont boldSystemFontOfSize:16];

    UISwitch* picker = [[[UISwitch alloc] initWithFrame:[UIScreen mainScreen].applicationFrame] autorelease];
    cell.accessoryView = picker;

    [picker addTarget:self action:selector forControlEvents:UIControlEventValueChanged];
    picker.on = on;
    cell.text = text;

    return cell;
}


- (UITableViewCell*) createSettingCellWithKey:(NSString*) key
                                        value:(NSString*) value
                                  placeholder:(NSString*) placeholder {
    static NSString* reuseIdentifier = @"reuseIdentifier";
    SettingCell* cell = (id)[self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[[SettingCell alloc] initWithFrame:CGRectZero
                                   reuseIdentifier:reuseIdentifier] autorelease];
    }

    cell.placeholder = placeholder;
    [cell setKey:key value:value hideSeparator:NO];

    return cell;
}


- (UITableViewCell*) createSettingCellWithKey:(NSString*) key
                                        value:(NSString*) value {
    return [self createSettingCellWithKey:key value:value placeholder:@""];
}


- (UITableViewCell*) cellForSettingsRow:(NSInteger) row {
    if (row >= 0 && row <= 3) {
        NSString* key = @"";
        NSString* value = @"";
        NSString* placeholder = @"";
        if (row == 0) {
            key = NSLocalizedString(@"Location", nil);
            Location* location = [self.model.userLocationCache locationForUserAddress:self.model.userAddress];
            if (location.postalCode.length == 0) {
                value = self.model.userAddress;
            } else {
                value = location.postalCode;
            }
            placeholder = NSLocalizedString(@"Tap to enter location", nil);
        } else if (row == 1) {
            key = NSLocalizedString(@"Search Distance", nil);

            if (self.model.searchRadius == 1) {
                value = ([Application useKilometers] ? NSLocalizedString(@"1 kilometer", nil) : NSLocalizedString(@"1 mile", nil));
            } else {
                value = [NSString stringWithFormat:NSLocalizedString(@"%d %@", @"5 kilometers or 5 miles"),
                         self.model.searchRadius,
                         ([Application useKilometers] ? NSLocalizedString(@"kilometers", nil) : NSLocalizedString(@"miles", nil))];
            }
        } else if (row == 2) {
            key = NSLocalizedString(@"Search Date", @"This is noun, not a verb. It is the date we are getting movie listings for.");

            NSDate* date = self.model.searchDate;
            if ([DateUtilities isToday:date]) {
                value = NSLocalizedString(@"Today", nil);
            } else {
                value = [DateUtilities formatLongDate:date];
            }
        } else if (row == 3) {
            key = NSLocalizedString(@"Reviews", nil);
            value = self.model.currentScoreProvider;
        }

        return [self createSettingCellWithKey:key value:value placeholder:placeholder];
    } else if (row >= 4 && row <= 7) {
        NSString* text;
        BOOL on;
        SEL selector;
        if (row == 4) {
            text = NSLocalizedString(@"Auto-Update Location", @"This string has to be small enough to be visible with a picker switch next to it.  It means 'automatically update the user's location with GPS information'");
            on = self.model.autoUpdateLocation;
            selector = @selector(onAutoUpdateChanged:);
        } else if (row == 5) {
            text = NSLocalizedString(@"Prioritize Bookmarks", @"This string has to be small enough to be visible with a picker switch next to it.  It means 'sort bookmarked movies at the top of all lists'");
            on = self.model.prioritizeBookmarks;
            selector = @selector(onPrioritizeBookmarksChanged:);
        } else if (row == 6) {
            text = NSLocalizedString(@"Screen Rotation", nil);
            on = self.model.screenRotationEnabled;
            selector = @selector(onScreenRotationEnabledChanged:);
        } else if (row == 7) {
            text = NSLocalizedString(@"Use Small Fonts", @"This string has to be small enough to be visible with a picker switch next to it");
            on = self.model.useSmallFonts;
            selector = @selector(onUseSmallFontsChanged:);
        }/* else if (row == 8) {
            text = NSLocalizedString(@"Delay Poster Loading", @"This string has to be small enough to be visible with a picker switch next to it");
            on = self.model.delayPosterLoading;
            selector = @selector(onDelayPosterLoadingChanged:);
        }
         */

        return [self createToggleCellWithText:text on:on selector:selector];
    }

    return nil;
}


- (UITableViewCell*) cellForUpcomingRow:(NSInteger) row {
    return [self createToggleCellWithText:NSLocalizedString(@"Enabled", nil)
                                       on:self.model.upcomingEnabled
                                 selector:@selector(onUpcomingEnabledChanged:)];
}


- (UITableViewCell*) cellForDvdBlurayRow:(NSInteger) row {
    if (row == 0) {
        return [self createToggleCellWithText:NSLocalizedString(@"Enabled", nil)
                                           on:self.model.dvdBlurayEnabled
                                     selector:@selector(onDvdBlurayEnabledChanged:)];
    } else {
        NSString* key = NSLocalizedString(@"Show", nil);;
        NSString* value = @"";

        if (self.model.dvdMoviesShowBoth) {
            value = NSLocalizedString(@"Both", nil);
        } else if (self.model.dvdMoviesShowOnlyDVDs) {
            value = NSLocalizedString(@"DVD Only", nil);
        } else if (self.model.dvdMoviesShowOnlyBluray) {
            value = NSLocalizedString(@"Blu-ray Only", nil);
        } else {
            value = NSLocalizedString(@"Neither", nil);
        }

        return [self createSettingCellWithKey:key value:value];
    }
}


- (UITableViewCell*) cellForNetflixRow:(NSInteger) row {
    if (row == 0) {
        return [self createToggleCellWithText:NSLocalizedString(@"Enabled", nil)
                                           on:self.model.netflixEnabled
                                     selector:@selector(onNetflixEnabledChanged:)];
    } else {
        return [self createSettingCellWithKey:NSLocalizedString(@"Theme", nil)
                                        value:self.model.netflixTheme];
    }
}


- (UITableViewCell*) tableView:(UITableView*) tableView
          cellForRowAtIndexPath:(NSIndexPath*) indexPath {
    if (indexPath.section == 0) {
        return [self cellForHeaderRow:indexPath.row];
    } else if (indexPath.section == 1) {
        return [self cellForSettingsRow:indexPath.row];
    } else if (indexPath.section == 2) {
        return [self cellForUpcomingRow:indexPath.row];
    } else if (indexPath.section == 3) {
        return [self cellForDvdBlurayRow:indexPath.row];
    } else {
        return [self cellForNetflixRow:indexPath.row];
    }
}


- (void) onNetflixEnabledChanged:(id) sender {
    [self.controller setNetflixEnabled:!self.model.netflixEnabled];

    if (self.model.netflixEnabled) {
        NSString* message = NSLocalizedString(@"This is the first release of Netflix support in Now Playing. Please help improve Now Playing by reporting any issues you find using the 'Send Feedback' button above.\n\nWi-fi access is recommended when using Netflix the first time.\n\nThanks!\n\nThe Management (a.k.a. Cyrus)", nil);
        [AlertUtilities showOkAlert:message];
    }
}


- (void) onUpcomingEnabledChanged:(id) sender {
    [self.controller setUpcomingEnabled:!self.model.upcomingEnabled];
}


- (void) onDvdBlurayEnabledChanged:(id) sender {
    [self.controller setDvdBlurayEnabled:!self.model.dvdBlurayEnabled];
}


- (void) onAutoUpdateChanged:(id) sender {
    [self.controller setAutoUpdateLocation:!self.model.autoUpdateLocation];
}


- (void) onUseSmallFontsChanged:(id) sender {
    [self.model setUseSmallFonts:!self.model.useSmallFonts];
}


- (void) onPrioritizeBookmarksChanged:(id) sender {
    [self.model setPrioritizeBookmarks:!self.model.prioritizeBookmarks];
}


- (void) pushSearchDatePicker {
    SearchDatePickerViewController* pickerController =
    [SearchDatePickerViewController pickerWithNavigationController:navigationController
                                                            object:self
                                                          selector:@selector(onSearchDateChanged:)];

    [navigationController pushViewController:pickerController animated:YES];
}


- (void) onSearchDateChanged:(NSString*) dateString {
    [navigationController.controller setSearchDate:[DateUtilities dateWithNaturalLanguageString:dateString]];
}


- (void) pushFilterDistancePicker {
    NSArray* values = [NSArray arrayWithObjects:
                       @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                       @"10", @"15", @"20", @"25", @"30",
                       @"35", @"40", @"45", @"50", nil];
    NSString* defaultValue = [NSString stringWithFormat:@"%d", self.model.searchRadius];

    PickerEditorViewController* controller =
    [[[PickerEditorViewController alloc] initWithController:self.navigationController
                                                      title:NSLocalizedString(@"Search Distance", nil)
                                                       text:NSLocalizedString(@"Theater providers often limit the maximum search distance they will provide data for. As a result, some theaters may not show up for you even if your search distance is set high.", nil)
                                                     object:self
                                                   selector:@selector(onSearchRadiusChanged:)
                                                     values:values
                                               defaultValue:defaultValue] autorelease];

    [navigationController pushViewController:controller animated:YES];
}


- (void) didSelectCreditsRow:(NSInteger) row {
    CreditsViewController* controller = [[[CreditsViewController alloc] initWithNavigationController:navigationController] autorelease];
    [navigationController pushViewController:controller animated:YES];
}


- (void) didSelectSettingsRow:(NSInteger) row {
    if (row == 0) {
        NSString* message;

        if (self.model.userAddress.length == 0) {
            message = @"";
        } else {
            Location* location = [self.model.userLocationCache locationForUserAddress:self.model.userAddress];
            if (location.postalCode == nil) {
                message = NSLocalizedString(@"Could not find location.", nil);
            } else {
                NSString* country = [[NSLocale currentLocale] displayNameForKey:NSLocaleCountryCode
                                                                          value:location.country];
                if (country == nil) {
                    country = location.country;
                }

                message = [NSString stringWithFormat:@"%@, %@ %@\n%@\nLatitude: %f\nLongitude: %f",
                           location.city,
                           location.state,
                           location.postalCode,
                           country,
                           location.latitude,
                           location.longitude];
            }
        }

        TextFieldEditorViewController* controller =
        [[[TextFieldEditorViewController alloc] initWithController:navigationController
                                                             title:NSLocalizedString(@"Location", nil)
                                                            object:self
                                                          selector:@selector(onUserAddressChanged:)
                                                              text:self.model.userAddress
                                                           message:message
                                                       placeHolder:NSLocalizedString(@"City/State or Postal Code", nil)
                                                              type:UIKeyboardTypeDefault] autorelease];

        [navigationController pushViewController:controller animated:YES];
    } else if (row == 1) {
        [self pushFilterDistancePicker];
    } else if (row == 2) {
        [self pushSearchDatePicker];
    } else if (row == 3) {
        ScoreProviderViewController* controller =
        [[[ScoreProviderViewController alloc] initWithNavigationController:navigationController] autorelease];
        [navigationController pushViewController:controller animated:YES];
    }
}


- (void) didSelectUpcomingRow:(NSInteger) row {

}


- (void) didSelectDvdBlurayRow:(NSInteger) row {
    if (row == 1) {
        DVDFilterViewController* controller = [[[DVDFilterViewController alloc] initWithNavigationController:navigationController] autorelease];
        [navigationController pushViewController:controller animated:YES];
    }
}


- (void) didSelectNetflixRow:(NSInteger) row {
    if (row == 1) {
        NetflixThemeViewController* controller = [[[NetflixThemeViewController alloc] initWithNavigationController:navigationController] autorelease];
        [navigationController pushViewController:controller animated:YES];
    }
}


- (void)            tableView:(UITableView*) tableView
      didSelectRowAtIndexPath:(NSIndexPath*) indexPath {
    if (indexPath.section == 0) {
        [self didSelectCreditsRow:indexPath.row];
    } else if (indexPath.section == 1) {
        [self didSelectSettingsRow:indexPath.row];
    } else if (indexPath.section == 2) {
        [self didSelectUpcomingRow:indexPath.row];
    } else if (indexPath.section == 3) {
        [self didSelectDvdBlurayRow:indexPath.row];
    } else {
        [self didSelectNetflixRow:indexPath.row];
    }
}


- (void) onUserAddressChanged:(NSString*) userAddress {
    userAddress = [userAddress stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    [self.controller setUserAddress:userAddress];
}


- (void) onSearchRadiusChanged:(NSString*) radius {
    [self.controller setSearchRadius:radius.intValue];
    [self.tableView reloadData];
}


- (NSString*)       tableView:(UITableView*) tableView
      titleForHeaderInSection:(NSInteger) section {
    if (section == 2) {
        return NSLocalizedString(@"Upcoming", nil);
    } else if (section == 3) {
        return NSLocalizedString(@"DVD/Blu-ray", nil);
    } else if (section == 4) {
        return NSLocalizedString(@"Netflix", nil);
    }

    return nil;
}


/*
- (UIView*)        tableView:(UITableView*) tableView
       viewForFooterInSection:(NSInteger) section {
    return [[[UIView alloc] init] autorelease];
}

- (CGFloat)          tableView:(UITableView*) tableView
      heightForFooterInSection:(NSInteger) section {
    return -5;
}
 */

@end