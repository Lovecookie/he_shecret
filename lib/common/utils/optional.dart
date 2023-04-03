part of utils;

class FOptional<T> {
  final T? value;

  FOptional(T? v) : value = v;

  bool get hasValue => value != null;
}

class FNullOpt<T> extends FOptional<T> {
  FNullOpt() : super(null);
}
