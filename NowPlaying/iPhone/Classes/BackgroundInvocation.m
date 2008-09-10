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

#import "BackgroundInvocation.h"

#import "GlobalActivityIndicator.h"

@implementation BackgroundInvocation

@synthesize selector;
@synthesize target;
@synthesize argument;
@synthesize gate;
@synthesize visible;

- (void) dealloc {
    self.selector = nil;
    self.target = nil;
    self.argument = nil;
    self.gate = nil;
    self.visible = NO;

    [super dealloc];
}


- (id) initWithTarget:(id) target_
             selector:(SEL) selector_
             argument:(id) argument_
                 gate:(NSLock*) gate_
              visible:(BOOL) visible_ {
    if (self = [super init]) {
        self.target = target_;
        self.selector = selector_;
        self.argument = argument_;
        self.gate = gate_;
        self.visible = visible_;
    }

    return self;
}


+ (BackgroundInvocation*) invocationWithTarget:(id) target
                                      selector:(SEL) selector
                                      argument:(id) argument
                                          gate:(NSLock*) gate
                                       visible:(BOOL) visible {
    return [[[BackgroundInvocation alloc] initWithTarget:target
                                                selector:selector
                                                argument:argument
                                                    gate:gate
                                                 visible:visible] autorelease];
}


- (void) run {
    NSAutoreleasePool* autoreleasePool= [[NSAutoreleasePool alloc] init];
    {
        [NSThread setThreadPriority:0.0];
        [gate lock];
        [GlobalActivityIndicator addBackgroundTask:visible];
        {
            [target performSelector:selector withObject:argument];
        }
        [GlobalActivityIndicator removeBackgroundTask:visible];
        [gate unlock];
    }
    [autoreleasePool release];
}


@end