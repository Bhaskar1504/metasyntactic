// Protocol Buffers - Google's data interchange format
// Copyright 2008 Google Inc.
// http://code.google.com/p/protobuf/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

@interface GeneratedMessage_FieldAccessorTable : NSObject {
    ProtocolBufferDescriptor* descriptor;
    NSArray* fields;
}

@property (retain) ProtocolBufferDescriptor* descriptor;
@property (retain) NSArray* fields;

+ (GeneratedMessage_FieldAccessorTable*) tableWithDescriptor:(ProtocolBufferDescriptor*) descriptor
                                                  fieldNames:(NSArray*) fieldNames
                                                messageClass:(Class) messageClass
                                                builderClass:(Class) builderClass;

- (id<GeneratedMessage_FieldAccessor>) getField:(FieldDescriptor*) field;

@end