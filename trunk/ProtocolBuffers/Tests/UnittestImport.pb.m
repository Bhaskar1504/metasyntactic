// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "UnittestImport.pb.h"

@implementation UnittestImportRoot
+ (void) initialize {
  if (self == [UnittestImportRoot class]) {
  }
}
@end

@interface ImportEnum ()
  @property int32_t index;
  @property int32_t value;
@end

@implementation ImportEnum
@synthesize index;
@synthesize value;
static ImportEnum* ImportEnum_IMPORT_FOO = nil;
static ImportEnum* ImportEnum_IMPORT_BAR = nil;
static ImportEnum* ImportEnum_IMPORT_BAZ = nil;
- (id) initWithIndex:(int32_t) index_ value:(int32_t) value_ {
  if (self = [super init]) {
    self.index = index_;
    self.value = value_;
  }
  return self;
}
+ (ImportEnum*) newWithIndex:(int32_t) index value:(int32_t) value {
  return [[[ImportEnum alloc] initWithIndex:index value:value] autorelease];
}
+ (void) initialize {
  if (self == [ImportEnum class]) {
    ImportEnum_IMPORT_FOO = [[ImportEnum newWithIndex:0 value:7] retain];
    ImportEnum_IMPORT_BAR = [[ImportEnum newWithIndex:1 value:8] retain];
    ImportEnum_IMPORT_BAZ = [[ImportEnum newWithIndex:2 value:9] retain];
  }
}
+ (ImportEnum*) IMPORT_FOO {
  return ImportEnum_IMPORT_FOO;
}
+ (ImportEnum*) IMPORT_BAR {
  return ImportEnum_IMPORT_BAR;
}
+ (ImportEnum*) IMPORT_BAZ {
  return ImportEnum_IMPORT_BAZ;
}
- (int32_t) number { return value; }
+ (ImportEnum*) valueOf:(int32_t) value {
  switch (value) {
    case 7: return [ImportEnum IMPORT_FOO];
    case 8: return [ImportEnum IMPORT_BAR];
    case 9: return [ImportEnum IMPORT_BAZ];
    default: return nil;
  }
}
@end

@interface ImportMessage ()
@property int32_t d;
@end

@implementation ImportMessage

- (BOOL) hasD {
  return hasD;
}
- (void) setHasD:(BOOL) hasD_ {
  hasD = hasD_;
}
@synthesize d;
- (void) dealloc {
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.d = 0;
  }
  return self;
}
static ImportMessage* defaultImportMessageInstance = nil;
+ (void) initialize {
  if (self == [ImportMessage class]) {
    defaultImportMessageInstance = [[ImportMessage alloc] init];
  }
}
+ (ImportMessage*) defaultInstance {
  return defaultImportMessageInstance;
}
- (ImportMessage*) defaultInstance {
  return defaultImportMessageInstance;
}
- (BOOL) isInitialized {
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (hasD) {
    [output writeInt32:1 value:self.d];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (hasD) {
    size += computeInt32Size(1, self.d);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (ImportMessage*) parseFromData:(NSData*) data {
  return (ImportMessage*)[[[ImportMessage builder] mergeFromData:data] build];
}
+ (ImportMessage*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (ImportMessage*)[[[ImportMessage builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (ImportMessage*) parseFromInputStream:(NSInputStream*) input {
  return (ImportMessage*)[[[ImportMessage builder] mergeFromInputStream:input] build];
}
+ (ImportMessage*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (ImportMessage*)[[[ImportMessage builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (ImportMessage*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (ImportMessage*)[[[ImportMessage builder] mergeFromCodedInputStream:input] build];
}
+ (ImportMessage*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (ImportMessage*)[[[ImportMessage builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (ImportMessage_Builder*) builder {
  return [[[ImportMessage_Builder alloc] init] autorelease];
}
+ (ImportMessage_Builder*) builderWithPrototype:(ImportMessage*) prototype {
  return [[ImportMessage builder] mergeFrom:prototype];
}
- (ImportMessage_Builder*) builder {
  return [ImportMessage builder];
}
@end

@interface ImportMessage_Builder()
@property (retain) ImportMessage* result;
@end

@implementation ImportMessage_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.result = [[[ImportMessage alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (ImportMessage_Builder*) clear {
  self.result = [[[ImportMessage alloc] init] autorelease];
  return self;
}
- (ImportMessage_Builder*) clone {
  return [ImportMessage builderWithPrototype:result];
}
- (ImportMessage*) defaultInstance {
  return [ImportMessage defaultInstance];
}
- (ImportMessage*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (ImportMessage*) buildPartial {
  ImportMessage* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (ImportMessage_Builder*) mergeFrom:(ImportMessage*) other {
  if (other == [ImportMessage defaultInstance]) {
    return self;
  }
  if (other.hasD) {
    [self setD:other.d];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (ImportMessage_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (ImportMessage_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  PBUnknownFieldSet_Builder* unknownFields = [PBUnknownFieldSet builderWithUnknownFields:self.unknownFields];
  while (YES) {
    int32_t tag = [input readTag];
    switch (tag) {
      case 0:
        [self setUnknownFields:[unknownFields build]];
        return self;
      default: {
        if (![self parseUnknownField:input unknownFields:unknownFields extensionRegistry:extensionRegistry tag:tag]) {
          [self setUnknownFields:[unknownFields build]];
          return self;
        }
        break;
      }
      case 8: {
        [self setD:[input readInt32]];
        break;
      }
    }
  }
}
- (BOOL) hasD {
  return result.hasD;
}
- (int32_t) d {
  return result.d;
}
- (ImportMessage_Builder*) setD:(int32_t) value {
  result.hasD = YES;
  result.d = value;
  return self;
}
- (ImportMessage_Builder*) clearD {
  result.hasD = NO;
  result.d = 0;
  return self;
}
@end

