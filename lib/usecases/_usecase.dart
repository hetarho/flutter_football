abstract class Usecase<T,K> {
  Future<T> execute(K params);
}
