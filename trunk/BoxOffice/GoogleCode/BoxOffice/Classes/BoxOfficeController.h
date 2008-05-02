//
//  BoxOfficeController.h
//  BoxOffice
//
//  Created by Cyrus Najmabadi on 4/30/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "BoxOfficeModel.h"

@class BoxOfficeAppDelegate;

@interface BoxOfficeController : NSObject {
    BoxOfficeAppDelegate* appDelegate;
}

// Don't retain the BoxOfficeAppDelegate.  It's retaining us.
@property (assign) BoxOfficeAppDelegate* appDelegate;

- (BoxOfficeModel*) model;

- (id) initWithAppDelegate:(BoxOfficeAppDelegate*) appDelegate;
- (void) dealloc;

- (void) spawnBackgroundThreads;
- (void) lookupMoviesBackgroundThreadEntryPoint:(id) anObject;
- (void) lookupMovies;
- (void) setMovies:(NSArray*) movies;
- (void) lookupTheatersBackgroundThreadEntryPoint:(id) anObject;
- (void) lookupTheaters;
- (void) setTheaters:(NSArray*) theaters;
/*
- (WSMethodInvocationRef) createSOAPRequestWithUrl:(NSURL*) url
                                            method:(NSString*) method
                                                ns:(NSString*) ns
                                        parameters:(NSDictionary*) parameters 
                                             order:(NSArray*) order
                                           headers:(NSDictionary*) headers;
*/
- (NSDictionary*) convertSoapMovies:(id) soapMovies;
- (NSArray*) convertSoapTheaters:(NSArray*) soapTheaters;

@end
