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

typedef enum {
    WireFormatVarint = 0,
    WireFormatFixed64 = 1,
    WireFormatLengthDelimited = 2,
    WireFormatStartGroup = 3,
    WireFormatEndGroup = 4,
    WireFormatFixed32 = 5,
    
    TAG_TYPE_BITS = 3,
    TAG_TYPE_MASK = 7 /* = (1 << TAG_TYPE_BITS) - 1*/,
    
    WireFormatMessageSetItem = 1,
    WireFormatMessageSetTypeId = 2,
    WireFormatMessageSetMessage = 3
} WireFormat;
    
int32_t WireFormatMakeTag(int32_t fieldNumber, int32_t wireType);
int32_t WireFormatGetTagWireType(int32_t tag);
int32_t WireFormatGetTagFieldNumber(int32_t tag);