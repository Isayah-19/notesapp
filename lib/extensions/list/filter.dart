extension Filter<T> on Stream<List<T>> {
  Stream<List<T>> filter(bool Function(T) where) =>
      map((items) => items.where(where).toList());
}
//Explanation
// We have a Stream containing a List of things, now we want a stream of the List of
// the same things as long as those things(any individual thing) passes a specific test  