package com.google.common.base;

public class Pair<A, B> {
  private final A first;
  private final B second;

  public Pair(A first, B second) {
    this.first = first;
    this.second = second;
  }

  public A getFirst() {
    return first;
  }

  public B getSecond() {
    return second;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (!(o instanceof Pair)) return false;

    Pair pair = (Pair) o;

    if (first != null ? !first.equals(pair.first) : pair.first != null) return false;
    if (second != null ? !second.equals(pair.second) : pair.second != null) return false;

    return true;
  }

  @Override
  public int hashCode() {
    int result;
    result = (first != null ? first.hashCode() : 0);
    result = 31 * result + (second != null ? second.hashCode() : 0);
    return result;
  }

  @Override
  public String toString() {
    return "(Pair " + getFirst() + " " + getSecond() + ")";
  }
}
