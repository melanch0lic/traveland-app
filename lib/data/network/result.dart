import 'package:reflectable/reflectable.dart';
import 'api_error.dart';
import 'reflector.dart';

typedef OnSuccess<T> = void Function(T result);
typedef OnFailure = void Function(Exception exception, ApiError? error);

abstract class Result<T> {
  Result();

  bool isSuccess() {
    return this is Success;
  }

  void fold(OnSuccess<T> onSuccess, OnFailure onFailure) {
    if (isSuccess()) {
      onSuccess((this as Success).value as T);
    } else {
      final failure = this as Failure;
      onFailure(failure.exception, failure.error);
    }
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    final reflector = ApiModelReflector.reflector();
    final ClassMirror mirror = reflector.reflectType(T) as ClassMirror;
    final instance = mirror.newInstance('fromJson', [json]) as T;
    return Success(instance);
  }
}

class Success<T> extends Result<T> {
  final T value;

  Success(this.value);
}

class Failure<T> extends Result<T> {
  final Exception exception;
  final ApiError? error;

  Failure({required this.exception, this.error});
}
