part of util;

class FOptional<T> {
  final T? _value;

  FOptional(T? v) : _value = v;

  bool get hasValue => _value != null;
  T get value => _value!;

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() {
    return 'FOptional{value: $_value}';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is FOptional && runtimeType == other.runtimeType && _value == other._value;
  }
}

class FNullOpt<T> extends FOptional<T> {
  FNullOpt() : super(null);
}

typedef FFutureOptional<T> = Future<FOptional<T>>;
