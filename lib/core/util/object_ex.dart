R run<R>(R Function() operation) {
  return operation();
}

extension ScopeFunctionsForObject<T extends Object> on T {
  R let<R>(R Function(T it) o) {
    return o(this);
  }

  T also(void Function(T it) o) {
    o(this);
    return this;
  }
}

extension IterableExtensions<T> on Iterable<T>? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  int get length {
    return this == null ? 0 : this!.length;
  }
}
