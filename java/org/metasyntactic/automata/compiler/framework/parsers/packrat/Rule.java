// Copyright 2008 Google Inc. All rights reserved.

package org.metasyntactic.automata.compiler.framework.parsers.packrat;

import org.metasyntactic.automata.compiler.framework.parsers.Source;
import org.metasyntactic.automata.compiler.framework.parsers.packrat.expressions.Expression;
import org.metasyntactic.automata.compiler.util.Function4;
import org.metasyntactic.common.base.Preconditions;

import java.util.Map;

/**
 * A {@code rule} has the form A ? e, where A is a nonterminal symbol and e is a parsing expression.
 *
 * @author cyrusn@google.com (Cyrus Najmabadi)
 */
public class Rule {
  private final String variable;
  private final Expression expression;

  public Rule(String variable, Expression expression) {
    Preconditions.checkNotNull(variable);
    Preconditions.checkNotNull(expression);

    this.variable = variable.intern();
    this.expression = expression;
  }

  public String getVariable() {
    return variable;
  }

  public Expression getExpression() {
    return expression;
  }

   public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof Rule)) {
      return false;
    }

    Rule rule = (Rule) o;

    if (!variable.equals(rule.variable)) {
      return false;
    }
    if (!expression.equals(rule.expression)) {
      return false;
    }

    return true;
  }

   public int hashCode() {
    int result;
    result = variable.hashCode();
    result = 31 * result + expression.hashCode();
    return result;
  }

   public String toString() {
    return "(Rule " + getVariable() + " -> " + getExpression() + ")";
  }

  private Map<String, Function4<Object, Source, Integer, Integer, Object>> cachedMap;
  private Function4<Object, Source, Integer, Integer, Object> cachedAction;

  public Function4<Object, Source, Integer, Integer, Object> getAction(
      Map<String, Function4<Object, Source, Integer, Integer, Object>> actions) {
    if (cachedMap != actions) {
      cachedMap = actions;
      cachedAction = actions.get(this.variable);
    }

    return cachedAction;
  }
}
