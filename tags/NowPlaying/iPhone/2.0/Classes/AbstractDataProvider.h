// Copyright (C) 2008 Cyrus Najmabadi
//
// This program is free software; you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the Free
// Software Foundation; either version 2 of the License, or (at your option) any
// later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
// details.
//
// You should have received a copy of the GNU General Public License along with
// this program; if not, write to the Free Software Foundation, Inc., 51
// Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

@interface AbstractDataProvider : NSObject {
    NowPlayingModel* model;
    NSArray* moviesData;
    NSArray* theatersData;
    NSDictionary* synchronizationInformationData;

    NSMutableDictionary* performancesData;
}

@property (retain) NowPlayingModel* model;
@property (retain) NSArray* moviesData;
@property (retain) NSArray* theatersData;
@property (retain) NSDictionary* synchronizationInformationData;
@property (retain) NSMutableDictionary* performancesData;

- (id) initWithModel:(NowPlayingModel*) model;

- (NSString*) providerFolder;
- (void) invalidateDiskCache;

- (NSArray*) movies;
- (NSArray*) theaters;
- (NSArray*) moviePerformances:(Movie*) movie forTheater:(Theater*) theater;
- (NSDate*) synchronizationDateForTheater:(NSString*) theaterName;

- (void) setStale;
- (NSDate*) lastLookupDate;

- (void) lookup;

/* @protected */
- (NSString*) performancesFile:(NSString*) theaterName;

@end