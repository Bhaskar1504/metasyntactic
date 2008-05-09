//
//  AllMoviesViewController.h
//  BoxOffice
//
//  Created by Cyrus Najmabadi on 4/30/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "BoxOfficeModel.h"
#import "MultiDictionary.h"

@class MoviesNavigationController;

@interface AllMoviesViewController : UITableViewController {
    MoviesNavigationController* navigationController;
    UISegmentedControl* segmentedControl;
    
    NSArray* sortedMovies;
    NSMutableArray* sectionTitles;
    MultiDictionary* sectionTitleToContentsMap;
    
    NSArray* alphabeticSectionTitles;
}

@property (assign) MoviesNavigationController* navigationController;
@property (retain) NSArray* sortedMovies;
@property (retain) UISegmentedControl* segmentedControl;
@property (retain) NSMutableArray* sectionTitles;
@property (retain) MultiDictionary* sectionTitleToContentsMap;
@property (retain) NSArray* alphabeticSectionTitles;

- (id) initWithNavigationController:(MoviesNavigationController*) navigationController;
- (void) dealloc;

- (void) refresh;
- (BoxOfficeModel*) model;

- (void) sortMovies;

@end
