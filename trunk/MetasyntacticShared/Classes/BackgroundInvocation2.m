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

#import "BackgroundInvocation2.h"


@interface BackgroundInvocation2()
@property (retain) id argument2;
@end


@implementation BackgroundInvocation2

@synthesize argument2;

- (void) dealloc {
    self.argument2 = nil;
    [super dealloc];
}


- (id) initWithTarget:(id) target_
             selector:(SEL) selector_
           withObject:(id) argument1_
           withObject:(id) argument2_
                 gate:(id<NSLocking>) gate_
              visible:(BOOL) visible_ {
    if ((self = [super initWithTarget:target_
                            selector:selector_
                          withObject:argument1_
                                gate:gate_
                             visible:visible_])) {
        self.argument2 = argument2_;
    }

    return self;
}


+ (BackgroundInvocation2*) invocationWithTarget:(id) target
                                       selector:(SEL) selector
                                     withObject:(id) argument1
                                     withObject:(id) argument2
                                           gate:(id<NSLocking>) gate
                                        visible:(BOOL) visible {
    return [[[BackgroundInvocation2 alloc] initWithTarget:target
                                                 selector:selector
                                               withObject:argument1
                                               withObject:argument2
                                                     gate:gate
                                                  visible:visible] autorelease];
}


- (void) invokeSelector {
    [target performSelector:selector withObject:argument withObject:argument2];
}

@end