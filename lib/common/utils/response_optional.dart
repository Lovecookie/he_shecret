part of util;

typedef FResOptional<T> = FResponseOptional<T>;
typedef FNullResOpt<T> = FNullResponseOptional<T>;
typedef FFutureResOptional<T> = Future<FResOptional<T>>;

class FResponseOptional<T> {
  final int _resultCode;
  final T? _value;

  FResponseOptional(T? v, {int resultCode = FResultCode.success})
      : _value = v,
        _resultCode = resultCode;

  bool get isSuccess => _resultCode == 0;
  int get resultCode => _resultCode;
  bool get hasValue => _value != null;
  T get value => _value!;

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() {
    return 'FResponseOpt{value: $_value}';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FResOptional && runtimeType == other.runtimeType && _value == other._value;
  }
}

class FNullResponseOptional<T> extends FResOptional<T> {
  FNullResponseOptional(int resultCode) : super(null, resultCode: resultCode);

  factory FNullResponseOptional.unknownError() {
    return FNullResponseOptional(FResultCode.unknownError);
  }

  factory FNullResponseOptional.parseJsonError() {
    return FNullResponseOptional(FResultCode.parseJsonError);
  }
}
