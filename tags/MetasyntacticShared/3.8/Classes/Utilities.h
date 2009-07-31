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

@interface Utilities : NSObject {
}

+ (id) findSmallestElementInArray:(NSArray*) array
                    usingFunction:(NSInteger(*)(id, id, void*)) comparator
                          context:(void*) context;

+ (id) findSmallestElementInArray:(NSArray*) array
                    usingFunction:(NSInteger(*)(id, id, void*, void*)) comparator
                         context1:(void*) context1
                         context2:(void*) context2;

+ (NSString*) titleForMovie:(XmlElement*) element;

+ (XmlElement*) makeSoapRequest:(XmlElement*) element
                          atUrl:(NSString*) urlString
                         atHost:(NSString*) host
                     withAction:(NSString*) soapAction;

+ (id) removeRandomElement:(NSMutableArray*) array;

+ (NSDictionary*) nonNilDictionary:(NSDictionary*) dictionary;
+ (NSArray*) nonNilArray:(NSArray*) array;

+ (NSString*) generateShowtimeLinks:(Model*) model
                              movie:(Movie*) movie
                            theater:(Theater*) theater
                       performances:(NSArray*) performances;

@end