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

#import "Movie.h"

#import "Utilities.h"

@implementation Movie

property_definition(identifier);
property_definition(canonicalTitle);
property_definition(displayTitle);
property_definition(rating);
property_definition(length);
property_definition(releaseDate);
property_definition(imdbAddress);
property_definition(poster);
property_definition(synopsis);
property_definition(studio);
property_definition(directors);
property_definition(cast);
property_definition(genres);

- (void) dealloc {
    self.identifier = nil;
    self.canonicalTitle = nil;
    self.rating = nil;
    self.length = 0;
    self.releaseDate = nil;
    self.imdbAddress = nil;
    self.poster = nil;
    self.synopsis = nil;
    self.displayTitle = nil;
    self.studio = nil;
    self.directors = nil;
    self.cast = nil;
    self.genres = nil;

    [super dealloc];
}


static NSString* articles[] = {
@"Der", @"Das", @"Ein", @"Eine", @"The",
@"A", @"An", @"La", @"Las", @"Le",
@"Les", @"Los", @"El", @"Un", @"Une",
@"Una", @"Il", @"O", @"Het", @"De",
@"Os", @"Az", @"Den", @"Al", @"En",
@"L'"
};

+ (NSString*) makeCanonical:(NSString*) title {
    title = [title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    for (int i = 0; i < ArrayLength(articles); i++) {
        NSString* article = articles[i];
        if ([title hasSuffix:[NSString stringWithFormat:@", %@", article]]) {
            return [NSString stringWithFormat:@"%@ %@", article, [title substringToIndex:(title.length - article.length - 2)]];
        }
    }

    return title;
}


+ (NSString*) makeDisplay:(NSString*) title {
    title = [title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    for (int i = 0; i < ArrayLength(articles); i++) {
        NSString* article = articles[i];
        if ([title hasPrefix:[NSString stringWithFormat:@"%@ ", article]]) {
            return [NSString stringWithFormat:@"%@, %@", [title substringFromIndex:(article.length + 1)], article];
        }
    }

    return title;
}


- (id) initWithIdentifier:(NSString*) identifier_
           canonicalTitle:(NSString*) canonicalTitle_
             displayTitle:(NSString*) displayTitle_
                   rating:(NSString*) rating_
                   length:(NSInteger) length_
              releaseDate:(NSDate*) releaseDate_
              imdbAddress:(NSString*) imdbAddress_
                   poster:(NSString*) poster_
                 synopsis:(NSString*) synopsis_
                   studio:(NSString*) studio_
                directors:(NSArray*) directors_
                     cast:(NSArray*) cast_
                   genres:(NSArray*) genres_ {
    if (self = [self init]) {
        self.identifier = [Utilities nonNilString:identifier_];
        self.canonicalTitle = [Utilities nonNilString:canonicalTitle_];
        self.displayTitle = [Utilities nonNilString:displayTitle_];
        self.rating = [Utilities nonNilString:rating_];
        self.length = length_;
        self.releaseDate = releaseDate_;
        self.imdbAddress = [Utilities nonNilString:imdbAddress_];
        self.poster = [Utilities nonNilString:poster_];
        self.synopsis = [Utilities nonNilString:synopsis_];
        self.studio = [Utilities nonNilString:studio_];
        self.directors = [Utilities nonNilArray:directors_];
        self.cast = [Utilities nonNilArray:cast_];
        self.genres = [Utilities nonNilArray:genres_];
    }

    return self;
}


+ (Movie*) movieWithIdentifier:(NSString*) identifier
                         title:(NSString*) title
                        rating:(NSString*) rating
                        length:(NSInteger) length
                   releaseDate:(NSDate*) releaseDate
                   imdbAddress:(NSString*) imdbAddress
                        poster:(NSString*) poster
                      synopsis:(NSString*) synopsis
                        studio:(NSString*) studio
                     directors:(NSArray*) directors
                          cast:(NSArray*) cast
                        genres:(NSArray*) genres {
    rating = [rating stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (rating.length == 0) {
        rating = @"NR";
    }

    return [[[Movie alloc] initWithIdentifier:identifier
                               canonicalTitle:[self makeCanonical:title]
                                 displayTitle:[self makeDisplay:title]
                                       rating:rating
                                       length:length
                                  releaseDate:releaseDate
                                  imdbAddress:imdbAddress
                                       poster:poster
                                     synopsis:[Utilities stripHtmlCodes:synopsis]
                                       studio:studio
                                    directors:directors
                                         cast:cast
                                       genres:genres] autorelease];
}


+ (Movie*) movieWithDictionary:(NSDictionary*) dictionary {
    return [[[Movie alloc] initWithIdentifier:[dictionary objectForKey:identifier_key]
                               canonicalTitle:[dictionary objectForKey:canonicalTitle_key]
                                 displayTitle:[dictionary objectForKey:displayTitle_key]
                                       rating:[dictionary objectForKey:rating_key]
                                       length:[[dictionary objectForKey:length_key] intValue]
                                  releaseDate:[dictionary objectForKey:releaseDate_key]
                                  imdbAddress:[dictionary objectForKey:imdbAddress_key]
                                       poster:[dictionary objectForKey:poster_key]
                                     synopsis:[dictionary objectForKey:synopsis_key]
                                       studio:[dictionary objectForKey:studio_key]
                                    directors:[dictionary objectForKey:directors_key]
                                         cast:[dictionary objectForKey:cast_key]
                                       genres:[dictionary objectForKey:genres_key]] autorelease];
}


- (NSDictionary*) dictionary {
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    [dictionary setValue:identifier                         forKey:identifier_key];
    [dictionary setValue:canonicalTitle                     forKey:canonicalTitle_key];
    [dictionary setValue:displayTitle                       forKey:displayTitle_key];
    [dictionary setValue:rating                             forKey:rating_key];
    [dictionary setValue:[NSNumber numberWithInt:length]    forKey:length_key];
    [dictionary setValue:releaseDate                        forKey:releaseDate_key];
    [dictionary setValue:imdbAddress                        forKey:imdbAddress_key];
    [dictionary setValue:poster                             forKey:poster_key];
    [dictionary setValue:synopsis                           forKey:synopsis_key];
    [dictionary setValue:studio                             forKey:studio_key];
    [dictionary setValue:directors                          forKey:directors_key];
    [dictionary setValue:cast                               forKey:cast_key];
    [dictionary setValue:genres                             forKey:genres_key];
    return dictionary;
}


- (NSString*) description {
    return self.dictionary.description;
}


- (BOOL) isEqual:(id) anObject {
    Movie* other = anObject;

    return [canonicalTitle isEqual:other.canonicalTitle];
}


- (NSUInteger) hash {
    return canonicalTitle.hash;
}


- (BOOL) isUnrated {
    return rating.length == 0 || [rating isEqual:@"NR"];
}


- (NSString*) ratingString {
    if (self.isUnrated) {
        return NSLocalizedString(@"Unrated", nil);
    }  else {
        return [NSString stringWithFormat:NSLocalizedString(@"Rated %@", nil), rating];
    }
}


- (NSString*) runtimeString {
    NSString* hoursString = @"";
    NSString* minutesString = @"";

    if (length > 0) {
        NSInteger hours = length / 60;
        NSInteger minutes = length % 60;

        if (hours == 1) {
            hoursString = NSLocalizedString(@"1 hour", nil);
        } else if (hours > 1) {
            hoursString = [NSString stringWithFormat:NSLocalizedString(@"%d hours", nil), hours];
        }

        if (minutes == 1) {
            minutesString = NSLocalizedString(@"1 minute", nil);
        } else if (minutes > 1) {
            minutesString = [NSString stringWithFormat:NSLocalizedString(@"%d minutes", nil), minutes];
        }
    }

    return [NSString stringWithFormat:NSLocalizedString(@"%@ %@", "2 hours 34 minutes"), hoursString, minutesString];
}


- (NSString*) ratingAndRuntimeString {
    return [NSString stringWithFormat:NSLocalizedString(@"%@. %@", "Rated R. 2 hours 34 minutes"), self.ratingString, self.runtimeString];
}

@end