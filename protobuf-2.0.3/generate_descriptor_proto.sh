#!/bin/sh

# Run this script to regenerate descriptor.pb.{h,cc} after the protocol
# compiler changes.  Since these files are compiled into the protocol compiler
# itself, they cannot be generated automatically by a make rule.  "make check"
# will fail if these files do not match what the protocol compiler would
# generate.

if test ! -e src/google/protobuf/stubs/common.h; then
  cat >&2 << __EOF__
Could not find source code.  Make sure you are running this script from the
root of the distribution tree.
__EOF__
  exit 1
fi

if test ! -e src/Makefile; then
  cat >&2 << __EOF__
Could not find src/Makefile.  You must run ./configure (and perhaps
./autogen.sh) first.
__EOF__
  exit 1
fi

cd src
make protoc && ./protoc --cpp_out=dllexport_decl=LIBPROTOBUF_EXPORT:. google/protobuf/descriptor.proto
make protoc && ./protoc --cpp_out=dllexport_decl=LIBPROTOBUF_EXPORT:. google/protobuf/objectivec-descriptor.proto
cd ..
