//
//  NetflixViewController.m
//  NowPlaying
//
//  Created by Cyrus Najmabadi on 12/13/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "NetflixViewController.h"

#import "AutoResizingCell.h"
#import "ColorCache.h"
#import "GlobalActivityIndicator.h"
#import "NetflixCache.h"
#import "NetflixFeedsViewController.h"
#import "NetflixLoginViewController.h"
#import "NetflixNavigationController.h"
#import "NetflixQueueViewController.h"
#import "NowPlayingModel.h"
#import "Queue.h"

@interface NetflixViewController()
@property (assign) NetflixNavigationController* navigationController;
@end


@implementation NetflixViewController

typedef enum {
    SearchSection,
    BrowseSection,
    DVDSection,
    InstantSection,
    RecommendationsSection,
    AtHomeSection,
    RentalHistorySection,
    LogOutSection,
    LastSection = LogOutSection
} Sections;

@synthesize navigationController;

- (void) dealloc {
    self.navigationController = nil;
    [super dealloc];
}


- (id) initWithNavigationController:(NetflixNavigationController*) navigationController_ {
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        self.navigationController = navigationController_;
        self.title = NSLocalizedString(@"Netflix", nil);
    }
    return self;
}


- (NowPlayingModel*) model {
    return navigationController.model;
}


- (NowPlayingController*) controller {
    return navigationController.controller;
}


- (BOOL) hasAccount {
    return self.model.netflixUserId.length > 0;
}


- (void) majorRefresh {
    self.tableView.rowHeight = 41;
    if ([self.tableView numberOfRowsInSection:0] == 1 &&
        self.hasAccount) {
        [self.tableView beginUpdates];
        {
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationBottom];
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
        }
        [self.tableView endUpdates];
    } else {
        [self.tableView reloadData];
    }
}


- (void) viewWillAppear:(BOOL) animated {
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:[GlobalActivityIndicator activityView]] autorelease];
}


- (void) viewDidAppear:(BOOL)animated {
    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
    [self majorRefresh];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/


// Override to allow orientations other than the default portrait orientation.
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation {
    return YES;
}


- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger) tableView:(UITableView*) tableView numberOfRowsInSection:(NSInteger) section {
    if (self.hasAccount) {
        return LastSection + 1;
    } else {
        return 1;
    }
}


- (NetflixCache*) netflixCache {
    return self.model.netflixCache;
}


- (UITableViewCell*) cellForLoggedInRow:(NSInteger) row {
    AutoResizingCell* cell = [[[AutoResizingCell alloc] initWithFrame:CGRectZero] autorelease];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    if (row == SearchSection) {
        cell.text = NSLocalizedString(@"Search", nil);
    } else if (row == BrowseSection) {
        cell.text = NSLocalizedString(@"Browse", nil);
    } else if (row == DVDSection) {
        cell.text = [self.netflixCache titleForKey:[NetflixCache dvdQueueKey]];
    } else if (row == InstantSection) {
        cell.text = [self.netflixCache titleForKey:[NetflixCache instantQueueKey]];
    } else if (row == RecommendationsSection) {
        cell.text = [self.netflixCache titleForKey:[NetflixCache recommendationKey]];
    } else if (row == AtHomeSection) {
        cell.text = [self.netflixCache titleForKey:[NetflixCache atHomeKey]];
    } else if (row == RentalHistorySection) {
        cell.text = NSLocalizedString(@"Rental History", nil);
    } else if (row == LogOutSection) {
        cell.text = NSLocalizedString(@"Tap to Log Out", nil);
        cell.textColor = [ColorCache commandColor];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}


- (UITableViewCell*) tableView:(UITableView*) tableView cellForRowAtIndexPath:(NSIndexPath*) indexPath {
    if (self.hasAccount) {
        return [self cellForLoggedInRow:indexPath.row];
    } else {
        UITableViewCell* cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero] autorelease];
        cell.text = NSLocalizedString(@"Tap to Log In", nil);
        cell.textColor = [ColorCache commandColor];
        return cell;
    }
}


- (void) didSelectLogoutRow {
    UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                     message:NSLocalizedString(@"Really log out of Netflix?", nil)
                                                    delegate:nil
                                           cancelButtonTitle:NSLocalizedString(@"No", nil)
                                           otherButtonTitles:NSLocalizedString(@"Yes", nil), nil] autorelease];
    
    alert.delegate = self;
    [alert show];
}


- (void)         alertView:(UIAlertView*) alertView
      clickedButtonAtIndex:(NSInteger) index {
    if (index != alertView.cancelButtonIndex) {        
        [self.controller setNetflixKey:nil secret:nil userId:nil];
        
        [self.tableView beginUpdates];
        {
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationBottom];
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationTop];
        }
        [self.tableView endUpdates];
    }
}


- (void) didSelectQueuesRow {
    NetflixFeedsViewController* controller = [[[NetflixFeedsViewController alloc] initWithNavigationController:navigationController] autorelease];
    [navigationController pushViewController:controller animated:YES];
}


- (void) didSelectQueueRow:(NSString*) key {
    NetflixQueueViewController* controller =
    [[[NetflixQueueViewController alloc] initWithNavigationController:navigationController
                                                              feedKey:key] autorelease];
    [navigationController pushViewController:controller animated:YES];    
}


- (void) didSelectRentalHistoryRow {
    NSArray* keys =
    [NSArray arrayWithObjects:
     [NetflixCache rentalHistoryKey],
     [NetflixCache rentalHistoryWatchedKey],
     [NetflixCache rentalHistoryReturnedKey], nil];
    
    NetflixFeedsViewController* controller =
    [[[NetflixFeedsViewController alloc] initWithNavigationController:navigationController
                                                             feedKeys:keys] autorelease];
    [navigationController pushViewController:controller animated:YES];    
}


- (void) didSelectLoggedInRow:(NSInteger) row {
    if (row == DVDSection) {
        [self didSelectQueueRow:[NetflixCache dvdQueueKey]];
    } else if (row == InstantSection) {
        [self didSelectQueueRow:[NetflixCache instantQueueKey]];
    } else if (row == RecommendationsSection) {
        [self didSelectQueueRow:[NetflixCache recommendationKey]];
    } else if (row == AtHomeSection) {
        [self didSelectQueueRow:[NetflixCache atHomeKey]];
    } else if (row == RentalHistorySection) {
        [self didSelectRentalHistoryRow];
    } else if (row == LogOutSection) {
        [self didSelectLogoutRow];
    }
}


- (void)            tableView:(UITableView*) tableView
      didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.hasAccount) {
        [self didSelectLoggedInRow:indexPath.row];
    } else {
        NetflixLoginViewController* controller = [[[NetflixLoginViewController alloc] initWithNavigationController:navigationController] autorelease];
        [navigationController pushViewController:controller animated:YES];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

@end