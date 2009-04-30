//
//  StringsCache.h
//  NowPlaying
//
//  Created by Cyrus Najmabadi on 4/29/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

@interface LocalizableStringsCache : NSObject {
@private
    NSLock* gate;
    NSDictionary* indexData;
}

+ (NSString*) localizedString:(NSString*) key;

@end