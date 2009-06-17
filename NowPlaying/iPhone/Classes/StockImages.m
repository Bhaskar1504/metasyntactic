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

#import "StockImages.h"

@implementation StockImages

static UIImage* freshImage = nil;
static UIImage* rottenFadedImage = nil;
static UIImage* rottenFullImage = nil;

static UIImage* emptyStarImage = nil;
static UIImage* filledYellowStarImage = nil;
static UIImage* redStar_0_5_Image = nil;
static UIImage* redStar_1_5_Image = nil;
static UIImage* redStar_2_5_Image = nil;
static UIImage* redStar_3_5_Image = nil;
static UIImage* redStar_4_5_Image = nil;
static UIImage* redStar_5_5_Image = nil;

static UIImage* searchImage = nil;

static UIImage* redRatingImage = nil;
static UIImage* yellowRatingImage = nil;
static UIImage* greenRatingImage = nil;
static UIImage* unknownRatingImage = nil;

static UIImage* imageLoading = nil;
static UIImage* imageLoadingNeutral = nil;
static UIImage* imageNotAvailable = nil;

static UIImage* upArrow = nil;
static UIImage* downArrow = nil;
static UIImage* neutralSquare = nil;

static UIImage* warning16x16 = nil;
static UIImage* warning32x32 = nil;

+ (void) initialize {
  if (self == [StockImages class]) {
    freshImage          = [[UIImage imageNamed:@"Fresh.png"] retain];
    rottenFadedImage    = [[UIImage imageNamed:@"Rotten-Faded.png"] retain];
    rottenFullImage     = [[UIImage imageNamed:@"Rotten-Full.png"] retain];
    
    emptyStarImage      = [[UIImage imageNamed:@"Empty Star.png"] retain];
    filledYellowStarImage = [[UIImage imageNamed:@"Filled Star.png"] retain];
    redStar_0_5_Image = [[UIImage imageNamed:@"RedStar-0.0.png"] retain];
    redStar_1_5_Image = [[UIImage imageNamed:@"RedStar-0.2.png"] retain];
    redStar_2_5_Image = [[UIImage imageNamed:@"RedStar-0.4.png"] retain];
    redStar_3_5_Image = [[UIImage imageNamed:@"RedStar-0.6.png"] retain];
    redStar_4_5_Image = [[UIImage imageNamed:@"RedStar-0.8.png"] retain];
    redStar_5_5_Image = [[UIImage imageNamed:@"RedStar-1.0.png"] retain];
    
    searchImage         = [[UIImage imageNamed:@"Search.png"] retain];
    
    redRatingImage      = [[UIImage imageNamed:@"Rating-Red.png"] retain];
    yellowRatingImage   = [[UIImage imageNamed:@"Rating-Yellow.png"] retain];
    greenRatingImage    = [[UIImage imageNamed:@"Rating-Green.png"] retain];
    unknownRatingImage  = [[UIImage imageNamed:@"Rating-Unknown.png"] retain];
    
    imageLoading        = [[UIImage imageNamed:@"ImageLoading.png"] retain];
    imageLoadingNeutral = [[UIImage imageNamed:@"ImageLoading-Neutral.png"] retain];
    imageNotAvailable   = [[UIImage imageNamed:@"ImageNotAvailable.png"] retain];
    
    upArrow             = [[UIImage imageNamed:@"UpArrow.png"] retain];
    downArrow           = [[UIImage imageNamed:@"DownArrow.png"] retain];
    neutralSquare       = [[UIImage imageNamed:@"NeutralSquare.png"] retain];
    
    warning16x16        = [[UIImage imageNamed:@"Warning-16x16.png"] retain];
    warning32x32        = [[UIImage imageNamed:@"Warning-32x32.png"] retain];
  }
}


+ (UIImage*) freshImage {
  return freshImage;
}


+ (UIImage*) rottenFadedImage {
  return rottenFadedImage;
}


+ (UIImage*) rottenFullImage {
  return rottenFullImage;
}


+ (UIImage*) redRatingImage {
  return redRatingImage;
}


+ (UIImage*) yellowRatingImage {
  return yellowRatingImage;
}


+ (UIImage*) greenRatingImage {
  return greenRatingImage;
}


+ (UIImage*) unknownRatingImage {
  return unknownRatingImage;
}


+ (UIImage*) emptyStarImage {
  return emptyStarImage;
}


+ (UIImage*) filledYellowStarImage {
  return filledYellowStarImage;
}


+ (UIImage*) redStar_0_5_Image {
  return redStar_0_5_Image;
}


+ (UIImage*) redStar_1_5_Image {
  return redStar_1_5_Image;
}


+ (UIImage*) redStar_2_5_Image {
  return redStar_2_5_Image;
}


+ (UIImage*) redStar_3_5_Image {
  return redStar_3_5_Image;
}


+ (UIImage*) redStar_4_5_Image {
  return redStar_4_5_Image;
}


+ (UIImage*) redStar_5_5_Image {
  return redStar_5_5_Image;
}


+ (UIImage*) searchImage {
  return searchImage;
}


+ (UIImage*) imageLoading {
  return imageLoading;
}


+ (UIImage*) imageLoadingNeutral {
  return imageLoadingNeutral;
}


+ (UIImage*) imageNotAvailable {
  return imageNotAvailable;
}


+ (UIImage*) upArrow {
  return upArrow;
}


+ (UIImage*) downArrow {
  return downArrow;
}


+ (UIImage*) neutralSquare {
  return neutralSquare;
}


+ (UIImage*) warning16x16 {
  return warning16x16;
}


+ (UIImage*) warning32x32 {
  return warning32x32;
}

@end
