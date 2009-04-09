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

@interface NowPlayingController : NSObject {
    NowPlayingAppDelegate* appDelegate;

    NSLock* determineLocationLock;
    NSLock* dataProviderLock;
    NSLock* ratingsLookupLock;
    NSLock* upcomingMoviesLookupLock;
}

@property (assign) NowPlayingAppDelegate* appDelegate;
@property (retain) NSLock* determineLocationLock;
@property (retain) NSLock* dataProviderLock;
@property (retain) NSLock* ratingsLookupLock;
@property (retain) NSLock* upcomingMoviesLookupLock;

- (NowPlayingModel*) model;

- (void) setSearchDate:(NSDate*) searchDate;
- (void) setUserAddress:(NSString*) userAddress;
- (void) setSearchRadius:(NSInteger) radius;
- (void) setRatingsProviderIndex:(NSInteger) index;

+ (NowPlayingController*) controllerWithAppDelegate:(NowPlayingAppDelegate*) appDelegate;

@end