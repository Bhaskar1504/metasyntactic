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

@interface AbstractImageCell : AbstractTableViewCell {
@private
  UIImageView* imageLoadingView;
  UIActivityIndicatorView* activityView;
  BOOL imageLoaded;

@protected
  UIImageView* imageView;

  UILabel* titleLabel;
  CGFloat titleWidth;
}

- (id) initWithReuseIdentifier:(NSString*) reuseIdentifier
           tableViewController:(UITableViewController*) tableViewController;

// @protected
- (void) loadImage;
- (void) clearImage;
- (NSArray*) allLabels;

- (UILabel*) createTitleLabel:(NSString*) title yPosition:(NSInteger) yPosition;
- (UILabel*) createValueLabel:(NSInteger) yPosition forTitle:(UILabel*) titleLabel;

- (void) setCellImage:(UIImage*) image animated:(BOOL) animated;

@end