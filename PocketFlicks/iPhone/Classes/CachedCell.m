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

#import "CachedCell.h"

@implementation CachedCell

@synthesize indexPath;
@synthesize cellCache;

- (void) dealloc {
    self.indexPath = nil;
    self.cellCache = nil;

    [super dealloc];
}


- (id) initWithFrame:(CGRect) frame
     reuseIdentifier:(NSString*) reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
    }

    return self;
}


- (void) drawRectWorker:(CGRect) rect {
    @throw [NSException exceptionWithName:@"Improper Subclassing" reason:@"" userInfo:nil];
}


- (void) drawRect:(CGRect) rect {
    if (indexPath == nil) {
        [super drawRect:rect];
    } else {
        UIImage* cached = [cellCache objectForKey:indexPath];
        if (cached == nil) {
            CGRect bounds = self.bounds;

            UIGraphicsBeginImageContext(bounds.size);
            {
                [super drawRect:rect];
                cached = UIGraphicsGetImageFromCurrentImageContext();
            }
            UIGraphicsEndImageContext();

            [cellCache setObject:cached forKey:indexPath];
        } else {
            NSLog(@"");
        }

        [cached drawAtPoint:CGPointMake(0,0)];
    }

    /*
    [super drawRect:rect];

    if (indexPath == nil) {
        [self drawRectWorker:rect];
    } else {
        UIImage* cached = [cellCache objectForKey:indexPath];
        if (cached == nil) {
            CGRect bounds = self.bounds;

            UIGraphicsBeginImageContext(bounds.size);
            {
                [self drawRectWorker:rect];
                cached = UIGraphicsGetImageFromCurrentImageContext();
            }
            UIGraphicsEndImageContext();

            [cellCache setObject:cached forKey:indexPath];
        }

        [cached drawAtPoint:CGPointMake(0,0)];
    }
     */
}

@end