// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "UnittestOptimizeFor.pb.h"

@implementation UnittestOptimizeForRoot
+ (void) initialize {
  if (self == [UnittestOptimizeForRoot class]) {
  }
}
@end

@interface TestOptimizedForSize ()
@property int32_t i;
@property (retain) ForeignMessage* msg;
@end

@implementation TestOptimizedForSize

- (BOOL) hasI {
  return hasI;
}
- (void) setHasI:(BOOL) hasI_ {
  hasI = hasI_;
}
@synthesize i;
- (BOOL) hasMsg {
  return hasMsg;
}
- (void) setHasMsg:(BOOL) hasMsg_ {
  hasMsg = hasMsg_;
}
@synthesize msg;
- (void) dealloc {
  self.msg = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.i = 0;
    self.msg = [ForeignMessage defaultInstance];
  }
  return self;
}
static id<PBExtensionField> TestOptimizedForSize_testExtension = nil;
static id<PBExtensionField> TestOptimizedForSize_testExtension2 = nil;
+ (id<PBExtensionField>) testExtension {
  return TestOptimizedForSize_testExtension;
}
+ (id<PBExtensionField>) testExtension2 {
  return TestOptimizedForSize_testExtension2;
}
static TestOptimizedForSize* defaultTestOptimizedForSizeInstance = nil;
+ (void) initialize {
  if (self == [TestOptimizedForSize class]) {
    defaultTestOptimizedForSizeInstance = [[TestOptimizedForSize alloc] init];
     TestOptimizedForSize_testExtension =
  [[PBConcreteExtensionField extensionWithType:PBExtensionTypeInt32
                                 extendedClass:[TestOptimizedForSize class]
                                   fieldNumber:1234
                                  defaultValue:[NSNumber numberWithInt:0]
                     messageOrGroupOrEnumClass:[NSNumber class]
                                    isRepeated:false
                                      isPacked:false
                        isMessageSetWireFormat:false] retain];
     TestOptimizedForSize_testExtension2 =
  [[PBConcreteExtensionField extensionWithType:PBExtensionTypeMessage
                                 extendedClass:[TestOptimizedForSize class]
                                   fieldNumber:1235
                                  defaultValue:[TestRequiredOptimizedForSize defaultInstance]
                     messageOrGroupOrEnumClass:[TestRequiredOptimizedForSize class]
                                    isRepeated:false
                                      isPacked:false
                        isMessageSetWireFormat:false] retain];
  }
}
+ (TestOptimizedForSize*) defaultInstance {
  return defaultTestOptimizedForSizeInstance;
}
- (TestOptimizedForSize*) defaultInstance {
  return defaultTestOptimizedForSizeInstance;
}
- (BOOL) isInitialized {
  if (!self.extensionsAreInitialized) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (hasI) {
    [output writeInt32:1 value:self.i];
  }
  if (hasMsg) {
    [output writeMessage:19 value:self.msg];
  }
  [self writeExtensionsToCodedOutputStream:output
                                      from:1000
                                        to:536870912];
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (hasI) {
    size += computeInt32Size(1, self.i);
  }
  if (hasMsg) {
    size += computeMessageSize(19, self.msg);
  }
  size += [self extensionsSerializedSize];
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (TestOptimizedForSize*) parseFromData:(NSData*) data {
  return (TestOptimizedForSize*)[[[TestOptimizedForSize builder] mergeFromData:data] build];
}
+ (TestOptimizedForSize*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestOptimizedForSize*)[[[TestOptimizedForSize builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (TestOptimizedForSize*) parseFromInputStream:(NSInputStream*) input {
  return (TestOptimizedForSize*)[[[TestOptimizedForSize builder] mergeFromInputStream:input] build];
}
+ (TestOptimizedForSize*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestOptimizedForSize*)[[[TestOptimizedForSize builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TestOptimizedForSize*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (TestOptimizedForSize*)[[[TestOptimizedForSize builder] mergeFromCodedInputStream:input] build];
}
+ (TestOptimizedForSize*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestOptimizedForSize*)[[[TestOptimizedForSize builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TestOptimizedForSize_Builder*) builder {
  return [[[TestOptimizedForSize_Builder alloc] init] autorelease];
}
+ (TestOptimizedForSize_Builder*) builderWithPrototype:(TestOptimizedForSize*) prototype {
  return [[TestOptimizedForSize builder] mergeFrom:prototype];
}
- (TestOptimizedForSize_Builder*) builder {
  return [TestOptimizedForSize builder];
}
@end

@interface TestOptimizedForSize_Builder()
@property (retain) TestOptimizedForSize* result;
@end

@implementation TestOptimizedForSize_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.result = [[[TestOptimizedForSize alloc] init] autorelease];
  }
  return self;
}
- (PBExtendableMessage*) internalGetResult {
  return result;
}
- (TestOptimizedForSize_Builder*) clear {
  self.result = [[[TestOptimizedForSize alloc] init] autorelease];
  return self;
}
- (TestOptimizedForSize_Builder*) clone {
  return [TestOptimizedForSize builderWithPrototype:result];
}
- (TestOptimizedForSize*) defaultInstance {
  return [TestOptimizedForSize defaultInstance];
}
- (TestOptimizedForSize*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (TestOptimizedForSize*) buildPartial {
  TestOptimizedForSize* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (TestOptimizedForSize_Builder*) mergeFrom:(TestOptimizedForSize*) other {
  if (other == [TestOptimizedForSize defaultInstance]) {
    return self;
  }
  if (other.hasI) {
    [self setI:other.i];
  }
  if (other.hasMsg) {
    [self mergeMsg:other.msg];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (TestOptimizedForSize_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (TestOptimizedForSize_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setI:[input readInt32]];
        break;
      }
      case 154: {
        ForeignMessage_Builder* subBuilder = [ForeignMessage builder];
        if (self.hasMsg) {
          [subBuilder mergeFrom:self.msg];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setMsg:[subBuilder buildPartial]];
        break;
      }
    }
  }
}
- (BOOL) hasI {
  return result.hasI;
}
- (int32_t) i {
  return result.i;
}
- (TestOptimizedForSize_Builder*) setI:(int32_t) value {
  result.hasI = YES;
  result.i = value;
  return self;
}
- (TestOptimizedForSize_Builder*) clearI {
  result.hasI = NO;
  result.i = 0;
  return self;
}
- (BOOL) hasMsg {
  return result.hasMsg;
}
- (ForeignMessage*) msg {
  return result.msg;
}
- (TestOptimizedForSize_Builder*) setMsg:(ForeignMessage*) value {
  result.hasMsg = YES;
  result.msg = value;
  return self;
}
- (TestOptimizedForSize_Builder*) setMsgBuilder:(ForeignMessage_Builder*) builderForValue {
  return [self setMsg:[builderForValue build]];
}
- (TestOptimizedForSize_Builder*) mergeMsg:(ForeignMessage*) value {
  if (result.hasMsg &&
      result.msg != [ForeignMessage defaultInstance]) {
    result.msg =
      [[[ForeignMessage builderWithPrototype:result.msg] mergeFrom:value] buildPartial];
  } else {
    result.msg = value;
  }
  result.hasMsg = YES;
  return self;
}
- (TestOptimizedForSize_Builder*) clearMsg {
  result.hasMsg = NO;
  result.msg = [ForeignMessage defaultInstance];
  return self;
}
@end

@interface TestRequiredOptimizedForSize ()
@property int32_t x;
@end

@implementation TestRequiredOptimizedForSize

- (BOOL) hasX {
  return hasX;
}
- (void) setHasX:(BOOL) hasX_ {
  hasX = hasX_;
}
@synthesize x;
- (void) dealloc {
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.x = 0;
  }
  return self;
}
static TestRequiredOptimizedForSize* defaultTestRequiredOptimizedForSizeInstance = nil;
+ (void) initialize {
  if (self == [TestRequiredOptimizedForSize class]) {
    defaultTestRequiredOptimizedForSizeInstance = [[TestRequiredOptimizedForSize alloc] init];
  }
}
+ (TestRequiredOptimizedForSize*) defaultInstance {
  return defaultTestRequiredOptimizedForSizeInstance;
}
- (TestRequiredOptimizedForSize*) defaultInstance {
  return defaultTestRequiredOptimizedForSizeInstance;
}
- (BOOL) isInitialized {
  if (!hasX) {
    return NO;
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (hasX) {
    [output writeInt32:1 value:self.x];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (hasX) {
    size += computeInt32Size(1, self.x);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (TestRequiredOptimizedForSize*) parseFromData:(NSData*) data {
  return (TestRequiredOptimizedForSize*)[[[TestRequiredOptimizedForSize builder] mergeFromData:data] build];
}
+ (TestRequiredOptimizedForSize*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestRequiredOptimizedForSize*)[[[TestRequiredOptimizedForSize builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (TestRequiredOptimizedForSize*) parseFromInputStream:(NSInputStream*) input {
  return (TestRequiredOptimizedForSize*)[[[TestRequiredOptimizedForSize builder] mergeFromInputStream:input] build];
}
+ (TestRequiredOptimizedForSize*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestRequiredOptimizedForSize*)[[[TestRequiredOptimizedForSize builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TestRequiredOptimizedForSize*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (TestRequiredOptimizedForSize*)[[[TestRequiredOptimizedForSize builder] mergeFromCodedInputStream:input] build];
}
+ (TestRequiredOptimizedForSize*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestRequiredOptimizedForSize*)[[[TestRequiredOptimizedForSize builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TestRequiredOptimizedForSize_Builder*) builder {
  return [[[TestRequiredOptimizedForSize_Builder alloc] init] autorelease];
}
+ (TestRequiredOptimizedForSize_Builder*) builderWithPrototype:(TestRequiredOptimizedForSize*) prototype {
  return [[TestRequiredOptimizedForSize builder] mergeFrom:prototype];
}
- (TestRequiredOptimizedForSize_Builder*) builder {
  return [TestRequiredOptimizedForSize builder];
}
@end

@interface TestRequiredOptimizedForSize_Builder()
@property (retain) TestRequiredOptimizedForSize* result;
@end

@implementation TestRequiredOptimizedForSize_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.result = [[[TestRequiredOptimizedForSize alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (TestRequiredOptimizedForSize_Builder*) clear {
  self.result = [[[TestRequiredOptimizedForSize alloc] init] autorelease];
  return self;
}
- (TestRequiredOptimizedForSize_Builder*) clone {
  return [TestRequiredOptimizedForSize builderWithPrototype:result];
}
- (TestRequiredOptimizedForSize*) defaultInstance {
  return [TestRequiredOptimizedForSize defaultInstance];
}
- (TestRequiredOptimizedForSize*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (TestRequiredOptimizedForSize*) buildPartial {
  TestRequiredOptimizedForSize* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (TestRequiredOptimizedForSize_Builder*) mergeFrom:(TestRequiredOptimizedForSize*) other {
  if (other == [TestRequiredOptimizedForSize defaultInstance]) {
    return self;
  }
  if (other.hasX) {
    [self setX:other.x];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (TestRequiredOptimizedForSize_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (TestRequiredOptimizedForSize_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
        [self setX:[input readInt32]];
        break;
      }
    }
  }
}
- (BOOL) hasX {
  return result.hasX;
}
- (int32_t) x {
  return result.x;
}
- (TestRequiredOptimizedForSize_Builder*) setX:(int32_t) value {
  result.hasX = YES;
  result.x = value;
  return self;
}
- (TestRequiredOptimizedForSize_Builder*) clearX {
  result.hasX = NO;
  result.x = 0;
  return self;
}
@end

@interface TestOptionalOptimizedForSize ()
@property (retain) TestRequiredOptimizedForSize* o;
@end

@implementation TestOptionalOptimizedForSize

- (BOOL) hasO {
  return hasO;
}
- (void) setHasO:(BOOL) hasO_ {
  hasO = hasO_;
}
@synthesize o;
- (void) dealloc {
  self.o = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.o = [TestRequiredOptimizedForSize defaultInstance];
  }
  return self;
}
static TestOptionalOptimizedForSize* defaultTestOptionalOptimizedForSizeInstance = nil;
+ (void) initialize {
  if (self == [TestOptionalOptimizedForSize class]) {
    defaultTestOptionalOptimizedForSizeInstance = [[TestOptionalOptimizedForSize alloc] init];
  }
}
+ (TestOptionalOptimizedForSize*) defaultInstance {
  return defaultTestOptionalOptimizedForSizeInstance;
}
- (TestOptionalOptimizedForSize*) defaultInstance {
  return defaultTestOptionalOptimizedForSizeInstance;
}
- (BOOL) isInitialized {
  if (hasO) {
    if (!self.o.isInitialized) {
      return NO;
    }
  }
  return YES;
}
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output {
  if (hasO) {
    [output writeMessage:1 value:self.o];
  }
  [self.unknownFields writeToCodedOutputStream:output];
}
- (int32_t) serializedSize {
  int32_t size = memoizedSerializedSize;
  if (size != -1) {
    return size;
  }

  size = 0;
  if (hasO) {
    size += computeMessageSize(1, self.o);
  }
  size += self.unknownFields.serializedSize;
  memoizedSerializedSize = size;
  return size;
}
+ (TestOptionalOptimizedForSize*) parseFromData:(NSData*) data {
  return (TestOptionalOptimizedForSize*)[[[TestOptionalOptimizedForSize builder] mergeFromData:data] build];
}
+ (TestOptionalOptimizedForSize*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestOptionalOptimizedForSize*)[[[TestOptionalOptimizedForSize builder] mergeFromData:data extensionRegistry:extensionRegistry] build];
}
+ (TestOptionalOptimizedForSize*) parseFromInputStream:(NSInputStream*) input {
  return (TestOptionalOptimizedForSize*)[[[TestOptionalOptimizedForSize builder] mergeFromInputStream:input] build];
}
+ (TestOptionalOptimizedForSize*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestOptionalOptimizedForSize*)[[[TestOptionalOptimizedForSize builder] mergeFromInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TestOptionalOptimizedForSize*) parseFromCodedInputStream:(PBCodedInputStream*) input {
  return (TestOptionalOptimizedForSize*)[[[TestOptionalOptimizedForSize builder] mergeFromCodedInputStream:input] build];
}
+ (TestOptionalOptimizedForSize*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
  return (TestOptionalOptimizedForSize*)[[[TestOptionalOptimizedForSize builder] mergeFromCodedInputStream:input extensionRegistry:extensionRegistry] build];
}
+ (TestOptionalOptimizedForSize_Builder*) builder {
  return [[[TestOptionalOptimizedForSize_Builder alloc] init] autorelease];
}
+ (TestOptionalOptimizedForSize_Builder*) builderWithPrototype:(TestOptionalOptimizedForSize*) prototype {
  return [[TestOptionalOptimizedForSize builder] mergeFrom:prototype];
}
- (TestOptionalOptimizedForSize_Builder*) builder {
  return [TestOptionalOptimizedForSize builder];
}
@end

@interface TestOptionalOptimizedForSize_Builder()
@property (retain) TestOptionalOptimizedForSize* result;
@end

@implementation TestOptionalOptimizedForSize_Builder
@synthesize result;
- (void) dealloc {
  self.result = nil;
  [super dealloc];
}
- (id) init {
  if (self = [super init]) {
    self.result = [[[TestOptionalOptimizedForSize alloc] init] autorelease];
  }
  return self;
}
- (PBGeneratedMessage*) internalGetResult {
  return result;
}
- (TestOptionalOptimizedForSize_Builder*) clear {
  self.result = [[[TestOptionalOptimizedForSize alloc] init] autorelease];
  return self;
}
- (TestOptionalOptimizedForSize_Builder*) clone {
  return [TestOptionalOptimizedForSize builderWithPrototype:result];
}
- (TestOptionalOptimizedForSize*) defaultInstance {
  return [TestOptionalOptimizedForSize defaultInstance];
}
- (TestOptionalOptimizedForSize*) build {
  [self checkInitialized];
  return [self buildPartial];
}
- (TestOptionalOptimizedForSize*) buildPartial {
  TestOptionalOptimizedForSize* returnMe = [[result retain] autorelease];
  self.result = nil;
  return returnMe;
}
- (TestOptionalOptimizedForSize_Builder*) mergeFrom:(TestOptionalOptimizedForSize*) other {
  if (other == [TestOptionalOptimizedForSize defaultInstance]) {
    return self;
  }
  if (other.hasO) {
    [self mergeO:other.o];
  }
  [self mergeUnknownFields:other.unknownFields];
  return self;
}
- (TestOptionalOptimizedForSize_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input {
  return [self mergeFromCodedInputStream:input extensionRegistry:[PBExtensionRegistry emptyRegistry]];
}
- (TestOptionalOptimizedForSize_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry {
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
      case 10: {
        TestRequiredOptimizedForSize_Builder* subBuilder = [TestRequiredOptimizedForSize builder];
        if (self.hasO) {
          [subBuilder mergeFrom:self.o];
        }
        [input readMessage:subBuilder extensionRegistry:extensionRegistry];
        [self setO:[subBuilder buildPartial]];
        break;
      }
    }
  }
}
- (BOOL) hasO {
  return result.hasO;
}
- (TestRequiredOptimizedForSize*) o {
  return result.o;
}
- (TestOptionalOptimizedForSize_Builder*) setO:(TestRequiredOptimizedForSize*) value {
  result.hasO = YES;
  result.o = value;
  return self;
}
- (TestOptionalOptimizedForSize_Builder*) setOBuilder:(TestRequiredOptimizedForSize_Builder*) builderForValue {
  return [self setO:[builderForValue build]];
}
- (TestOptionalOptimizedForSize_Builder*) mergeO:(TestRequiredOptimizedForSize*) value {
  if (result.hasO &&
      result.o != [TestRequiredOptimizedForSize defaultInstance]) {
    result.o =
      [[[TestRequiredOptimizedForSize builderWithPrototype:result.o] mergeFrom:value] buildPartial];
  } else {
    result.o = value;
  }
  result.hasO = YES;
  return self;
}
- (TestOptionalOptimizedForSize_Builder*) clearO {
  result.hasO = NO;
  result.o = [TestRequiredOptimizedForSize defaultInstance];
  return self;
}
@end

