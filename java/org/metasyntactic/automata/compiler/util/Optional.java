// Copyright 2008 Google Inc. All rights reserved.

package org.metasyntactic.automata.compiler.util;

/**
 * TODO(cyrusn): javadoc
 *
 * @author cyrusn@google.com (Cyrus Najmabadi)
 */
public interface Optional<T> {
  boolean hasValue();

  T value();
}
