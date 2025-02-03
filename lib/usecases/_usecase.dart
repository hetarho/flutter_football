abstract class Usecase<T,K> {
  Future<T> execute(K params);
}

abstract class UsecaseNoParams<T> {
  Future<T> execute();
}
