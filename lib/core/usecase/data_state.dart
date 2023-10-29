abstract class DataState<T> {}

class DataSuccess<T> extends DataState<T> {
  final T data;
  DataSuccess(this.data);
}

class DataFailure<T> extends DataState<T> {
  final int code;
  final String message;

  DataFailure(this.code, this.message);
}

class IgnoreState<T> extends DataState<T> {}

class LoadingState<T> extends DataState<T> {}
