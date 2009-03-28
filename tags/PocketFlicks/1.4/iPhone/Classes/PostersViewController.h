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

#import "TappableScrollViewDelegate.h"

@interface PostersViewController : UIViewController<TappableScrollViewDelegate, UIScrollViewDelegate, UIActionSheetDelegate> {
@private
    AbstractNavigationController* navigationController;
    Movie* movie;
    
    TappableScrollView* scrollView;
    
    NSInteger currentPage;
    NSInteger posterCount;
    NSMutableDictionary* pageNumberToView;
    
    UIToolbar* toolbar;
    
    BOOL shutdown;
    
    BOOL saving;
    UILabel* savingLabel;
}

- (id) initWithNavigationController:(AbstractNavigationController*) navigationController
                              movie:(Movie*) movie
                        posterCount:(NSInteger) posterCount;

@end