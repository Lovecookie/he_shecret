part of util;

class FOptResult<T> {
  final int _resultCode;
  final T? _value;

  FOptResult(this._resultCode, T? v) : _value = v;

  bool get isSuccess => _resultCode == 0;
  int get resultCode => _resultCode;
  bool get hasValue => _value != null;
  T get value => _value!;

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() {
    return 'FOptResult{value: $_value}';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is FOptResult && runtimeType == other.runtimeType && _value == other._value;
  }
}

class FNullOptResult<T> extends FOptResult<T> {
  FNullOptResult(int? resultCode) : super(resultCode ?? FResultCode.unkownError, null);
}

typedef FFutureOptResult<T> = Future<FOptResult<T>>;
