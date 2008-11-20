package com.google.automata.compiler.python.scanner.literals;

import com.google.automata.compiler.util.UnimplementedException;

/**
 * Created by IntelliJ IDEA.
 * User: cyrusn
 * Date: Jun 22, 2008
 * Time: 6:55:59 PM
 * To change this template use File | Settings | File Templates.
 */
public class StringLiteralToken extends LiteralToken<String> {
  public StringLiteralToken(String text) {
    super(text);
  }

  @Override public String getValue() {
    throw new UnimplementedException();
  }
}